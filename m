Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A686957E158
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 14:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373185.605252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oErbl-0003Fz-43; Fri, 22 Jul 2022 12:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373185.605252; Fri, 22 Jul 2022 12:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oErbl-0003Db-0m; Fri, 22 Jul 2022 12:18:17 +0000
Received: by outflank-mailman (input) for mailman id 373185;
 Fri, 22 Jul 2022 12:18:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdc0=X3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oErbi-0003DV-Mv
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 12:18:14 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00066.outbound.protection.outlook.com [40.107.0.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b2f2354-09b8-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 14:18:12 +0200 (CEST)
Received: from AS8PR07CA0004.eurprd07.prod.outlook.com (2603:10a6:20b:451::19)
 by AS4PR08MB7997.eurprd08.prod.outlook.com (2603:10a6:20b:580::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 12:18:04 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::cc) by AS8PR07CA0004.outlook.office365.com
 (2603:10a6:20b:451::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Fri, 22 Jul 2022 12:18:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Fri, 22 Jul 2022 12:18:03 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Fri, 22 Jul 2022 12:18:03 +0000
Received: from a1eb64f8938f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 463AB30E-5BE7-4BEC-84D7-FAA241D0DF02.1; 
 Fri, 22 Jul 2022 12:17:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a1eb64f8938f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Jul 2022 12:17:56 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB3208.eurprd08.prod.outlook.com (2603:10a6:209:4b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Fri, 22 Jul
 2022 12:17:48 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 12:17:48 +0000
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
X-Inumbo-ID: 5b2f2354-09b8-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BTE0FobMfSp8mCCcCByXSW12fH6VdbXT8VXPF+0n7UpeDl4ZLG39a6ablIYBhB9sxy5eR6tiEtY3xZk/mlhVtuCxkWUW8CV4FZ+sIrwpgcLBAeIdtt1tnTCWGE1aCabwF8gL5BZr+Ia6Ln2iSb/qYXpkzF6V4j/Nbz/jT5OoZA5rvH+vTvAEKcDIO8wgcX2iAq6DWDViP9yxt75h6E+m8/+hv74M/UGKRIDoU8E3LPfdfUMioqAN+4xWJzGpVEzBVBWEghXgZi8y9oYk7fr1OgqLs8nfxWCM/wgVyWAf1nAHGem3DybsU5y/Hp4J6EaPXN3r4hZgAWewDXLjdd/h8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8aK92PG1tNoEuDVIfwLTyc3ovnYpYkx/Zp/4kxg+VU=;
 b=eLsLyJmwTlj6I355t5s1iwQsElbpo7XwW8P5FON4F4MIQZaoZsUzZGkMYTFk2XxjJ3iNEZNtsUwzvZYL6r2RkcBjXVOTbmuCkiVLyxuCnOYHJFvr0alA39C9VkYoHB1YsNUzOYx/boStJ4wGIubS/BB/f96qhS/XqouG7tgS3WGU153emkahRiTB+t1MuddhGbxjy3aqnVspnyhktpJhrvtBooWYV0Clm7fhN4LH5IS2obdLl4edEOpjCT3c4wnlDGE3xHyLc4jD+X7ZARJ6QEnKwX1H9KU0b8VCo3VhJM/L+rd1bnB0uGaeZxXumQXGS5txHWDrdyL2g8iFWtuZ3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8aK92PG1tNoEuDVIfwLTyc3ovnYpYkx/Zp/4kxg+VU=;
 b=ALCN6lVwU2PkGT1hOeSueRTwfgnBpLdjXp4PLP6BHIHkv7JuE9P8acrtkINKP2EDVA3PVbeUNHKbwoTx2Xdb860JTKbWjTSmKPTq1IDfqqza4j9vl5gfpKYhaU00g0RL0bkU9IpK3rEN0Dk6mD1vp0oI/Kzv2jn5vF+1JADL2kc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6009f6e664adb3e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neVfneE8M+EauViZr6GxyKDdsm1Xx5GQQUYqdNkgTIGUnSGx5ZrkVtgyxFfI8+KJo4WTXtPeLtwKg3sxaziRR7lbsuxO4WBxnVstdfWQq6AGylYZ2jDMqROjyCGFOAkgzRAO0IrJ6ZmQkef3VT3ZD94azwjxV7lfbp5oYpj93PCbJCRPSsIdzK5Nr8y97oAx0NP8xEJLxrT6hmVmkx58xyHIk+IPq469zBHtQPaxvniKb5lnqa6Ich9o77GmmW7VOypXQGtjzI4zfZG15PIRzo25fGRUaTECbm+CLedL+fb9n8kOewI1HsS5oFWFKKk4pD76FzSR20g3NeW0ea1laA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8aK92PG1tNoEuDVIfwLTyc3ovnYpYkx/Zp/4kxg+VU=;
 b=SxZbMaxSYfKeaMuCDOII0M4VDeFXuEKpojUX7e4haYAkEBI4AQuvSkTYHwU/uCeXY2uV2CB0KjeXqTUrnO9ovqgshTbhK7LToaFTQrABGUq0eBKcraeZ6YE4Wb8dvxk2O9V35duF/SGmxxt7+LZzOFOk6NSrnxy6w7DOdbd/YWxfFJz9LGkJqDNElgxyphPzfgxwga6/nLtuO5wMgo8wJQgWYDZz/voCesm1JxAU2I8g8Un81qJ70r6EYPE9kU1tlezoILCAlX32HQ8luX61cKEsCcCLDpzvzNqoG23FgVro8Wll/hiv+axm2fCccVgiA4X8aZJl7wG3AXGR0dAUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8aK92PG1tNoEuDVIfwLTyc3ovnYpYkx/Zp/4kxg+VU=;
 b=ALCN6lVwU2PkGT1hOeSueRTwfgnBpLdjXp4PLP6BHIHkv7JuE9P8acrtkINKP2EDVA3PVbeUNHKbwoTx2Xdb860JTKbWjTSmKPTq1IDfqqza4j9vl5gfpKYhaU00g0RL0bkU9IpK3rEN0Dk6mD1vp0oI/Kzv2jn5vF+1JADL2kc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 09/25] tools/xenpaging: Rework makefile
Thread-Topic: [XEN PATCH v3 09/25] tools/xenpaging: Rework makefile
Thread-Index: AQHYh+QwbqdlAL00aEOFYBjfWyoAZa2KelQA
Date: Fri, 22 Jul 2022 12:17:48 +0000
Message-ID: <3D24E70F-CD97-4F88-AC65-48F91F79F5E8@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-10-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-10-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f0f31008-f0c0-44d1-356f-08da6bdc39f8
x-ms-traffictypediagnostic:
	AM6PR08MB3208:EE_|AM5EUR03FT030:EE_|AS4PR08MB7997:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MdWFnE/vWL+xGtuJt8k+4om4PLrOjfPxdl0x9sPyX+BnlcSnPuM+u+fTvioDL5k5N+cIDiQr2nfak//arqKHazkaRxShEsbZTPerNz/v+jw0KlZBFhnXrmHKLMprHf4r47lKCyElw4yuCmUGNP5kcALzSxL55S6hl3Z3/VjU1g36jtHaYewaIrX/U4i/KWvTqmZAOU9RYrEJXe8/g1qwJXD9a9xYIM/z2Ty4qRok7ctMSQyvtgtlX55uzeVRPwH3lygxR7OslTT72coczDgkeZhzVA49fDIZuuwjOOlXXzYEkZHt3ZSQI0hB1cBC+3Ugj+9OmiQ2pQbqkvg4K5RHjXoC+Dvoy53Te3UgbLZ2cIFrLtOipxpNxwMIhvPDLfKbFLYVgAFXUEng6ZN+jaXJUazvaxlZMKIEuH6/tiAswSV05RBrVrqRUAk5UdL+FUYDCnrx53LDrY8gUeVHofSn6o3S3s6Z8nOr+X7CLJx1Zo4DNc+OWJLpaKcPp3uuhRx5lHdUEcKVETzfQeue4PzG51/OOqTbMtyhypc8jZv7NmvC6iidvuE54r9zmRRWuMj3iIABTnBTBANAtj7H53zU4Tyhvxgykuempr+lSUKTF/8DHJVHy1O1z6b1FOi4rjARPasZ24WznSosNTie0/otPH70oe6BvoOyd44G3SdHjw53aQ6Mlq7ACy6txWmfKxdKv0cbpIH/ultBGQZC6wZ5jgdM06ArO2Vw9pyHl7tgm4iXswp86Fq+bd+SZiumPBYOxfsrLk1T0WrbxbnA8Cls5gNyJOqVudu1KcTLoSXnA3LfrgeK4KdyuCbx3YU03OPZ/9IUg91xrJC4SfK6psqdnQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(5660300002)(6486002)(41300700001)(478600001)(6512007)(6506007)(91956017)(26005)(8936002)(4744005)(86362001)(33656002)(71200400001)(36756003)(53546011)(316002)(54906003)(6916009)(2616005)(38070700005)(122000001)(186003)(4326008)(2906002)(66946007)(76116006)(8676002)(66556008)(66476007)(66446008)(64756008)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE33A2DB999A1F43BF4BA292D93AF782@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3208
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3c4a360-7e4d-4682-0b28-08da6bdc3110
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	awXqbKObnCExK3guKg2Fn3Oc5St6T35R/JSHRfFl4vn7nId3rOIrtADw/bQUst13nzwfbA/9E2YVWe57ULJ07yT+lPKUcoojuAuZtGctX8OpVQygFhRDuLwRtwUXzc3EA98Jy9YF/0fkFuN4voIKlMyOtg5BoywJaFkoXUL0lHkFGtKHpRGybwfg3rP9MeMtBkEgFbtG++zcgDK0fn/Dd/1WFifM5MfR/HKHpxOmhpq/p2JWpEXoSQ+IuRa2hJaQCbW5N04gQ+BODcwilejJ0JlvHHyGgV8vA6olJl0i2vqFUsDNRUAjEeAl1ZDV8WzZFn0wF+D7+kjXLQJVDT0H8vI0Gf482kwqyhB9t3anNnxjat9u8y1vrxHVVD6Bt2GaV+tExi1x5Gg6FE2n6+yYDIktJ68c8OTQFEzxI2VeMKfSOmowoDEBWJ6sCRi7yTjK/ieZXU2j+g81gDbGKTJqligDwI9NbZFOAUeg+oiPOIjR5hQDPjF52Ak5HACmusu1XxZfdBrM42YiDrGHNUXjNNdQwIxEOLietgm6DLxMrA43K4xsppd4sZtE4qpBonzrBUblVoIkGLzFRnlTZegUxe6eWjj0hwylFIiKyFu4lztB+F9kjYKy62PfEKqUgayS3zX2EfsHpjNelGa/mjgzvpViYjz2JcJVYyjXibueklKmy5jfupZc9XscGgiJNHtFd7c9gMpE1gAdA2boYcN1XWP/D5CITVYFBxmBO/Pq/AylK72Qneak/j7We0bfsuiJ6gWXs3xLrSglIZYhVr1HM1KrYgnSFebCRRBBOWAPeMBDcACCu/yoXOfPd8Nfo/PQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(36840700001)(40470700004)(46966006)(36860700001)(4744005)(336012)(41300700001)(47076005)(6506007)(33656002)(2906002)(5660300002)(6512007)(40460700003)(6486002)(86362001)(2616005)(6862004)(53546011)(8936002)(478600001)(186003)(26005)(54906003)(316002)(82310400005)(82740400003)(81166007)(356005)(36756003)(40480700001)(70206006)(8676002)(4326008)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 12:18:03.5266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f31008-f0c0-44d1-356f-08da6bdc39f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7997



> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> - Rename $(SRCS) to $(OBJS-y), we don't need to collect sources.
> - Rename $(IBINS) to $(TARGETS)
> - Stop cleaning "xen" and non-set variable $(LIB).
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Antony,

Is it worth to mention also that POLICY now is now not recursively expanded=
?

In any case the patch works as before:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



