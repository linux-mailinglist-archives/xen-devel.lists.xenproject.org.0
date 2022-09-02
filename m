Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F15AA512
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 03:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397120.637583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvUa-00015R-UL; Fri, 02 Sep 2022 01:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397120.637583; Fri, 02 Sep 2022 01:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvUa-00012i-RH; Fri, 02 Sep 2022 01:29:08 +0000
Received: by outflank-mailman (input) for mailman id 397120;
 Fri, 02 Sep 2022 01:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mC+w=ZF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTvUZ-00012Z-4N
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 01:29:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0411541-2a5e-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 03:29:02 +0200 (CEST)
Received: from FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::12)
 by PA4PR08MB6174.eurprd08.prod.outlook.com (2603:10a6:102:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 01:29:01 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::86) by FR3P281CA0151.outlook.office365.com
 (2603:10a6:d10:a2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.6 via Frontend
 Transport; Fri, 2 Sep 2022 01:29:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 01:29:00 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 02 Sep 2022 01:29:00 +0000
Received: from ebbb3003282c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 936CAAC8-4E5F-41E8-B8A8-E03D2EB2D887.1; 
 Fri, 02 Sep 2022 01:28:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebbb3003282c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 01:28:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6004.eurprd08.prod.outlook.com (2603:10a6:20b:285::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 01:28:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 01:28:53 +0000
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
X-Inumbo-ID: a0411541-2a5e-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mGPdoGsoFxTnITwQh9sYhkP1A6/JOLhrB/qVbhBq16JNj471uh3qsp5JF4Qcg04+ps+duXETpFcDiogQRKzAW6yhpr75IAmSob61r+0fFvumpiV3cCkI0tHS2BCns6sCdMeE4uZJ/UquhDu2BoG58yA1d6TzaRpF06/vO1cfT7EIcio0vXVaJyHNrH0OBirr8YiZ27xJsMpzOuulS1yR28x5RcF6KSeBENtmZ6E40YhcmDBYb5KLgo17Xn22ukmt4NYnzPOsw69BlxldF5c7JqJ/8fxiKF7hlEj5+5JBs5yA6vCaVQhMxreh8ghFq0VxLHj+13spZKZCNoOeeZ8mDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNj9rnYkfPXmAu2FXvN5Nto8kMl+ok+LpejJNKyAcj0=;
 b=cDP6z8orRNabCdPbrYdrn8RFz1YbtUsllvtWmURBrErvawmX9v85Lo8irpE7qk4tf/tPJ6WikLq/rHGv2eaRcuqpTivq/1KJYW3aGCtHFOYEuJ71buUNTqKZxKTH8f0KVAj3l8e5EAVdi0eGcC/UHpAzcksEc44rMYi9nMpz9iToRgmXvnFQIOkr7fxAzTB+oJoU0kW+2LOrLYPT2Ie6Gbf31BjjVZfG+XeDReyEjbJ81o0j1hxyXJGy/UBE6LP75VrcPkEXSUqKoU86UcTVCuGSxg3hyeotG8dMpumMStOugTTO1jvPeAaGILUltdGw2w5jFUjZlqYEynDSfh2v6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNj9rnYkfPXmAu2FXvN5Nto8kMl+ok+LpejJNKyAcj0=;
 b=6pZanHJM2skTobhJBPh8TcCO47TAF+Mzdjm77kPL1FkS7YO8Rf9Lh/NX9I7JhawxlGpR7+/SmVX4m+HXJ0S6RbuVrvCVDUIK2UUjjg0gjpdHlSTgzS/rHxNNJcPy2oka9BwCPDxFFCHfIx6+DS+EK+pI/ODRbdDzm2B4MaPHavY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkB1+r4Gc5+Px4qegL6tYl8gXoKv73qXflLM47iI2yJMuJdD2Y7PTg4Q90ZNgX9ZLGxLCtfomr7yUOGux7eGhAxTviqxWoZ4qaf6JA3RW79ieQ8TBeU17hCtypMo29OId6Nui8YI98tjWzAgVcEJn6fK6KRn0SWw4qrAH0MFM24Hhz/AvTRb0tOxKdsEd9t4AQ5rrMbtJbadPWorKhnyYyX/ffTEd9Mp+wmJz6UI8v++vfKNG/vcwSKxcMC8FSjijAM5nM3elGpgchLqKlA2mrpCKPNXXsR9AbjbC2nEm0/cTjFW+sBoVl1U5R67vKJIq6cj//OmNTdF1ezxxyOo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNj9rnYkfPXmAu2FXvN5Nto8kMl+ok+LpejJNKyAcj0=;
 b=FK+9+vcolptDdt+8+7ryJqEix37qpp/VOk0b5lJdFeCOl91JLmhA2IFnNRNs71SPU0zDwq4aCn+SdLU1JDNf+MTiLPz/YzlA1mvD0PGtYX7QwXH/CEPwlHdHm5i3T06rJsrp7mo/+eWFm/oTVYo02GEV4tvq/zoHJ+7iZkoODdQRiUv8Q64oPKBet9jDaDnSIf0BsR3Pc6YGJKi8aA9bvEMbk4IEznIL0lAUVceojvKQlK/HsbC9d319G5wlsKPb97YGbUYFRWLdH5Q1HfgcsHe4dTEGXpUBtfTOVqbt4kePjqRtVoN8qoJEVnqrw8gfS+nt2T7taCpYkQLZvawxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNj9rnYkfPXmAu2FXvN5Nto8kMl+ok+LpejJNKyAcj0=;
 b=6pZanHJM2skTobhJBPh8TcCO47TAF+Mzdjm77kPL1FkS7YO8Rf9Lh/NX9I7JhawxlGpR7+/SmVX4m+HXJ0S6RbuVrvCVDUIK2UUjjg0gjpdHlSTgzS/rHxNNJcPy2oka9BwCPDxFFCHfIx6+DS+EK+pI/ODRbdDzm2B4MaPHavY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYt4ueuuTQX+2f5E69518db+C55q3KsXoAgAC0jPA=
Date: Fri, 2 Sep 2022 01:28:52 +0000
Message-ID:
 <AS8PR08MB7991DCF7AF78FADB95166551927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <9b5afd5e-ec5c-bac6-9ad0-9dd9663aa705@xen.org>
In-Reply-To: <9b5afd5e-ec5c-bac6-9ad0-9dd9663aa705@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3E8000BCAAFD7F41A6F2D972C45AEBC9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9b8558d8-4f1b-4f35-c84f-08da8c828399
x-ms-traffictypediagnostic:
	AM9PR08MB6004:EE_|VE1EUR03FT058:EE_|PA4PR08MB6174:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rq4HeqoYX3MUnkmll+v76QBUD+KUO6qoBjxgfKPUn79xj928Gmw1curitPNUJp9xGpHwATFy9fpjLQHnz2r0AdaV88QC3uXnVw2dAYDdpsSjTumJuBY2Z/3FIHLijnmuRpRreCQuZHCTeu4SnjyF5tjXdH8I+atP4EbOpRQChEOE8wp5yitZtcS5QgQ5hlBGqi01/x9DKxJsOOk1EGNDSVwOF+qab0RON/iIJmsDMi1pW4eEVobPzKKxdSFlm8QiYEXfSn/N6vfF6YHMqxnfym+JmY/QC3dDokie3qr1tbE9N/RYwUC/+MawCeM9oa+HleunKuzTELEuWtaVd/nOTy1lQsPK9nZF+bLwlSZeC15eXjkY74/ul7dTG2EAaTXWgwgPWTPvC399PV42gQUB0X+ehUME55/wC7IhV+kwpoFQyFSIue9EnPS1jEPFkTpjAef9Qux80XHV3QqZtn3bU8hvbpJsirXVTSTAJlHuWYBJXdDNEpxvtbJby6WsIoeALicDjLuXWlAJ8RKFW3yczp0/GK1NV0kpBzEWzVmq6RTDwSMPXxDwW/7izD1DR7+dnFlM9fsL8e/OhmtQJizls9IuFpUKF5UL6a9+P/K/U1wBR07KFeDUzSsehenyf/Ncnf0FLEri3IQ5yOHptr0dJfl1pDh6AIVANn35DwJg6ONtE7Rvou8z9bvTMKRllpKuDT5dtW+zQaSQdcJkpbRxDv2KHrA3X8f1BUBaRQs9+Crh5HauW5xvGZpUzsA9hokau3n6v11YRD1D8IbLIFQmmg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(52536014)(71200400001)(38070700005)(41300700001)(26005)(6506007)(86362001)(7696005)(9686003)(38100700002)(83380400001)(122000001)(186003)(8936002)(5660300002)(4326008)(66556008)(55016003)(66946007)(8676002)(66446008)(33656002)(66476007)(76116006)(64756008)(2906002)(478600001)(54906003)(110136005)(316002)(6636002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc7de5a3-6e34-4b02-f0a0-08da8c827ef3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3NbO9aWf3X4rpwtk8MKd9lcQsUOeXvRu7Kq6FtYyl7IVn53mivZBGWX5cO9uHl/pJvxLadplKHbQUQRBWz4ZtVajU9J7LTO/N8U5ePh9TcvRJxSIBY65hEHACk/IuPkI+9tusXomCOIJWjZmDgxDxQClkFwoQO4nTI/qx/6mpsoUQ4UGTffjadzDLhkfAmmufcCH4ber5n/xK+tr1SVWaeOdxqLX0L9qDPC180HfTAZ1cBeju4ln8BOBbjK71yNNVbNJPPDYUwcTpMG5PnBMl/uGQFkEfNNEU1vz61u/6SMz16/+9Xm4br6Cbuv6vwQJTstEv0UJQ7R8cdjxwAzw3gSuboenb0EdAGoxYhOCv1qPMXv9t1hvCHQCZaRf5fsi+g84MhxX0z7w2b/c978kzPwhGMngNB0GpsAGGS9aseLKfnseJ9yMfyrWbeiXcwN2OEgv0i543MZzII6HZLlwszuRPed1BX/H0oBNq5GdIxWend3qx38bw45O+YHFu07XzlG/Fvtz/+ZKbjCBnTdCcX/8y4sZLk2+uuINM61Zyn9napnITdrGvq3t8SkayKYfeA76/TaBP1+eS/WVnblH3mMBVl1itlfmJkMDG+ifFKpGHFWFE0TJX1NkjPmpdOvJn8FSDxx3OQt25nbxswtRLbo2xKVwhKPnaFGVPtzqxuQ8YgcMAjrXit4MSdGNIBNz7KjxDLFdkKrl3pq5rjYJmwSk6p2KG1eAO0l+7OfV4UC3bD3tnUGDisMwnmmnXQd0vukyqNpQVOdj4+ZIkmD4PA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(40470700004)(6506007)(54906003)(41300700001)(316002)(478600001)(110136005)(82310400005)(7696005)(6636002)(86362001)(82740400003)(40460700003)(36860700001)(26005)(83380400001)(186003)(81166007)(5660300002)(336012)(47076005)(9686003)(8936002)(33656002)(40480700001)(52536014)(70586007)(70206006)(4326008)(8676002)(2906002)(356005)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 01:29:00.6471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8558d8-4f1b-4f35-c84f-08da8c828399
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6174

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBkb2Nz
LCB4ZW4vYXJtOiBJbnRyb2R1Y2UgcmVzZXJ2ZWQgaGVhcCBtZW1vcnkNCj4gDQo+IEhpIEhlbnJ5
LA0KPiANCj4gPiBBbHNvLCB0aGlzIGNvbW1pdCBpbnRyb2R1Y2VzIHRoZSBsb2dpYyB0byBwYXJz
ZSB0aGUgcmVzZXJ2ZWQgaGVhcA0KPiA+IGNvbmZpZ3VhdGlvbiBpbiBkZXZpY2UgdHJlZSBieSBy
ZXVzaW5nIHRoZSBkZXZpY2UgdHJlZSBlbnRyeSBkZWZpbml0aW9uDQo+IA0KPiB0eXBvOiBzL2Nv
bmZpZ3VhdGlvbi9jb25maWd1cmF0aW9uLw0KDQpPb3BzLCBzb3JyeSBmb3IgdGhhdC4uLg0KDQo+
IA0KPiA+ICAgZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dCB8IDQ2DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gDQo+IEkgaGF2ZSBza2lwcGVkIHRoZSBkb2N1bWVu
dGF0aW9uIGFuZCBsb29rZWQgYXQgdGhlIGNvZGUgaW5zdGVhZC4NCg0KTm8gcHJvYmxlbSwgU3Rl
ZmFubyBhbmQgTWljaGFsIGhhdmUgYWxyZWFkeSBwcm92aWRlZCBzb21lIGNvbW1lbnRzDQppbiB0
aGUgZG9jLg0KDQo+IA0KPiBJdCBzb3VuZHMgbGlrZSB0byBtZSwgd2Ugd2FudCB0byBoYXZlIGFu
IGVudW0gcmF0aGVyIHRoYW4gbXVsdGlwbGUNCj4gYm9vbGVhbi4gVGhpcyB3b3VsZCBhbHNvIG1h
a2UgZWFzaWVyLi4uDQo+IA0KPiA+ICAgew0KPiA+ICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJv
cGVydHkgKnByb3A7DQo+ID4gICAgICAgdW5zaWduZWQgaW50IGksIGJhbmtzOw0KPiA+IEBAIC05
Niw2ICs5Nyw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGRldmljZV90cmVlX2dldF9tZW1pbmZvKGNv
bnN0IHZvaWQNCj4gKmZkdCwgaW50IG5vZGUsDQo+ID4gICAgICAgICAgIG1lbS0+YmFua1ttZW0t
Pm5yX2JhbmtzXS5zdGFydCA9IHN0YXJ0Ow0KPiA+ICAgICAgICAgICBtZW0tPmJhbmtbbWVtLT5u
cl9iYW5rc10uc2l6ZSA9IHNpemU7DQo+ID4gICAgICAgICAgIG1lbS0+YmFua1ttZW0tPm5yX2Jh
bmtzXS54ZW5fZG9tYWluID0geGVuX2RvbWFpbjsNCj4gPiArICAgICAgICBtZW0tPmJhbmtbbWVt
LT5ucl9iYW5rc10ueGVuX2hlYXAgPSB4ZW5faGVhcDsNCj4gPiAgICAgICAgICAgbWVtLT5ucl9i
YW5rcysrOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+IEBAIC0xODUsNyArMTg3LDcgQEAgc3RhdGlj
IGludCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkDQo+ICpmZHQsIGludCBu
b2RlLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpk
YXRhKQ0KPiA+ICAgew0KPiA+ICAgICAgIHJldHVybiBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbyhm
ZHQsIG5vZGUsICJyZWciLCBhZGRyZXNzX2NlbGxzLA0KPiBzaXplX2NlbGxzLA0KPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEsIGZhbHNlKTsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLCBmYWxzZSwgZmFsc2UpOw0KPiANCj4g
Li4uIHRvIHVuZGVyc3RhbmQgdGhlIHR3byAiZmFsc2UiIGhlcmUuDQoNCkkgYWdyZWUsIHdpbGwg
Y2hhbmdlIGluIHYyLg0KDQo+IA0KPiA+ICAgfQ0KPiA+DQo+ID4gICBzdGF0aWMgaW50IF9faW5p
dCBwcm9jZXNzX3Jlc2VydmVkX21lbW9yeV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUs
DQo+ID4gQEAgLTI5Myw3ICsyOTUsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tdWx0
aWJvb3Rfbm9kZShjb25zdA0KPiB2b2lkICpmZHQsIGludCBub2RlLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAga2luZCwgc3RhcnQsIGRvbVUpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gLXN0YXRp
YyB2b2lkIF9faW5pdCBwcm9jZXNzX2Nob3Nlbl9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5v
ZGUsDQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHByb2Nlc3NfY2hvc2VuX25vZGUoY29uc3Qgdm9p
ZCAqZmR0LCBpbnQgbm9kZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1MzIgYWRkcmVzc19jZWxscywgdTMyIHNpemVfY2VsbHMpID4gICB7DQo+
ID4gQEAgLTMwMSwxNiArMzAzLDQwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX2Nob3Nl
bl9ub2RlKGNvbnN0DQo+IHZvaWQgKmZkdCwgaW50IG5vZGUsDQo+ID4gICAgICAgcGFkZHJfdCBz
dGFydCwgZW5kOw0KPiA+ICAgICAgIGludCBsZW47DQo+ID4NCj4gPiArICAgIGlmICggZmR0X2dl
dF9wcm9wZXJ0eShmZHQsIG5vZGUsICJ4ZW4sc3RhdGljLW1lbSIsIE5VTEwpICkNCj4gPiArICAg
IHsNCj4gPiArICAgICAgICB1MzIgYWRkcmVzc19jZWxscyA9IGRldmljZV90cmVlX2dldF91MzIo
ZmR0LCBub2RlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiI3hlbixzdGF0aWMtbWVtLWFkZHJlc3MtY2VsbHMiLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwKTsNCj4gPiArICAgICAgICB1
MzIgc2l6ZV9jZWxscyA9IGRldmljZV90cmVlX2dldF91MzIoZmR0LCBub2RlLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiI3hlbixzdGF0aWMtbWVt
LXNpemUtY2VsbHMiLCAwKTsNCj4gPiArICAgICAgICBpbnQgcmM7DQo+ID4gKw0KPiA+ICsgICAg
ICAgIHByaW50aygiQ2hlY2tpbmcgZm9yIHJlc2VydmVkIGhlYXAgaW4gL2Nob3NlblxuIik7DQo+
ID4gKyAgICAgICAgaWYgKCBhZGRyZXNzX2NlbGxzIDwgMSB8fCBzaXplX2NlbGxzIDwgMSApDQo+
ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBwcmludGsoImZkdDogbm9kZSBgJXMnOiBp
bnZhbGlkICN4ZW4sc3RhdGljLW1lbS1hZGRyZXNzLWNlbGxzIG9yDQo+ICN4ZW4sc3RhdGljLW1l
bS1zaXplLWNlbGxzXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgbmFtZSk7DQo+ID4gKyAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgICAgIH0NCj4gPiArDQo+ID4gKyAg
ICAgICAgcmMgPSBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbyhmZHQsIG5vZGUsICJ4ZW4sc3RhdGlj
LW1lbSIsDQo+IGFkZHJlc3NfY2VsbHMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplX2NlbGxzLCAmYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLCBmYWxzZSwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUpOw0KPiA+ICsgICAg
ICAgIGlmICggcmMgKQ0KPiA+ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+ID4gKyAgICB9DQo+
ID4gKw0KPiA+ICAgICAgIHByaW50aygiQ2hlY2tpbmcgZm9yIGluaXRyZCBpbiAvY2hvc2VuXG4i
KTsNCj4gPg0KPiA+ICAgICAgIHByb3AgPSBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgbm9kZSwgImxp
bnV4LGluaXRyZC1zdGFydCIsICZsZW4pOw0KPiA+ICAgICAgIGlmICggIXByb3AgKQ0KPiA+ICAg
ICAgICAgICAvKiBObyBpbml0cmQgcHJlc2VudC4gKi8NCj4gPiAtICAgICAgICByZXR1cm47DQo+
ID4gKyAgICAgICAgcmV0dXJuIDA7DQo+ID4gICAgICAgaWYgKCBsZW4gIT0gc2l6ZW9mKHUzMikg
JiYgbGVuICE9IHNpemVvZih1NjQpICkNCj4gPiAgICAgICB7DQo+ID4gICAgICAgICAgIHByaW50
aygibGludXgsaW5pdHJkLXN0YXJ0IHByb3BlcnR5IGhhcyBpbnZhbGlkIGxlbmd0aCAlZFxuIiwg
bGVuKTsNCj4gPiAtICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+IA0KPiBUaGlzIGlzIHRlY2huaWNhbGx5IGEgY2hhbmdlIGluIGJlaGF2aW9yIGZvciBYZW4g
KHdlIHdvdWxkIHBhbmljIHJhdGhlcg0KPiB0aGFuIGNvbnRpbnVlKS4gSSBhbSBoYXBweSB3aXRo
IHRoZSBwcm9wb3NhbC4gSG93ZXZlciwgdGhpcyBkb2Vzbid0IHNlZW0NCj4gdG8gYmUgZXhwbGFp
bmVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gDQo+IFRoYXQgc2FpZCwgSSB0aGluayB0aGlz
IHNob3VsZCBiZSBzcGxpdCBpbiBhIHNlcGFyYXRlIHBhdGNoIGFsb25nIHdpdGgNCj4gdGhlIG9u
ZXMgYmVsb3cgKGluY2x1ZGluZyB0aGUgcHJvdG90eXBlIGNoYW5nZXMpLg0KDQpBY2NvcmRpbmcg
dG8gTWljaGFsJ3MgY29tbWVudCwgSSd2ZSByZW1vdmVkIHRoZSByZXR1cm4gdHlwZSBhbmQgZnVu
Y3Rpb24NCnByb3RvdHlwZSBjaGFuZ2UgaW4gbXkgbG9jYWwgdjIuIFNvIHRoaXMgcGF0Y2ggaXRz
ZWxmIGlzIGZpbmUuIE15IHF1ZXN0aW9uIG5vdw0Kd291bGQgYmUsIGRvIG1haW50YWluZXJzIHRo
aW5rIHRoaXMgY2hhbmdlIG9mIGJlaGF2aW9yIHdpdGggcHJvY2Vzc2luZyB0aGUNCmNob3NlbiBu
b2RlIGJlIGhlbHBmdWw/IERvIHdlIHByZWZlciBhbiBpbnN0YW50IHBhbmljIG9yIGN1cnJlbnQg
YmVoYXZpb3I/DQoNCkkgYW0gbW9yZSB0aGFuIGhhcHB5IHRvIGFkZCBhIHBhdGNoIGZvciBjaGFu
Z2luZyB0aGUgcmV0dXJuL3BhbmljIGJlaGF2aW9yDQppZiBldmVyeW9uZSBpcyBoYXBweSB3aXRo
IGl0Lg0KDQo+IA0KPiA+ICAgICAgIH0NCj4gPiAgICAgICBzdGFydCA9IGR0X3JlYWRfbnVtYmVy
KCh2b2lkICopJnByb3AtPmRhdGEsIGR0X3NpemVfdG9fY2VsbHMobGVuKSk7DQo+ID4NCj4gPiBA
QCAtMzE4LDEyICszNDQsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3NfY2hvc2VuX25v
ZGUoY29uc3QNCj4gdm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4gPiAgICAgICBpZiAoICFwcm9wICkN
Cj4gPiAgICAgICB7DQo+ID4gICAgICAgICAgIHByaW50aygibGludXgsaW5pdHJkLWVuZCBub3Qg
cHJlc2VudCBidXQgLXN0YXJ0IHdhc1xuIik7DQo+ID4gLSAgICAgICAgcmV0dXJuOw0KPiA+ICsg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICAgICAgIH0NCj4gPiAgICAgICBpZiAoIGxlbiAh
PSBzaXplb2YodTMyKSAmJiBsZW4gIT0gc2l6ZW9mKHU2NCkgKQ0KPiA+ICAgICAgIHsNCj4gPiAg
ICAgICAgICAgcHJpbnRrKCJsaW51eCxpbml0cmQtZW5kIHByb3BlcnR5IGhhcyBpbnZhbGlkIGxl
bmd0aCAlZFxuIiwgbGVuKTsNCj4gPiAtICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4gICAgICAgfQ0KPiA+ICAgICAgIGVuZCA9IGR0X3JlYWRfbnVtYmVy
KCh2b2lkICopJnByb3AtPmRhdGEsIGR0X3NpemVfdG9fY2VsbHMobGVuKSk7DQo+ID4NCj4gPiBA
QCAtMzMxLDEyICszNTcsMTQgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3NfY2hvc2VuX25v
ZGUoY29uc3QNCj4gdm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4gPiAgICAgICB7DQo+ID4gICAgICAg
ICAgIHByaW50aygibGludXgsaW5pdHJkIGxpbWl0cyBpbnZhbGlkOiAlIlBSSXBhZGRyIiA+PSAl
IlBSSXBhZGRyIlxuIiwNCj4gPiAgICAgICAgICAgICAgICAgICAgIHN0YXJ0LCBlbmQpOw0KPiA+
IC0gICAgICAgIHJldHVybjsNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgICAg
ICB9DQo+ID4NCj4gPiAgICAgICBwcmludGsoIkluaXRyZCAlIlBSSXBhZGRyIi0lIlBSSXBhZGRy
IlxuIiwgc3RhcnQsIGVuZCk7DQo+ID4NCj4gPiAgICAgICBhZGRfYm9vdF9tb2R1bGUoQk9PVE1P
RF9SQU1ESVNLLCBzdGFydCwgZW5kLXN0YXJ0LCBmYWxzZSk7DQo+ID4gKw0KPiA+ICsgICAgcmV0
dXJuIDA7DQo+ID4gICB9DQo+ID4NCj4gPiAgIHN0YXRpYyBpbnQgX19pbml0IHByb2Nlc3NfZG9t
YWluX25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4gPiBAQCAtMzU4LDcgKzM4Niw4
IEBAIHN0YXRpYyBpbnQgX19pbml0IHByb2Nlc3NfZG9tYWluX25vZGUoY29uc3Qgdm9pZA0KPiAq
ZmR0LCBpbnQgbm9kZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiI3hlbixzdGF0aWMtbWVtLXNpemUtY2VsbHMiLCAwKTsNCj4gPg0KPiA+ICAgICAgIHJldHVy
biBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbyhmZHQsIG5vZGUsICJ4ZW4sc3RhdGljLW1lbSIsDQo+
IGFkZHJlc3NfY2VsbHMsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2l6ZV9jZWxscywgJmJvb3RpbmZvLnJlc2VydmVkX21lbSwgdHJ1ZSk7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV9jZWxscywgJmJvb3RpbmZvLnJlc2VydmVk
X21lbSwgdHJ1ZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxz
ZSk7DQo+ID4gICB9DQo+ID4NCj4gPiAgIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X3NjYW5fbm9k
ZShjb25zdCB2b2lkICpmZHQsDQo+ID4gQEAgLTM4Myw3ICs0MTIsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBlYXJseV9zY2FuX25vZGUoY29uc3Qgdm9pZCAqZmR0LA0KPiA+ICAgICAgICAgICAgICAg
ICBkZXZpY2VfdHJlZV9ub2RlX2NvbXBhdGlibGUoZmR0LCBub2RlLCAibXVsdGlib290LG1vZHVs
ZSIgKSkpDQo+ID4gICAgICAgICAgIHByb2Nlc3NfbXVsdGlib290X25vZGUoZmR0LCBub2RlLCBu
YW1lLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsNCj4gPiAgICAgICBlbHNlIGlmICggZGVw
dGggPT0gMSAmJiBkZXZpY2VfdHJlZV9ub2RlX21hdGNoZXMoZmR0LCBub2RlLCAiY2hvc2VuIikg
KQ0KPiA+IC0gICAgICAgIHByb2Nlc3NfY2hvc2VuX25vZGUoZmR0LCBub2RlLCBuYW1lLCBhZGRy
ZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsNCj4gPiArICAgICAgICByYyA9IHByb2Nlc3NfY2hvc2Vu
X25vZGUoZmR0LCBub2RlLCBuYW1lLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsNCj4gPiAg
ICAgICBlbHNlIGlmICggZGVwdGggPT0gMiAmJiBkZXZpY2VfdHJlZV9ub2RlX2NvbXBhdGlibGUo
ZmR0LCBub2RlLA0KPiAieGVuLGRvbWFpbiIpICkNCj4gPiAgICAgICAgICAgcmMgPSBwcm9jZXNz
X2RvbWFpbl9ub2RlKGZkdCwgbm9kZSwgbmFtZSwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscyk7
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gaW5kZXggM2ZkMTE4NmI1My4uNmY5N2Y1ZjA2
YSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiBAQCAtMTAzOCw4ICsxMDM4LDkgQEAg
c3RhdGljIGludCBfX2luaXQgbWFrZV9tZW1vcnlfbm9kZShjb25zdCBzdHJ1Y3QNCj4gZG9tYWlu
ICpkLA0KPiA+ICAgICAgIGlmICggbWVtLT5ucl9iYW5rcyA9PSAwICkNCj4gPiAgICAgICAgICAg
cmV0dXJuIC1FTk9FTlQ7DQo+ID4NCj4gPiAtICAgIC8qIGZpbmQgZmlyc3QgbWVtb3J5IHJhbmdl
IG5vdCBib3VuZCB0byBhIFhlbiBkb21haW4gKi8NCj4gPiAtICAgIGZvciAoIGkgPSAwOyBpIDwg
bWVtLT5ucl9iYW5rcyAmJiBtZW0tPmJhbmtbaV0ueGVuX2RvbWFpbjsgaSsrICkNCj4gPiArICAg
IC8qIGZpbmQgZmlyc3QgbWVtb3J5IHJhbmdlIG5vdCBib3VuZCB0byBuZWl0aGVyIGEgWGVuIGRv
bWFpbiBub3IgaGVhcA0KPiAqLw0KPiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBtZW0tPm5yX2Jh
bmtzICYmDQo+ID4gKyAgICAgICAgICAgICAgICAgKG1lbS0+YmFua1tpXS54ZW5fZG9tYWluIHx8
IG1lbS0+YmFua1tpXS54ZW5faGVhcCk7IGkrKyApDQo+ID4gICAgICAgICAgIDsNCj4gPiAgICAg
ICBpZiAoIGkgPT0gbWVtLT5ucl9iYW5rcyApDQo+ID4gICAgICAgICAgIHJldHVybiAwOw0KPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaA0KPiBiL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ID4gaW5kZXggMmJiMDFlY2ZhOC4uZTgwZjNk
NjIwMSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaA0K
PiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ID4gQEAgLTI3LDYg
KzI3LDcgQEAgc3RydWN0IG1lbWJhbmsgew0KPiA+ICAgICAgIHBhZGRyX3Qgc3RhcnQ7DQo+ID4g
ICAgICAgcGFkZHJfdCBzaXplOw0KPiA+ICAgICAgIGJvb2wgeGVuX2RvbWFpbjsgLyogd2hldGhl
ciB0aGUgbWVtb3J5IGJhbmsgaXMgYm91bmQgdG8gYSBYZW4NCj4gZG9tYWluLiAqLw0KPiA+ICsg
ICAgYm9vbCB4ZW5faGVhcDsgICAvKiB3aGV0aGVyIHRoZSBtZW1vcnkgYmFuayBpcyByZXNlcnZl
ZCBhcyBoZWFwLiAqLw0KPiANCj4gV2UgaGF2ZSBtdWx0aXBsZSBoZWFwOiBzdGF0aWMsIGRvbWFp
biwgeGVuLiBBRkFJVSwgJ3hlbl9oZWFwJyByZWZlcnMgdG8NCj4gYm90aCBkb21haW4gYW5kIHhl
biB3aGVyZWFzICd4ZW5fZG9tYWluJyByZWZlcnMgdG8gJ3N0YXRpYycuDQo+IA0KPiBJbiBsaW5l
IHdpdGggd2hhdCBJIHdyb3RlIGFib3ZlLCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciBpZiB3
ZSBoYXZlIGENCj4gc2luZ2xlIGZpZWxkICdoZWFwJyB3aGljaCBpcyBhbiBlbnVtIGxpc3Rpbmcg
dGhlIHR5cGUgb2YgaGVhcC4NCg0KU3VyZSwgd2lsbCBmb2xsb3cgdGhpcyB3YXkuDQoNCktpbmQg
cmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFs
bA0K

