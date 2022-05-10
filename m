Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0AC521446
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325526.548131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOQE-0005Q9-Nm; Tue, 10 May 2022 11:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325526.548131; Tue, 10 May 2022 11:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOQE-0005Ns-Ka; Tue, 10 May 2022 11:52:58 +0000
Received: by outflank-mailman (input) for mailman id 325526;
 Tue, 10 May 2022 11:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYXr=VS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1noOQC-0005Ng-IL
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:52:56 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe05::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba232a22-d057-11ec-a406-831a346695d4;
 Tue, 10 May 2022 13:52:55 +0200 (CEST)
Received: from AM0PR05CA0090.eurprd05.prod.outlook.com (2603:10a6:208:136::30)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 11:52:53 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:136:cafe::89) by AM0PR05CA0090.outlook.office365.com
 (2603:10a6:208:136::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Tue, 10 May 2022 11:52:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 11:52:52 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Tue, 10 May 2022 11:52:52 +0000
Received: from 32cd8a470739.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6DAD282B-D678-4FAB-BA80-346B261696A4.1; 
 Tue, 10 May 2022 11:52:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32cd8a470739.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 May 2022 11:52:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5789.eurprd08.prod.outlook.com (2603:10a6:800:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 11:52:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 11:52:38 +0000
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
X-Inumbo-ID: ba232a22-d057-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QH00rNmOEp01+rpMk/gHuGg7MVBtVV0EdBTetPdpyaGosYRNk3zMNl+OvP0709MN4Yg41RgcVQcbZCRANCaehQyAwh327tZg7zliNpm+WFwEJ1H0whoBY0vB0jewH+7EimGp09+a8URk4pB0pfeiI4z5Xgnea9lE6quJj+rNXedFsIHgzpP8SdOIle7u8vsBt62mVO2YRsf4C36Krr+kxgE21Bb1FSvRp6/HHn6RMipaUnXryUa/8biSFmG8a+FL3xu0HmXZ58NwnhItgEDKpmccpfngZosGBJksp2Q7ubGZbB4EPpwMAOI5qaMmQTeys8lz/yyuOJ8ruc7R21jNIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr980hwglPXKbEtBZQOr5MfKE8T8o2fCZSx9I06tq3U=;
 b=O5oO3dze7tS/Tjj1itsa1kMcLGrEt7oHzFuT1Wnp/K05RxK+Bdb6u++FUwtofaVQ1nWQednd0HiiBGHWz9wmr1nU41flmIrrpVGiyYLAWmihr/mFymUPfLkkRydsMQw22DRtH3FEaBWJB4nqHmRyz6+pbelVxQ2t0YgDN778kNgN3ZnNi3aHV3IG6CR70+dz8VctKlr2x3IQoXCKa92Mnounw/MY0ikJLI11L6McWMiuuX2TOstroteheJY3b0bc/uD+paY530emEoghr11PXOB0ngEx4BKvK+xmy3b6B9dxyAHWgHI0E1pciedQ3Y0Y50O1G+j74rmN8K249qwTIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr980hwglPXKbEtBZQOr5MfKE8T8o2fCZSx9I06tq3U=;
 b=h5IrHUI1YX/tq8zstT/uRQvZW0R1APw1eTRTWLgSEQ6zu9cEDiNNMtyl6HBPiQg8MBd/omjaF6UCcKaT1zw9PpgwobFxk3ZqxIFDrwO1P1ENSmR2cLmWlu1ItcIj5zhlEZgEoV1udBKFttvSDxsMl+UcActZA7FOnA9jODGMFtk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a9a7972b6583793
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmnpdxflorWsXQnquQMOqgrt1jJp+sUxAwwiaJQ3FDR1hbOb2Ej+H+CGzAl02hK8Cli8cS5P3Dy1AKrdLGS+gFhRb5wDJ5L6hqSNjRawNU8e1bHojZ0Ray9hVcFwzDXR3tSJgPcQ/wcTcsR0hIPPzLkFMl3gp8aX/6JiTUOlMmpd5j81Cdtin3cbq9OMC4XOtYL9TbjzRohaE7kOZgJQyvgIPlvPypoiQZAeucyearc8Y5cc4WBQxAlFPHhxcBRUZag/Uidj/wMfSWrQ7sQ2/3MgSlxL113Jb+dI0ZO7/AoEhyKWGrr8V+xhoziDd5OUg1h4da5MwmfZFjVOOs//IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr980hwglPXKbEtBZQOr5MfKE8T8o2fCZSx9I06tq3U=;
 b=NyPH4ccZ3RheP9QblWpgusc3OJf6Nyb8XStw+VGaAfV23lL/JVbhIyhhplBc77ZYHAiIBjmdJYQWMZkgLwSh97h0Qq3CrtLN8ZhVwyK/I6fr4xNV6GzLwaNxRp1B/gzeLZBaiXjmyrNDPnDqK1qjz/sXnSVTzXGq8O8e5yCkufzr4vuY3H1EPQ8GZPZuC/gTtWQoTStKRAsYD2BxvWVeOkuVfVtd3lL1VbMXGVA3u6M+jEw0xFu/BNmfT0+qojgnZQrAi8affLFTIQpUiCN8vnaoqmQhGD9Kck96+lmIiJaNWquRz/GItqrnha2FcsO+tsS0y7WAeZjDLdnJ+eLXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr980hwglPXKbEtBZQOr5MfKE8T8o2fCZSx9I06tq3U=;
 b=h5IrHUI1YX/tq8zstT/uRQvZW0R1APw1eTRTWLgSEQ6zu9cEDiNNMtyl6HBPiQg8MBd/omjaF6UCcKaT1zw9PpgwobFxk3ZqxIFDrwO1P1ENSmR2cLmWlu1ItcIj5zhlEZgEoV1udBKFttvSDxsMl+UcActZA7FOnA9jODGMFtk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <Michal.Orzel@arm.com>
Subject: Re: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Topic: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Index: AQHYWWqn4igAeGv7Uk6q5mD33SrErq0W8JQAgAEkhwCAAAB3AIAAAHwA
Date: Tue, 10 May 2022 11:52:38 +0000
Message-ID: <9D2EFB29-8A31-49BB-B5D3-A3AECBC83847@arm.com>
References:
 <8a8ffce11591efb284c93214b77534fa4e4134b2.1650976647.git.bertrand.marquis@arm.com>
 <dd0d090d-24fd-bab5-7a30-598710bc04e5@xen.org>
 <5CD3173A-77CB-46C0-81BA-38CDFC6DF5E9@arm.com>
 <1086632c-daba-96cc-9b3c-ef918a47f71c@xen.org>
In-Reply-To: <1086632c-daba-96cc-9b3c-ef918a47f71c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 97b877bd-10a7-44e2-ffe1-08da327b9d58
x-ms-traffictypediagnostic:
	VE1PR08MB5789:EE_|VE1EUR03FT012:EE_|AS8PR08MB5990:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB5990A0E180CAF0B83BFCDD1B9DC99@AS8PR08MB5990.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EoRs8rOn+fT/VSCSTqAZUqA3O//fJlARyS9le9uvtoru2u9HyrVhHO7HOYTmg/6iLK6mWgd9dkqBhi3KCv7aWNv+TNUCOIaMKRVQciIFg/YPIB6ktMs2difxU89jDLIDYstjwkRJH+OuW9A9caZakRrA8BLqmvFQ9GAK02f5y1xEh3QajXOTASWrxaVJ0IaV549oS9V3rGn1Nc9PfHe30klfUEVGM0youENbNA1uPNYexREu/ST1QGncUjFhqORtcj1I9h9xEBzdV829qj68PJwpGLrJEC/6GfKuEbEG4t3ksS9qGq50Rdtl0i/m2U+yp226rT+93xPvGZvI0JuSFcji3MuaE79EZegfnzGX+eyo2mG/w0Nb2o2JgP4ZNdpoadD9pp5pcGObZY2Ikf5taHqSWDp5cxaBJsFZzun8Lam+sS+e/nAwEgtn+etHnn/ULFpsAEEljY0XiNyrFiqsTHpHyTrBGjdakXiqckXrxEwkwh8oVk+zosYhEwHERRh9c3nrvoENetGL8BaWacbXl0IRPeXM1JNtHba2X4FfwL1zG96tEf3PNrwTodKTqJY4gFicLjoiy4rGXkw6bWozJRjKHKHGyMHzJNMCvMKTUbbNRlwv/8mldhBl8tJbQP9F4JAN6rwBRWR8OJMIJFQzIPEl7Ghz9uxweJMJnk26j16lOgC3i84Uxa4BRbLkv3iLTVCKJv4w/JVY2uc04yu71LbR8CFpaylrGxapOVMm4A8UUNvVTEe2ykr61xlA2k+V
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38100700002)(8936002)(6486002)(38070700005)(6916009)(186003)(122000001)(54906003)(316002)(66446008)(36756003)(71200400001)(6506007)(91956017)(8676002)(2906002)(6512007)(64756008)(76116006)(26005)(66556008)(66476007)(53546011)(66946007)(2616005)(5660300002)(33656002)(86362001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CBE807D0A6DE52419678485E82F8E1B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5789
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e5cff8cc-168e-418e-1db9-08da327b94ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hEFLQMs7ddsU/QGPYSgNB0GWY6edvfUAPVSysQDQRl2GYcaZlCiZzW+Li/+1bntxr6FKAykqOTxqizxNmz8h8Uxs+/IcEsta4NHouzJAPGGylPYSHOJD/iyJ/YmEi5h4UiaJsvTlu3QoLgmx+oRs0kAa1wmsLxE0IotdaOV92067EGWaaRmFyDQ/KmtgEdJs6a+1lVln3DxPq/FcdE4rmEd1X8k9QDXJkkNHm/MzpuZICL1VBwhWBFStZiomIMYsTZk8U00G4vqbv8Z9ajLFbyRkvE3hPcLAWS4hwWl/U/ce2nysp4TpamRORNpMR/RdgBZbvvZxj9B/+G2Ae0I5Hr7qa5mW3O4MqZNdw14OJpeud9TxblsEG1T4LjU1Lgo52gdfBn0G6F5lMBVYE4o9DfabY/LUDa80tEZgmd1eSmM61aevjsGQHEu1x8DKi+XD4CGCmnZs+p5hQZsXYzxaoamMeJGXviXuPDPUu0gMKdFpoPs+jgLD09+9+oxRGRe56kpuEXV8xRi7hFo5SWH+g+iA6OxklgvfdfLcooB7gAVw/s/iqEmYrXRAbGMzKGyuBqgvl3KaRVzDG5rqhHfDPjG1zF+LCOqD6jKQ4Hj5Qbgj4fOmEZ71ZKnPNzJtV5EElusvNGl4mbrmRpahrCuN1Cg5sXnTJSjr+gYpUDebYfbYhgRSVNpG8vtyN0KBKs/x
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(36756003)(8936002)(356005)(81166007)(40460700003)(5660300002)(70206006)(508600001)(33656002)(4326008)(47076005)(186003)(8676002)(6862004)(336012)(70586007)(2616005)(54906003)(82310400005)(316002)(53546011)(6506007)(86362001)(26005)(6486002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 11:52:52.7474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b877bd-10a7-44e2-ffe1-08da327b9d58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990

Hi Julien,

> On 10 May 2022, at 12:50, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 10/05/2022 12:49, Bertrand Marquis wrote:
>> Hi
>=20
> Hi Bertrand,
>=20
>>> On 9 May 2022, at 19:22, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 26/04/2022 13:38, Bertrand Marquis wrote:
>>>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/inclu=
de/asm/processor.h
>>>> index 852b5f3c24..ef37cfa16f 100644
>>>> --- a/xen/arch/arm/include/asm/processor.h
>>>> +++ b/xen/arch/arm/include/asm/processor.h
>>>> @@ -219,9 +219,11 @@
>>>> SCTLR_Axx_ELx_A | SCTLR_Axx_ELx_C |\
>>>> SCTLR_Axx_ELx_WXN | SCTLR_Axx_ELx_EE)
>>>> +#ifndef CPPCHECK
>>>=20
>>> Can you add a comment explaining why you need this check?
>> Sure, would the following be ok ?
>> Cppcheck preprocessor is wrongly throwing the error here so disable this=
 check for cppcheck runs
>=20
> That's fine with me. I think my ack is technically sufficient here and St=
efano tested the patch.
>=20
> So will do the modification and commit it in a bit.

Thanks a lot :-)

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


