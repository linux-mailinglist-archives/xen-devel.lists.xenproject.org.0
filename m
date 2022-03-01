Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C264C8CD3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281462.479802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2jh-00051r-2w; Tue, 01 Mar 2022 13:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281462.479802; Tue, 01 Mar 2022 13:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2jg-000500-Vv; Tue, 01 Mar 2022 13:40:16 +0000
Received: by outflank-mailman (input) for mailman id 281462;
 Tue, 01 Mar 2022 13:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNgs=TM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nP2je-0004zu-SF
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:40:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ee861eb-9965-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 14:40:14 +0100 (CET)
Received: from AM5PR0601CA0047.eurprd06.prod.outlook.com
 (2603:10a6:203:68::33) by AM4PR0802MB2324.eurprd08.prod.outlook.com
 (2603:10a6:200:5f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 13:40:00 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::ca) by AM5PR0601CA0047.outlook.office365.com
 (2603:10a6:203:68::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Tue, 1 Mar 2022 13:40:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 13:40:00 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Tue, 01 Mar 2022 13:39:59 +0000
Received: from f9ac703d02b1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34767BB8-C71B-4241-B039-0B7209675DD7.1; 
 Tue, 01 Mar 2022 13:39:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9ac703d02b1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 13:39:49 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by HE1PR0802MB2602.eurprd08.prod.outlook.com (2603:10a6:3:e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 13:39:47 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 13:39:47 +0000
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
X-Inumbo-ID: 1ee861eb-9965-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o54D5Ouvu3ReLaYNHPl9bo5bDSn+jk5JPf3ZQyesVtY=;
 b=g0+WPbcV+TdBHnifaM0+LlHUVXpLvwfQ7firzUcZXNI1ZTgF4M6WoRiTFjB2hPwPeWaAvI/0JudEkD589e/kRbs7krc5bG7afHRVrUzt3iM17Gn1de1Qq6DZIVP4AOYKYCj5EBVCLDnsh/hBXdw56Y1C/IhGVtSTm5i9F+OALiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b7deb144c4fe53a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABEosmYa8BbLW6jRK6lmNDMU7CIcDm7/KFcHHPxarsNYWpWQP63GuSi5UQbCSlhVFH+HerwcOsjMbVR403rOKb2FszbdQmWG85fjLU2yvIct7WbEPh4PZbuHG5TDUEZLTYrLCwmRFZhFmgKXgbzg1+Zk8PI0/N2e84xrlE1SdfRzSszqbwVWQYVxB1WOVRERL5C8+rekwBhHppN/IoR//OqrpmRVv/yDFhuiUopbO4RIc3F0tgg+fH8rals8COSAea2BZdmX+IWbThYY8usPTxCdTNXM+NcU0hgcDAAb3yr6oDl+96+IlU9FrvDYO6L3YlHT/x+qxvOojXvApw6Feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o54D5Ouvu3ReLaYNHPl9bo5bDSn+jk5JPf3ZQyesVtY=;
 b=Ddc9PFm8nWOTXRQdhtXJaIOT31eqEktkKxZEgW5YWfexDQKZZE2TOpZRAAvEhiJOI5Oq+yLjkGBVbVxoLSGyDyfCTKgjHWTQgCF0oSyyGKukEywnH8bxDu3DjnkDZIwEAX6amNjrH0olf5mrbC6bQ1g/Dm4ItxxrwJZOr3w7qQ67k1YMp7QqY5UQGfbpnrFhpbrzmrbm9RzGUyhbpqBeoVk8vF7fBKcLciNmJYTIhKKXF1WNzGu1EC0O7VEUiAt6zX5+par/MC37x6qZTJOGpRJOm8oBklNU+v7XeFQzYL1aHElHT2LaY2OC3HASx4Mogu4rKt8gJzqcZbqpwn5HAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o54D5Ouvu3ReLaYNHPl9bo5bDSn+jk5JPf3ZQyesVtY=;
 b=g0+WPbcV+TdBHnifaM0+LlHUVXpLvwfQ7firzUcZXNI1ZTgF4M6WoRiTFjB2hPwPeWaAvI/0JudEkD589e/kRbs7krc5bG7afHRVrUzt3iM17Gn1de1Qq6DZIVP4AOYKYCj5EBVCLDnsh/hBXdw56Y1C/IhGVtSTm5i9F+OALiI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>
Subject: Re: [RFC PATCH 0/2] Introduce reserved Xenheap
Thread-Topic: [RFC PATCH 0/2] Introduce reserved Xenheap
Thread-Index: AQHYKR4hXoXrj++ew0mI1ZjbqpdQh6yktMKAgAPeNACAAMMegIABO0+A
Date: Tue, 1 Mar 2022 13:39:47 +0000
Message-ID: <316007B7-51BA-4820-8F6F-018BC6D3A077@arm.com>
References: <20220224013023.50920-1-Henry.Wang@arm.com>
 <6269ec3d-039e-d68f-771d-c5e088631410@xen.org>
 <PA4PR08MB625324910ED4D40383191F9D92019@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <48a0712c-eff8-dfc1-2136-59317f22321f@xen.org>
In-Reply-To: <48a0712c-eff8-dfc1-2136-59317f22321f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2d4d3b6c-cf5e-4402-0fdd-08d9fb88fb5b
x-ms-traffictypediagnostic:
	HE1PR0802MB2602:EE_|AM5EUR03FT029:EE_|AM4PR0802MB2324:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB232411F86D43328AABA917EC9D029@AM4PR0802MB2324.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wGSIFR8+r5hUX0kgNNngt9odj+fLJFKXQhp4+aK/u848YYdbrZ/N5LjrzmVQuDvdNh/ksQewSKsDXRcrJC8yIo4le21PPHGML+YK9lF73aF0dNsZVJM42jmEX1PJUuppl/eM96Wtk0gpVyqPMxKkWYVNVnJMvWiPgc2vr9XEXj4+ja5/++1lNTxeMpZy7xyizj52grnk+9Sk0GqZkjuXArRfeq7XCyEVYWTP9S8TrNSRIRLHyIsfGa03Ruo/9JsRX7J8zfvG3sQT9IWg5BIzh0iSoNEoZQXtQZyI/1LgQMQ5vzTROAi4+WMo3nFp3yWEIi7m7c3heR8hl9P3Z38Paub35m9XP22M4qoVWQ8zf0kZqwz88Dw4nr66sUMiIeqKpGcm4VtxPT9VbaPbIAWilWOdyrTilVz41INTh/IjndXdX8HhOfxLGcfHzbjemxHd5WcSEibvlmdSKbKKV2RDJ9oZenPS6zt+Qd75/BtSkQeZZNnpih+p7nenXikzIufzv7/ULxWWu8orapateO7ngfsrobgY8s0AQpJBWWuPWyYLndAcfWTsMeNIRnBMBwUpE1iF3i+p9gTjIdL9Rb12kLyi61x8ieUnZ7dwxDu2sNjWabfGpDn9Az6UpxWsE/EreDLmREYmRQSS+BlfkYTeerOZG88idO6515ZXPSzl/YdxNQGHgTNz+zuY1r+xCuINAtvdlTu1Ph+4qqlj2VjdOSIcHF5dOIodgyeSdA5B2Xw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6486002)(71200400001)(36756003)(6512007)(38100700002)(6506007)(122000001)(83380400001)(508600001)(6916009)(54906003)(8936002)(316002)(4326008)(86362001)(38070700005)(5660300002)(2616005)(2906002)(33656002)(26005)(186003)(66446008)(66476007)(66946007)(91956017)(64756008)(76116006)(66556008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D659674B821CD24D8BD52527FAC072FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2602
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c354b0de-36b8-48ed-e5a9-08d9fb88f3cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wy33sZjvoer/qDocw4lkA1MP5ixR00JXpJRKNNUiQcDW9OvusFR5cdtRAp7yB6AmEatpnAQEdVwx5k9f6zqL3PgJk7/L+obgqzdYYgXDLvcwCLOV0p6gpZzCy50rQMb3WyBkxd3VulNbYem2VA6XpBFnBo42/whyui0lO/1cOT2A8aoIhNjbaDxejDTzMY2qG3xtGr3lYFI+z8TI+PpbGinUOREAZL1Kwrr2btg+qXCNJzmNl3+GOcu8zRbQVQPESUSWYYHIF9Bqp6f5XkmKR+XxR2XFQU/9eYpURxxtTEtvG59mEOHFhnNaqVCpeFVY34vu///SlyaXy6a9Jntre+KcAMKxLtUMfyxDzKX/8M4Dyuw733//NX1+Xgtjoi0ijLCZerEY6jfaUc0DzieZJG8JYn+i0LawnQivoBJtT8jYeThQ9RCTXe+XoGQE47+dwYOH16rlJbPXADtYh8lV1lE4PISU8s0rmQEWqR8nsBIW8oaMAe08Pm9MZxc8b9zxzHbZuUREABqrzlIka+H+DPnRtsVsy0DVcHd3RAjD/oN1FXJRFkPBiy9lA88TAnZkxdyIZFR7B1vZQ8FkYN6pdQrh3ME64Kqi55nYPohvx+7CcfdC7VdTuWtcXYBzoc+6a/t5pXJJJIM83W8C4rj/BM6h5yoqixfmvCD2fLfGPfgxBAfWkTAcWYTKkYT2CAkw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(336012)(186003)(26005)(81166007)(40460700003)(2616005)(83380400001)(47076005)(8936002)(33656002)(36756003)(5660300002)(2906002)(36860700001)(82310400004)(70206006)(70586007)(6512007)(6486002)(6506007)(53546011)(508600001)(356005)(54906003)(86362001)(8676002)(6862004)(4326008)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 13:40:00.0183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4d3b6c-cf5e-4402-0fdd-08d9fb88fb5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2324

Hi,

> On 28 Feb 2022, at 18:51, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 28/02/2022 07:12, Henry Wang wrote:
>> Hi Julien,
>=20
> Hi Henry,
>=20
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Sent: Saturday, February 26, 2022 4:09 AM
>>> To: Henry Wang <Henry.Wang@arm.com>; xen-devel@lists.xenproject.org;
>>> sstabellini@kernel.org
>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>>> <Wei.Chen@arm.com>; Penny Zheng <Penny.Zheng@arm.com>
>>> Subject: Re: [RFC PATCH 0/2] Introduce reserved Xenheap
>>>=20
>>> Hi Henry,
>>>=20
>>> On 24/02/2022 01:30, Henry Wang wrote:
>>>> The reserved Xenheap, or statically configured Xenheap, refers to part=
s
>>>> of RAM reserved in the beginning for Xenheap. Like the static memory
>>>> allocation, such reserved Xenheap regions are reserved by configuratio=
n
>>>> in the device tree using physical address ranges.
>>>=20
>>> In Xen, we have the concept of domheap and xenheap. For Arm64 and x86
>>> they would be the same. But for Arm32, they would be different: xenheap
>>> is always mapped whereas domheap is separate.
>>>=20
>>> Skimming through the series, I think you want to use the region for bot=
h
>>> domheap and xenheap. Is that correct?
>> Yes I think that would be correct, for Arm32, instead of using the full
>> `ram_pages` as the initial value of `heap_pages`, we want to use the
>> region specified in the device tree. But we are confused if this is the
>> correct (or preferred) way for Arm32, so in this series we only
>> implemented the reserved heap for Arm64.
>=20
> That's an interesting point. When I skimmed through the series on Friday,=
 my first thought was that for arm32 it would be only xenheap (so
> all the rest of memory is domheap).
>=20
> However, Xen can allocate memory from domheap for its own purpose (e.g. w=
e don't need contiguous memory, or for page-tables).
>=20
> In a fully static environment, the domheap and xenheap are both going to =
be quite small. It would also be somewhat difficult for a user to size it. =
So I think, it would be easier to use the region you introduce for both dom=
heap and xenheap.
>=20
> Stefano, Bertrand, any opionions?

Only one region is easier to configure and I think in this case it will als=
o prevent lots of over allocation.
So in a full static case, having only one heap is a good strategy for now.

There might be some cases where someone would want to fully control the mem=
ory allocated by Xen per domain and in this case be able to size it for eac=
h guest (to make sure one guest cannot be impacted by an other at all).
But this is definitely something that could be done later, if needed.

Cheers
Bertrand

>=20
> On a separate topic, I think we need some documentation explaining how a =
user can size the xenheap. How did you figure out for your setup?
>=20
>>>=20
>>> Furthemore, now that we are introducing more static region, it will get
>>> easier to overlap the regions by mistakes. I think we want to have some
>>> logic in Xen (or outside) to ensure that none of them overlaps. Do you
>>> have any plan for that?
>> Totally agree with this idea, but before we actually implement the code,
>> we would like to firstly share our thoughts on this: One option could be=
 to
>> add data structures to notes down these static memory regions when the
>> device tree is parsed, and then we can check if they are overlapped.
>=20
> This should work.
>=20
>> Over
>> the long term (and this long term option is currently not in our plan),
>> maybe we can add something in the Xen toolstack for this usage?
>=20
> When I read "Xen toolstack", I read the tools that will run in dom0. Is i=
t what you meant?
>=20
>> Also, I am wondering if the overlapping check logic should be introduced
>> in this series. WDYT?
>=20
> I would do that in a separate series.
>=20
> Cheers,
>=20
> --=20
> Julien Grall


