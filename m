Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D292E57E14C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 14:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373175.605242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oErRg-0001NI-52; Fri, 22 Jul 2022 12:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373175.605242; Fri, 22 Jul 2022 12:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oErRg-0001L7-23; Fri, 22 Jul 2022 12:07:52 +0000
Received: by outflank-mailman (input) for mailman id 373175;
 Fri, 22 Jul 2022 12:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdc0=X3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oErRe-0001Ky-AZ
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 12:07:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130087.outbound.protection.outlook.com [40.107.13.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5d3e3b5-09b6-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 14:07:48 +0200 (CEST)
Received: from AS9PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:20b:46c::11)
 by VI1PR0802MB2509.eurprd08.prod.outlook.com (2603:10a6:800:b7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 12:07:44 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::de) by AS9PR07CA0001.outlook.office365.com
 (2603:10a6:20b:46c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Fri, 22 Jul 2022 12:07:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 12:07:43 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 22 Jul 2022 12:07:42 +0000
Received: from 824464693877.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5AA2331E-A7B4-4DC5-95CA-1413BC2A0A49.1; 
 Fri, 22 Jul 2022 12:07:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 824464693877.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Jul 2022 12:07:35 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB4952.eurprd08.prod.outlook.com (2603:10a6:20b:e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 12:07:34 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 12:07:33 +0000
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
X-Inumbo-ID: e5d3e3b5-09b6-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jhT0+WS0X0V9Gph6T5FiyFc/A9PZ1782w8q+y7UnSzsX6OuSseAlUOXO0p7gkHxp2+h6ejQr0pir4usSj8RMoRwtvrdMz3aRykvOL7YaOGVjL5QpCDxO3T7kiyxJcu7vE0TFIckOJNYXmPQPgq+zA/B+XyWgUz3KSbNeAycu+z01IdLX0ns4Ftxx+nXCcALQnh6DhVO+m7smY68Gh9QN/GzDzeicskgN9+xzhvXqjDbg4tjHF7saPyxgSowSohWQ+1Mf2KxsvbwFdLrOuiSUbfuItT9dfvSzW93OCjlAz/Xir+Y+Y7SqKNYu436rCOnK+lnbH6ECBdBcEsJDQOiMcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mG94UoF7MulTzX8cPfIShSOi+i1WGT5N+9up7TGyqt8=;
 b=fjOrxQzd3q3K2xGonXNhlkDqJ0tMUWtNBAksS2YG4f3xSlSV2O2wHh4bhQ5sw9mSLCl0zRQW5J8KiNUV7EXd0628XHIL3dXP7wFWCP9Al9V1OOxCUZDjsA5+4Pq7G8D981v1eWCJDP/HDyLviKml/1XrSZzZlSZcVsl4/Ja/7wet7Se1zJ/ss313/H0444FEeOqyxbpyBPkOoouTjxNu6axuImOjNA38VTCqzZM8D5QGFWvZOH2QAUMB7kBI6HefVw4SOrdmBWCPwC1yq3d+iS05iMrpBtFYry4BGcVV0FNz+r/rzwrZlCqBZ1yRd06/EdDGiTGN1xYSn7kcr0z8hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mG94UoF7MulTzX8cPfIShSOi+i1WGT5N+9up7TGyqt8=;
 b=Kved1wokS5q8ab2Ukpu9PZfSLgI/S7Twk/HQ0r/8hjamSynidvGKKDjG2ZDMn304HDpawwoyTc5qRItroWipl68JFuSD59GIPKvhtau4Vm9FrzxRNVXfsSBzCSrduqqi6aCGode6NaFdQtpdV7dnev1QFijb3z9En+t1NL5S+48=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3eb4b800288c9db8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFOUCIvd80ry/k7tAUgMNf/v+h4pwT8l7L4990qNoUppBhQruqkRpiZZGqGG6l2rStrbhs4CqQp1KpAwL857G4CNEXUIz2lGG7SUyltUrr4GpN1j2ljz8hBkT3BxVAXpBaSMjRSWuTZ578GseYR7cLCKGYTOXQI8r0mLySJ2xJjHqsGa1lVHAN+9tVbTsZSDjjJxBEaoJH0dDmbIOnx7PFZecHh0MWNBNp8dkZ2hcUqic3iBRuiiXrrGh1M7W7bhCjdsTYuDzEb6U1fKv2PGnZSWWbZ5dHytOTWWmEUZhcdKlgYAT9POpGd7vV3vkOQx2yIyr1nug7ZGdf3l6O4xTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mG94UoF7MulTzX8cPfIShSOi+i1WGT5N+9up7TGyqt8=;
 b=UXww7AhuvepluhFCpAKLvYwdbk1GYE4WZ0ycW7O3LQ1UebHTxVosqayjJ+CohXalO/JCrwWRCXNcPgu6dhBix2TniKoswraVsJ2GTTMbl5cmZRwWr7lWNa9hAG9bwNDmWARWQBturUNg+1Om2eZ+9OTFi4OyeQdZg0LP0u9TJTjX8sl+HOYeMoUUr8ohF+MWQ4xcXAFfRMydHfp4J/sGYtnn07vGsflLzWtLT05LuWJWz5rCEvTq52GzdxQhXCBM5bTNt47Z20HvZ+EVqHuT4fBvviMuk2iI5gUaG3vaSJzxxO7IlBjsyxJgurYo9koZfi/rl5FzU8mQOEXHHCdQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mG94UoF7MulTzX8cPfIShSOi+i1WGT5N+9up7TGyqt8=;
 b=Kved1wokS5q8ab2Ukpu9PZfSLgI/S7Twk/HQ0r/8hjamSynidvGKKDjG2ZDMn304HDpawwoyTc5qRItroWipl68JFuSD59GIPKvhtau4Vm9FrzxRNVXfsSBzCSrduqqi6aCGode6NaFdQtpdV7dnev1QFijb3z9En+t1NL5S+48=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 08/25] tools/libfsimage: Cleanup makefiles
Thread-Topic: [XEN PATCH v3 08/25] tools/libfsimage: Cleanup makefiles
Thread-Index: AQHYh+Qs/zKTqDbfTEaHrzjY08GxPa2Kd3UA
Date: Fri, 22 Jul 2022 12:07:33 +0000
Message-ID: <50A81854-3FF3-407A-A6DE-E9A7E67D5123@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-9-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-9-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d2651d83-4f86-40e7-2a57-08da6bdac83a
x-ms-traffictypediagnostic:
	AM6PR08MB4952:EE_|VE1EUR03FT026:EE_|VI1PR0802MB2509:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hc8cNTJZxDZWaL7zuVeAk3BoQsZhEHq64o3vAlRu4ElkZHMxsvm2uPAlNc/aMxvHVZBExjb4v2/vKqvCHeItHEZpnuMyvC2sKg6dr3fq7x/jUl/N4mb//emwB4wfZSrX7pBiiPUagGsa4rOQVqBFgcYev+hh6yY/vnN3IooNwjvprHSke2IIRGfXwT8lWcmwQ2SL1MGHm/DnaCn2ZTcONktultBux9+o7U1Xcdqr3QYB2t2mPkzspGPBDfHDJArebwJaJHaUXwsCqo8ZMtFHQpm7z++M4fx3A1SJ0XrAaqEGlyUZJRrwwHqtzC5QikmI8fq92fRE2SN20ugza8yy0PRg00KK1yN18T2ddyqwHJkIk5GNJWU0ZtcMP+6VQIgOrwDmYeqPDB+/VyzN4TaCs41NLIz4J+pDhiKDkXVf2LqTG2ijUgXojndZ+3jYR+OEz+r+26+d7YNszsBr+ciSYGjf+Jqo9aEunp/GYwo9yIn7wl8HMExlWIxTGrKgPH2PnJsia2LocZb+Banm1x4dw7+PyI5sMaE+rlsENaIU83Z2qXqlN/WWCkR36PmOCVjETaSQhY31sXfIKNFvJbwiEEPAbw/Hxrl+A4/K5yAQ8ZoP0iOSCvZVVx9Gt435iC8DwyC4jR+UZnpsMxo3657/w+oU25lMO5ZxDguxnukX1ttFoEmHBHZSCcXVrXjjy4+YBlVrAl0/SIzSC+Zp6u4DD/yYHXBj/J/11sQHmxAp3b5Ea+RAuGz1TenkBEF2zr3Qbqm7S2C+XEHqsqrLUT2HqW/ywqSmSfOIkT+mpnsTfcYt0xxwAg+XfemwWvCD81TnsOaYOn6Z8b+XtTXWSwSxSQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(36756003)(122000001)(86362001)(41300700001)(2906002)(6506007)(53546011)(38070700005)(66946007)(66476007)(64756008)(6916009)(66556008)(4326008)(316002)(66446008)(76116006)(54906003)(8676002)(91956017)(8936002)(71200400001)(5660300002)(4744005)(26005)(6512007)(2616005)(38100700002)(186003)(478600001)(33656002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CC28B4417DE888439EDCACED849D4A75@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4952
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	49872fef-4743-4c54-d710-08da6bdac22b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O+L0ECNgBCsVQrQWwLVExGytbaqIM1nYNsb4diYJ8D2W8pkbQmgEh7jK13TNpPaJzLSDbKJR4cbRvKbtPHr98pP9J9BxHwcqpDja/t0VkCYmkqSr1Yvyq66DCnWHSTVXI7OB0xnX9TU2MZYzivocSO0uq6YV3ToEXUfH886y+w8buNHQl2ud5H59ZkuPESF4fr7CCDaG/UTHn8eeiXzR74g21jZbdWH/Ltbqja2oVhEtqvejwOtvhsmBtKUxCOQQdGcgRRGUr85d5LUf2IpESatV968xkUJ/l0/YlzHNvqni7ADopD3fqwkLeHoYng2FD4k0Ofz78db6m0sfusbcjwmlyDAOEvhjjfzNJI0h0hbgTzjIt/+4N0xcdApWNs7HgowC5PqggGjh1iNatN4mgBlEAJS/m54oVcb/csfkZ0WjA5hfUWp8JfK0p7Hust51qZf4U6GcrTeNPodF2YhWEkRVkA27qzTuVy3pBmNBnX84qmJ11IKoEdRieuenUX5tiShKg/rqQjkMp+VHGuAILLZ/2JU4yj4pZ45A6ut9GV1/9EyXiz3mX/GgMWS2QswXa6CjhrKlHh+xJPvMFc90tigxOP4rjEQnuXYZez9EsiffLfZcauBcr7x2Fx3cV8ahQmrHtwOVOVVEkFFtv2jcptDT1JCvSgksu2iJs4z4y5fHjz/iSFQe8EFFvJ4Cd2IdQOVEGbn5wx6FaC+syN0ew/JYL/fKCyFBxpnTB3Amyim79hbZIy6bPwJM9csZt8cxZKuEjDvdEpv5GEyOPkOiT/kUBpAA0YsjzR7Sjt7mnCxc/5b5SqqNdoBP1RQN3KRr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(40470700004)(46966006)(81166007)(6862004)(356005)(8936002)(47076005)(4744005)(2906002)(82740400003)(33656002)(336012)(186003)(70586007)(8676002)(4326008)(82310400005)(36756003)(5660300002)(86362001)(40480700001)(36860700001)(316002)(54906003)(6486002)(70206006)(40460700003)(6512007)(478600001)(41300700001)(53546011)(2616005)(6506007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 12:07:43.1421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2651d83-4f86-40e7-2a57-08da6bdac83a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2509



> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Remove the need for "fs-*" targets by creating a "common.mk" which
> have flags that are common to libfsimage/common/ and the other
> libfsimages/*/ directories.
>=20
> In common.mk, make $(PIC_OBJS) a recursively expanded variable so it
> doesn't matter where $(LIB_SRCS-y) is defined, and remove the extra
> $(PIC_OBJS) from libfsimage/common/Makefile.
>=20
> Use a $(TARGETS) variable to list things to be built. And $(TARGETS)
> can be use in the clean target in common.mk.
>=20
> iso9660/:
>    Remove the explicit dependency between fsys_iso9660.c and
>    iso9660.h, this is handled automaticaly by the .*.d dependency files,
>    and iso9660.h already exist.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Antony,

Looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



