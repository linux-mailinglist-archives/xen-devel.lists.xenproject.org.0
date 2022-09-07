Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63545B0598
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401788.643724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvNI-0007T6-Dx; Wed, 07 Sep 2022 13:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401788.643724; Wed, 07 Sep 2022 13:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvNI-0007R0-As; Wed, 07 Sep 2022 13:45:52 +0000
Received: by outflank-mailman (input) for mailman id 401788;
 Wed, 07 Sep 2022 13:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVvNG-0007Qd-Et
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:45:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c772fa-2eb3-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 15:45:49 +0200 (CEST)
Received: from DB8PR09CA0033.eurprd09.prod.outlook.com (2603:10a6:10:a0::46)
 by DU0PR08MB9510.eurprd08.prod.outlook.com (2603:10a6:10:44e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 13:45:45 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::b2) by DB8PR09CA0033.outlook.office365.com
 (2603:10a6:10:a0::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 13:45:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:45:45 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 07 Sep 2022 13:45:45 +0000
Received: from 8907261c5424.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A530EC52-B7A8-4573-BDEA-0E477679BC96.1; 
 Wed, 07 Sep 2022 13:45:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8907261c5424.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:45:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9529.eurprd08.prod.outlook.com (2603:10a6:102:315::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Wed, 7 Sep
 2022 13:45:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:45:32 +0000
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
X-Inumbo-ID: 61c772fa-2eb3-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OZjV2yfvtU45OoNNjd2lnSL7KdWiLM6GEJ86macBmDJpsElzsGcV/17iRX7mFDjuFQb1/VNh7e7ZW1B+qA6IrwGw5u1JRQ7bEzxv8bzxi7Rxp7Ey11cDEzrTrdlXTo7THKHOFadPePQuhIzK45mE4CtXGiZIKBGda0yuzUuCQ0UzkyBY1gSemS+NPPqitWeFCqoboL7zxQiMfpPYjDS07+G4a5WkryQvbUMGrqDEmDmAlS5ntvYZxleEMJ3QnlaV0cmQkYLHzw/mmJ0jSt+z9T4BByFeQYmzWC5GiQ6atIjhy0XOV3W/fJ1NE7Wfb1ZeovALDuUwVlHB9Vchcx/eyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW8kksXgCohTQpA5fJT/sgCrHtu4S8LSud7hm/Mh7Eg=;
 b=XDS3DqJp8qHdBtpFH60jerYJ7Q2xU08ntHv/+TyH5ZfDKXzpi+OpJM8l1WyenRbVJjbB9RHY8sdc+S/hqajepaJJZHyR6g9/tuA+U4fka/tY56pLRk0xJlAE4m+pPzGBzMzu7H+W4RYUPJ+lpm+fizg5QQtZg+AlyUHkcwmhYFo+R9yUygd3jSSmg3Ij/87nqXXkXvjJrDs9wDKlrcGOhY/6kCCUlbMU5ZpIZGdRu4FUTe+Bjr3ZC6zA/g8osluW9GunUzewQJv0r0jOVFho/y4484/BEXr9PIC3JObUTY41lCe5snuvz8UfYgj/9X3dyk01CXIBc0ntF/ahO+pnTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW8kksXgCohTQpA5fJT/sgCrHtu4S8LSud7hm/Mh7Eg=;
 b=yll9oagnJd+Ifyr9NsKcBL8qo7qViwnuHX4xRX/BWH2BzW1MBgQiFeKx825EDrMwcxWRC3k/FsiQAnlILzuuvPL3u428Mk4wlSynr8Q/xCdtJGCjURqG8rvXu/dO3PfMjzGz89xxnHWt7auMdeoiAZD3+iZrjm0XTOD21rr5o2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 27a45b3b1b1de54e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA0m7JKOEmSxIRQLEQBAj5J1/8WGic28ZQC+2ixPMoZJtz714zr+emxChoGjMA1MqS7YB0EGW6uYmrQh1cirzuneNJQGaRHMYIjYjM7nDoEMr3patRkpv9OKsQ3WP2OPdO8HcdL+C2217p6B7hAle1S9ZpS4JzD4zja3eVkJsaN+pmdc7YaVFnho+gl3vn/UZvvjunqreQKCXB6hE6IYOWnVv5t9fWzUDL7Tuy/QG7jnGUSMhIpfPYR9+g0emyBcLpSvKcDxorZzC9XgKiBc7MxlbXHPWyaKg2gtNrR7ajdDTLP4ubkbkn3M8LSrQwwFYZxRehPV5nM4SPYLB0G3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW8kksXgCohTQpA5fJT/sgCrHtu4S8LSud7hm/Mh7Eg=;
 b=ApiTo+iEFZB3DAlh2y3rW4ME52vIfyAO8YU4IxjWIcLUQvKNombIN89uIQlwkbxvTB6gENyxm2HShv/wtmf8e0OYyffrMtoe6axNw1K3j1DLGZMt1akXGg5qxa3bQ4jpe+JcjkRFJpVv86Xbe7gvWtYQPc1FCaTOJ2/GxjhR5v8nzHiuzgMZiyrc/GQvm1HCKoPbkEQyK7APzODlhKAORCpIdOXmcgHsEuXhE4r29UJe4l6E9VEQzRso8IpG/5ndRhbSF1ttS+MWGZcxJm/q1usZ44fIe5YSgkXZ8BM8CqhJ6M9Yl6ANrHCwKgSYoA4TA7H8iW5xl9dwQPN7RP1h4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW8kksXgCohTQpA5fJT/sgCrHtu4S8LSud7hm/Mh7Eg=;
 b=yll9oagnJd+Ifyr9NsKcBL8qo7qViwnuHX4xRX/BWH2BzW1MBgQiFeKx825EDrMwcxWRC3k/FsiQAnlILzuuvPL3u428Mk4wlSynr8Q/xCdtJGCjURqG8rvXu/dO3PfMjzGz89xxnHWt7auMdeoiAZD3+iZrjm0XTOD21rr5o2Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ4p6pfICa8EGhkwL2mg6iHK3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCAgAAA4QCAAAB+gIAAARoAgAACMwA=
Date: Wed, 7 Sep 2022 13:45:32 +0000
Message-ID: <759E29A4-AADA-4678-A88B-E96C5C15A462@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
 <eed26206-9684-4010-278c-14ed3602582b@amd.com>
In-Reply-To: <eed26206-9684-4010-278c-14ed3602582b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8de9f440-68e0-4aba-9209-08da90d743a4
x-ms-traffictypediagnostic:
	PAVPR08MB9529:EE_|DBAEUR03FT065:EE_|DU0PR08MB9510:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QzaRw/GdFgm7seDWdTTt1MBzq+DyrlCTvUudle/HYI6UWtO3or5eW7XPIgKVKT3tJWwNbHDrX4i4HionSXmD7/PpGUXsfi8SsEdC+CL9ojgsAPUoA6BzWm84gaG/bhNmQGWOURJeUfN+2gb8HB6R+vf30gIy3hBf7jrFjCjOPj2HEatmWtPkTOzmTRFSf9lF3WrRJT8VjG2vJ3Lzdo5xSdk7rzwD4BAE7+OfKZrnyldxyqE8ekvoosJbo8lhEbt3XWC+ATaJWFONsGo65g9SmlWSqqtoFFtqvqWaaSdpigih2JMXX5LtxYhtGXN7tMyIutUbfrzJpGQJxcdE72OFEIqoe3ipRPwL7ZC4U8FOI59gaFySHCV0WQGKX/8fJcPEMzch1hTyO9YChadDwMl6SMk3WaRf7Tl0Lv3HRafb5ox76iiIQlLjCVv4piAtsycW40JgPOu1gP9cyarBeuJPeLa50AMrueu/qk8Xp6xYKEOni3DVHiM8qjBP6jV9sZVt4IqFuBhxyeeHZL9vkJxHxDmWE8xKoTdcFuwl/Z80pBU/WJ0cm+tQYg7M2Oz+74ORXXJpASGZLK/XnZk9A2147gjK6VNKeGCak+SsO6uhJN+SzFlXVqOHyCdGSOTbwjwRjMIPSn4Jbq1EmkyKiqO8Bxe7u5kfV6KfiJhaZ+zkNtg01j733P0xzddpcLoUbJczb3am8LEmt2/PVn65K9Gbo+2mQMrZ5Ttm4hc5+3QSeJi8i/L/YovzEXPJIikGMXAw19R43vX+zfi5kIAEAl2c1RwHp6RorHwDW1ZgURh3ufs/k64l7/Zs/GHwETBT/Bsiy24D29noTIIKSVpz6I3gNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(186003)(2616005)(6506007)(478600001)(26005)(8936002)(86362001)(6512007)(5660300002)(966005)(33656002)(36756003)(53546011)(6486002)(41300700001)(6916009)(71200400001)(38070700005)(38100700002)(66446008)(83380400001)(2906002)(66946007)(45080400002)(8676002)(64756008)(66476007)(66556008)(76116006)(122000001)(91956017)(316002)(54906003)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <56932856A2C77946AEF0B70B6EE5B77B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9529
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	00d259e9-5c9c-4d91-50a9-08da90d73bdd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yKwnlFOmVpLxj67eQMmk5luQgflMDiM1acgXhd39E55/I/7qJcbQ4SVxV8jq6HnX4ovbJKJsOP+0/NkmKsqugrVbUTiddCDZnQOHX4NzJVA5kInJU++HySpn1xROjmFVgvVEvt3tKLToJD3Ne1Sy0193ICZD4Vtgz1YO49TjL8kCAp+Em1f3kgrBDF62Qmv/oFiKZpV4Yo6nknG7Rq2f7YSpbhHdCzxFWnA05vpaUq1+7GsrhVBuY8GqnRaSk0gcepiD1nJjIT7RWGyof7S6mQ/fumugF7oWiqWzBXR4eJtSNFD2GvrwBehmnlAk7u23iCM00a5fJOle5p5oVgD/LxfOA3V4z6n0Fvj/g9vfwNunKAU0hOAfG3jKnOT8LZ6TasjVU1Yfj/eo/FYESszcfFH3rAytZNylEVtc70k+MTZIk3c3qv8GDwXjH2/udAM4DyYJzBotOAZF1IWnGwxdHqSXrxFK/k89XUH28ejO2Psb1cHf6Mf8dJs/RysDkpec7aO8zWYSG0lSNyMiqH4MYwv565mtXLuULgeEPSogf5rJM9L71scP2EQODYnnADgA6sNX74ui3qHlScIXcZDWtesUvB5ibjP0Xp87LDih+AzNOH1Pf2EjMPIVRspWf+BzoH+Uul5N+GUZc7dtFTMyF/hIBXdmayKKAKopQGWH384kH1vvJDe1vdxbjpwVUUBM2mXGhONmBTdjdTo3ftpNJvlK9vUDBx6CPB2hz0i/7oWXSsrAiSdKdCl7SUZwfcQukVgN3igyUTrY6183EURQvjZmaIRFRfgzK9Tt5yPxsFY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(36840700001)(40470700004)(2616005)(26005)(45080400002)(70206006)(6506007)(356005)(53546011)(2906002)(6512007)(81166007)(41300700001)(5660300002)(336012)(47076005)(36756003)(186003)(478600001)(6862004)(8676002)(8936002)(4326008)(6486002)(83380400001)(40460700003)(33656002)(966005)(36860700001)(54906003)(40480700001)(82740400003)(316002)(86362001)(70586007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:45:45.3417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de9f440-68e0-4aba-9209-08da90d743a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9510

SGksDQoNCj4gT24gNyBTZXAgMjAyMiwgYXQgMTQ6MzcsIE1pY2hhbCBPcnplbCA8bWljaGFsLm9y
emVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNy8wOS8yMDIyIDE1OjMzLCBC
ZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gDQo+Pj4gT24gNyBTZXAgMjAyMiwgYXQgMTQ6MzEs
IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IA0K
Pj4+IA0KPj4+IE9uIDA3LzA5LzIwMjIgMTU6MjgsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+
Pj4+IA0KPj4+PiBIaSBNaWNoYWwsDQo+Pj4+IA0KPj4+Pj4gT24gNyBTZXAgMjAyMiwgYXQgMTQ6
MDksIE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+
Pj4+PiANCj4+Pj4+IE9uIDA3LzA5LzIwMjIgMTQ6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+
Pj4+PiANCj4+Pj4+PiBPbiAwNy8wOS8yMDIyIDEzOjQxLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+
Pj4+Pj4+IA0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gMDcvMDkvMjAyMiAxNDozMiwgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPj4+Pj4+Pj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiBPbiAwNy8wOS8yMDIyIDEzOjEyLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+Pj4+
Pj4+Pj4gSGkgSnVsaWVuLA0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBIaSBNaWNoYWwsDQo+Pj4+Pj4+
PiANCj4+Pj4+Pj4+PiBPbiAwNy8wOS8yMDIyIDEzOjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBIaSBIZW5yeSwNCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+
IFdoaWxlIHJldmlld2luZyB0aGUgYmluZGluZyBzZW50IGJ5IFBlbm55IEkgbm90aWNlZCBzb21l
IGluY29uc2lzdGVuY3kNCj4+Pj4+Pj4+Pj4gd2l0aCB0aGUgb25lIHlvdSBpbnRyb2R1Y2VkLiBT
ZWUgYmVsb3cuDQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBPbiAwNy8wOS8yMDIyIDA5OjM2LCBI
ZW5yeSBXYW5nIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4gKy0geGVuLHN0YXRpYy1oZWFwDQo+Pj4+Pj4+
Pj4+PiArDQo+Pj4+Pj4+Pj4+PiArICAgIFByb3BlcnR5IHVuZGVyIHRoZSB0b3AtbGV2ZWwgImNo
b3NlbiIgbm9kZS4gSXQgc3BlY2lmaWVzIHRoZSBhZGRyZXNzDQo+Pj4+Pj4+Pj4+PiArICAgIGFu
ZCBzaXplIG9mIFhlbiBzdGF0aWMgaGVhcCBtZW1vcnkuIE5vdGUgdGhhdCBhdCBsZWFzdCBhIDY0
S0INCj4+Pj4+Pj4+Pj4+ICsgICAgYWxpZ25tZW50IGlzIHJlcXVpcmVkLg0KPj4+Pj4+Pj4+Pj4g
Kw0KPj4+Pj4+Pj4+Pj4gKy0gI3hlbixzdGF0aWMtaGVhcC1hZGRyZXNzLWNlbGxzIGFuZCAjeGVu
LHN0YXRpYy1oZWFwLXNpemUtY2VsbHMNCj4+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4+ICsgICAg
U3BlY2lmeSB0aGUgbnVtYmVyIG9mIGNlbGxzIHVzZWQgZm9yIHRoZSBhZGRyZXNzIGFuZCBzaXpl
IG9mIHRoZQ0KPj4+Pj4+Pj4+Pj4gKyAgICAieGVuLHN0YXRpYy1oZWFwIiBwcm9wZXJ0eSB1bmRl
ciAiY2hvc2VuIi4NCj4+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4+ICtCZWxvdyBpcyBhbiBleGFt
cGxlIG9uIGhvdyB0byBzcGVjaWZ5IHRoZSBzdGF0aWMgaGVhcCBpbiBkZXZpY2UgdHJlZToNCj4+
Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4+ICsgICAgLyB7DQo+Pj4+Pj4+Pj4+PiArICAgICAgICBj
aG9zZW4gew0KPj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICN4ZW4sc3RhdGljLWhlYXAtYWRkcmVz
cy1jZWxscyA9IDwweDI+Ow0KPj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICN4ZW4sc3RhdGljLWhl
YXAtc2l6ZS1jZWxscyA9IDwweDI+Ow0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gWW91ciBiaW5k
aW5nLCBpcyBpbnRyb2R1Y2UgI3hlbixzdGF0aWMtaGVhcC17YWRkcmVzcywgc2l6ZX0tY2VsbHMN
Cj4+Pj4+Pj4+Pj4gd2hlcmVhcyBQZW5ueSdzIG9uZSBpcyB1c2luZyAje2FkZHJlc3MsIHNpemV9
LWNlbGxzIGV2ZW4gaWYgdGhlIHByb3BlcnR5DQo+Pj4+Pj4+Pj4+IGlzIG5vdCAicmVnIi4NCj4+
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IEkgd291bGQgbGlrZSBzb21lIGNvbnNpc3RlbmN5IGluIHRo
ZSB3YXkgd2UgZGVmaW5lIGJpbmRpbmdzLiBMb29raW5nIGF0DQo+Pj4+Pj4+Pj4+IHRoZSB0cmVl
LCB3ZSBhbHJlYWR5IHNlZW0gdG8gaGF2ZSBpbnRyb2R1Y2VkDQo+Pj4+Pj4+Pj4+ICN4ZW4tc3Rh
dGljLW1lbS1hZGRyZXNzLWNlbGxzLiBTbyBtYXliZSB3ZSBzaG91bGQgZm9sbG93IHlvdXIgYXBw
cm9hY2g/DQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBUaGF0IHNhaWQsIEkgYW0gd29uZGVyaW5n
IHdoZXRoZXIgd2Ugc2hvdWxkIGp1c3QgdXNlIG9uZSBzZXQgb2YgcHJvcGVydHkNCj4+Pj4+Pj4+
Pj4gbmFtZS4NCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IEkgYW0gb3BlbiB0byBzdWdnZXN0aW9u
IGhlcmUuIE15IG9ubHkgcmVxdWVzdCBpcyB3ZSBhcmUgY29uc2lzdGVudCAoaS5lLg0KPj4+Pj4+
Pj4+PiB0aGlzIGRvZXNuJ3QgZGVwZW5kIG9uIHdobyB3cm90ZSB0aGUgYmluZGluZ3MpLg0KPj4+
Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBJbiBteSBvcGluaW9uIHdlIHNob3VsZCBmb2xsb3cgdGhlIGRl
dmljZSB0cmVlIHNwZWNpZmljYXRpb24gd2hpY2ggc3RhdGVzDQo+Pj4+Pj4+Pj4gdGhhdCB0aGUg
I2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIGNvcnJlc3BvbmQgdG8gdGhlIHJlZyBwcm9w
ZXJ0eS4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gSG1tbS4uLi4gTG9va2luZyBhdCBbMV0sIHRoZSB0
d28gcHJvcGVydGllcyBhcmUgbm90IGV4Y2x1c2l2ZSB0byAncmVnJw0KPj4+Pj4+Pj4gRnVydGhl
cm1vcmUsIEkgYW0gbm90IGF3YXJlIG9mIGFueSByZXN0cmljdGlvbiBmb3IgdXMgdG8gcmUtdXNl
IHRoZW0uIERvDQo+Pj4+Pj4+PiB5b3UgaGF2ZSBhIHBvaW50ZXI/DQo+Pj4+Pj4+IA0KPj4+Pj4+
PiBBcyB3ZSBhcmUgZGlzY3Vzc2luZyByZS11c2FnZSBvZiAjYWRkcmVzcy1jZWxscyBhbmQgI3Np
emUtY2VsbHMgZm9yIGN1c3RvbSBwcm9wZXJ0aWVzIHRoYXQgYXJlIG5vdCAicmVnIiwNCj4+Pj4+
Pj4gSSB0b29rIHRoaXMgaW5mbyBmcm9tIHRoZSBsYXRlc3QgZGV2aWNlIHRyZWUgc3BlY3MgZm91
bmQgdW5kZXIgaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGd3d3LmRldmljZXRyZWUub3JnJTJGc3BlY2lmaWNhdGlvbnMlMkYm
YW1wO2RhdGE9MDUlN0MwMSU3Q21pY2hhbC5vcnplbCU0MGFtZC5jb20lN0NjNjc3YTc5ODNjZDk0
ZTQ4NjIwNzA4ZGE5MGQ1YTE1ZiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdD
MCU3QzAlN0M2Mzc5ODE1NDQ0ODc0ODk2OTIlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9MXV3dGYlMkY2c2hmMlBpS3UwWFpQRk5RJTJC
Nml5aExyTXNZYjFYRXJ1M0lHbGclM0QmYW1wO3Jlc2VydmVkPTA6DQo+Pj4+Pj4+ICJUaGUgI2Fk
ZHJlc3MtY2VsbHMgcHJvcGVydHkgZGVmaW5lcyB0aGUgbnVtYmVyIG9mIDx1MzI+IGNlbGxzIHVz
ZWQgdG8gZW5jb2RlIHRoZSBhZGRyZXNzIGZpZWxkIGluIGEgY2hpbGQgbm9kZSdzIHJlZyBwcm9w
ZXJ0eSINCj4+Pj4+Pj4gYW5kDQo+Pj4+Pj4+ICJUaGUgI3NpemUtY2VsbHMgcHJvcGVydHkgZGVm
aW5lcyB0aGUgbnVtYmVyIG9mIDx1MzI+IGNlbGxzIHVzZWQgdG8gZW5jb2RlIHRoZSBzaXplIGZp
ZWxkIGluIGEgY2hpbGQgbm9kZeKAmXMgcmVnIHByb3BlcnR5Ig0KPj4+Pj4+IA0KPj4+Pj4+IFJp
Z2h0LiBCdXQgdGhlcmUgaXMgbm90aGluZyBpbiB0aGUgd29yZGluZyBzdWdnZXN0aW5nIHRoYXQN
Cj4+Pj4+PiAjYWRkcmVzcy1jZWxscyBhbmQgI3NpemUtY2VsbHMgY2FuJ3QgYmUgcmUtdXNlZC4g
RnJvbSBbMV0sIGl0IGlzIGNsZWFyDQo+Pj4+Pj4gdGhhdCB0aGUgbWVhbmluZyBoYXMgY2hhbmdl
ZC4NCj4+Pj4+PiANCj4+Pj4+PiBTbyB3aHkgY2FuJ3Qgd2UgZG8gdGhlIHNhbWU/DQo+Pj4+PiBJ
IHRoaW5rIHRoaXMgaXMgYSBtYXR0ZXIgb2YgaG93IHNvbWVvbmUgcmVhZHMgdGhlc2Ugc2VudGVu
Y2VzLg0KPj4+Pj4gSSBkbyBub3QgdGhpbmsgdGhhdCBzdWNoIGRvY3VtZW50cyBuZWVkIHRvIHN0
YXRlOg0KPj4+Pj4gIlRoaXMgcHJvcGVydHkgaXMgZm9yIHRoZSByZWcuIERvIG5vdCB1c2UgaXQg
Zm9yIG90aGVyIHB1cnBvc2VzLiINCj4+Pj4+IFRoZSBmaXJzdCBwYXJ0IG9mIHRoZSBzZW50ZW5j
ZSBpcyBlbm91Z2ggdG8gaW5mb3JtIHdoYXQgaXMgc3VwcG9ydGVkLg0KPj4+Pj4gDQo+Pj4+PiBP
biB0aGUgb3RoZXIgaGFuZCwgbG9va2luZyBhdCBbMV0gdGhlc2UgcHJvcGVydGllcyBnb3QgbmV3
IHB1cnBvc2VzDQo+Pj4+PiBzbyBJIHRoaW5rIHdlIGNvdWxkIGRvIHRoZSBzYW1lLiBOb3cgdGhl
IHF1ZXN0aW9uIGlzIHdoZXRoZXIgd2Ugd2FudCB0aGF0Lg0KPj4+Pj4gSSB0aGluayBpdCBpcyBk
b2FibGUgdG8ganVzdCBoYXZlIGEgc2luZ2xlIHBhaXIgb2YgI2FkZHJlc3MvI3NpemUgcHJvcGVy
dGllcy4NCj4+Pj4+IEZvciBpbnN0YW5jZSB4ZW4sc2hhcmVkLW1lbSByZXF1aXJpbmcganVzdCAw
eDEgZm9yIGFkZHJlc3Mvc2l6ZQ0KPj4+Pj4gYW5kIHJlZyByZXF1aXJpbmcgMHgyLiBUaGlzIHdv
dWxkIGp1c3QgaW1wbHkgcHV0dGluZyBhZGRpdGlvbmFsIDB4MDAuDQo+Pj4+IA0KPj4+PiBJIHRo
aW5rIHdlIHdhbnQgaW4gZ2VuZXJhbCB0byByZWR1Y2UgY29tcGxleGl0eSB3aGVuIHBvc3NpYmxl
Lg0KPj4+PiBIZXJlIHdlIGFyZSBhZGRpbmcgYSBsb3Qgb2YgZW50cmllcyBpbiB0aGUgZGV2aWNl
IHRyZWUgd2hlcmUgd2Uga25vdyB0aGF0DQo+Pj4+IGluIGFsbCBjYXNlcyBoYXZpbmcgb25seSAy
IHdpbGwgd29yayBhbGwgdGhlIHRpbWUuDQo+Pj4+IA0KPj4+PiBJIGFtIG5vdCBjb252aW5jZWQg
YnkgdGhlIGFyZ3VtZW50cyBvbiBub3QgdXNpbmcgI2FkZHJlc3MtY2VsbHMgYW5kIHdpbGwNCj4+
Pj4gbGVhdmUgdGhhdCBvbmUgdG8gU3RlZmFubw0KPj4+PiANCj4+Pj4gQnV0IGluIGFueSBjYXNl
IHdlIHNob3VsZCBvbmx5IGFkZCBvbmUgcGFpciBoZXJlIGZvciBzdXJlLCBhcyB5b3Ugc2F5IHRo
ZQ0KPj4+PiBvbmx5IGltcGxpY2F0aW9uIGlzIHRvIGFkZCBhIGNvdXBsZSBvZiAwIGluIHRoZSB3
b3JzdCBjYXNlLg0KPj4+IEkgYWdyZWUuIFRoZSBvbmx5IGRyYXdiYWNrIGlzIHRoZSBuZWVkIHRv
IG1vZGlmeSB0aGUgYWxyZWFkeSBpbnRyb2R1Y2VkIHByb3BlcnRpZXMNCj4+PiB0byBiZSBjb2hl
cmVudC4NCj4+IA0KPj4gQWdyZWUsIHNvbWVvbmUgd2lsbCBuZWVkIHRvIGRvIGEgcGFzcyBvbiB0
aGUgd2hvbGUgZG9jIHdoaWNoIG1pZ2h0IGJlIGVhc2llciB3aXRoIGFsbCB0aGluZ3MgaW4uDQo+
PiANCj4gV2VsbCwgbm90IG9ubHkgZG9jcy4gSWYgd2UgZGVjaWRlIHRvIHVzZSBhIHNpbmdsZSBw
YWlyIG9mICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscywgdGhlbg0KPiB3ZSBuZWVkIHRv
IG1vZGlmeSB0aGUgY29kZSB0aGF0IGV4cGVjdHMgZGlmZmVyZW50IHByb3BlcnRpZXMgZS5nLiB4
ZW4sc3RhdGljLW1lbS17YWRkcmVzcy9zaXplfS1jZWxscy4NCg0KUmlnaHQgSSBmb3Jnb3QgdGhh
dCBzb21lIHBhcnRzIGFyZSBhbHJlYWR5IGluLg0KU28gd2Ugd2lsbCBuZWVkIGFuIGV4dHJhIHBh
dGNoIHRvIGhhbmRsZSB0aG9zZS4NCg0KQmVydHJhbmQNCg0KPiANCj4+IENoZWVycw0KPj4gQmVy
dHJhbmQNCj4+IA0KPj4+IA0KPj4+PiANCj4+Pj4gQ2hlZXJzDQo+Pj4+IEJlcnRyYW5kDQo+Pj4+
IA0KPj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4gQ2hlZXJzLA0KPj4+Pj4+IA0KPj4+Pj4+IC0tDQo+
Pj4+Pj4gSnVsaWVuIEdyYWxsDQoNCg==

