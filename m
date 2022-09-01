Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20EA5A999B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 16:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396658.636891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTklk-0002ze-84; Thu, 01 Sep 2022 14:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396658.636891; Thu, 01 Sep 2022 14:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTklk-0002wa-4h; Thu, 01 Sep 2022 14:02:08 +0000
Received: by outflank-mailman (input) for mailman id 396658;
 Thu, 01 Sep 2022 14:02:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjVP=ZE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTkli-0002wU-UR
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 14:02:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8d2392b-29fe-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 16:02:05 +0200 (CEST)
Received: from DB3PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:8:1::48) by
 PAWPR08MB9759.eurprd08.prod.outlook.com (2603:10a6:102:2ee::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.14; Thu, 1 Sep 2022 14:02:02 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::83) by DB3PR06CA0035.outlook.office365.com
 (2603:10a6:8:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 14:02:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 14:02:02 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 01 Sep 2022 14:02:02 +0000
Received: from 19c5739e72f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7AFD6882-BA24-4CDA-95BC-A9B3C6921203.1; 
 Thu, 01 Sep 2022 14:01:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19c5739e72f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 14:01:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9794.eurprd08.prod.outlook.com (2603:10a6:102:31e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 1 Sep
 2022 14:01:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 14:01:48 +0000
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
X-Inumbo-ID: a8d2392b-29fe-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=C6+YE+uy5+ov6Rst3LIGY2xvihyEqZ1WiuFroiv1BpID5esZwlhHO3gJd1kb9K9wXnFofNTL8pTAWtfWl5PrlwiZW4SYSZ+PeGNKcNQ/dCeHwjDdV0VOadYhlpMXPCkm6zj5dm66RB0wMOSyxRYtX9ojsn60CojvO2/wUkwxLVV5E2DJTjlH2G5yFS/Ftp2ZIBIRHiDsIZqNwReI0RioLgGSP90GvskRjRrD3ejqzZdqj6MO6SwRRg8wsaqH2zN1J5n9ZQ0ezaItMfkywwtJ6+PcoIj1mT9GybyWQ2Zw5qwh4/dHMSNK5RK7AFCiDZF9YiuVWWcGmndv5NPTjBTOxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCPMpw+EYjLC56Bj4h/VlKmjqs41r2bMepqHO+rVH/4=;
 b=U//WPsOxQREzhcNWYkkFnDXzVEeLG1+aBz5WGwFFJXc5rqKT30JHlekwRNO3vlsJ0NdbbSbRCW1xEdciQF8Y2EvbT9DvHNqQVboNL6ax7FVT5yKh++l35h0w00/hFYJvCvU7fk2C43m5Wbp71tnA+dEWrAgP+nrN+C8qvwl2Zwo9l31Wz3VpAzXHfU/DT5E+62aA/FqF+x5L0fx1gWScL01uckLekAU2n5b5XCMJZbbSIL8Bp+f90v7QLTAq5Sbrq/zFdXPRwHSRp9JXeLFTlCOYyZk4uVu1HknWB0fJr7fI8C+TwLrOqDFuIEJRk890Xnu78vu2C3YqNspZb+d+yQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCPMpw+EYjLC56Bj4h/VlKmjqs41r2bMepqHO+rVH/4=;
 b=0NIGSGyRcLIINRexXQsUzNhnogpo1iWohAdQiH51S7e3oITlmDf2XylXGtKlWeZgF8mAv+VkGqtLC8xEJY5dL4Txxq4pjEhCYDxxxVQ8gR0P3ZNlS8B0/BHyCzuZ8wfphw/Ykiqy3KT+t36azQeXuKH05Wc+5bigbbSLTnGUfEk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjvarLlXFDSiQqs2fXALkSm5fQH9zURrPa44YpFLbJyFk4Y9FnFzNTWTtOayJ8PMA4eJCNS3iMbzKzE0Tcu7fNAaisEk7ZFWRfhVwdieQR40IVKoP6To9jVUW84RZngaJYGZgAHDXol00qd9uhIlbcEb+mP2ncWpgvVDqFYTEEUaheG/shKUfx5iQHe+AJ+YtLPabQQEYBSJw4MQwanLeuST+oDX6NwtYRnxjgCxgH+4eOfFTg2RYu2KiGauCeU2TyeFSkZRAa4u82rB7G7rjDTlFkvMUN45wcXqLmUCZcgQhkDV+bjS+Q3LrOxGUkZxIkWOy4lSKVleDq2FnOtCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCPMpw+EYjLC56Bj4h/VlKmjqs41r2bMepqHO+rVH/4=;
 b=oOnmstP/dYXZm18F4KDrxrCUQ2f/qqp94Q9OeZRDUKau9wKj4NorXA4K0Kr7+5M9BY04aWzCjgMaiifadQ1/7Y7saPdE7+6v1TWswNTb5e8Lsnihe9Yu0/TzQGBMgv62DcJbFrg51G9wrXR8d/UIaN1eW1HCLki94LmY8w4KUDKc60HGjxl/Dby9Qgiz5zSUjnJhEG5xxBST0jUrls/64NV6Ll7SbZDTNKmJZgyWISqRPtdQHYjxB8Hse/eQIpoahM2omPsXHaWvIO4rEuQtADfGRlYfcWuQtZkPmToNapdgl68Dd0yvkJzzJMMfmowi3Dd1JdJIuikc38DN6xzVmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCPMpw+EYjLC56Bj4h/VlKmjqs41r2bMepqHO+rVH/4=;
 b=0NIGSGyRcLIINRexXQsUzNhnogpo1iWohAdQiH51S7e3oITlmDf2XylXGtKlWeZgF8mAv+VkGqtLC8xEJY5dL4Txxq4pjEhCYDxxxVQ8gR0P3ZNlS8B0/BHyCzuZ8wfphw/Ykiqy3KT+t36azQeXuKH05Wc+5bigbbSLTnGUfEk=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugTfbCAM/WyEil7pMplK0r3q3GqcQAgAP89wCAAACAYA==
Date: Thu, 1 Sep 2022 14:01:48 +0000
Message-ID:
 <AS8PR08MB7991DFAAFDE9CBB81C75E636927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
 <a261649f-7c8a-83ce-e3be-409de315133c@xen.org>
In-Reply-To: <a261649f-7c8a-83ce-e3be-409de315133c@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C5EC30BCACE04843A9C3BED6115F7904.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7397353d-c5b1-4ab4-8b39-08da8c228b87
x-ms-traffictypediagnostic:
	PAVPR08MB9794:EE_|DBAEUR03FT057:EE_|PAWPR08MB9759:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mBpmUnnIQlGINjMod4BH7sigkdekJX8uQJPtIC/8bSJMSes22oVdN8PsOZX0v9k6OJX8t2K0/XmWpDTgU5DN9EKvrq5cBMCVJZHOL06r9BzU0tpLzTj+8/vU8/99e2wXJWqKfmg4HTFmBdRhsa6KWvSB2I0nEgrPfkSVPAMm51fvtYW5n+kU9ie+B/LVmbhjQGfVGAnNLiiCD0IWgtaeEyHA9f4Q8XV5/NyBWG06tnHkC+4mwcaCEOAZotAPPXy5I5ftIrvD1/mQo++AJomqhKJ/02C4aMGHMQG8tEo+Rr3Un40MyCwyneOzd4SANmB3C/yy7Q0NsMqFkbu66nO6RSAW01b9sf7zI80OsaqEwtQ4MO4I5QLMRyDxA+vXGm5AApTYVKLu1595/2I6nvG927GUf42DQw9MBNClv37x6eSoxZ9h1x2fvVcRbV9QDsMewvYHGR0+OYFu2zwPJ9kA7+ZYNJF8qN4pPEnrvmWjOZ49ffIy2XXZrevpF2PRa+uaB0IDmMuIJ+szZJRBtPLcRHueTlrC6YjCDQVBzkxdrOIbsvJaMY38QzxEbBKM/F54fDnidGywCXvLF3DcNfcO+hDdEuE9+11tgsRFT+GlHRIejPCHgwkSsIMVQcL8iha8dyVmu7Aqwb5ddetpGn3c1uIVGBZMWfZM9ain+86PkGuGRYn1ILT/8Q+KbzujtOlUcEoGbmPooAVaIIDySgO4TNN1qZWde4OFoNiN8E0iAavKayEl7d8my3fGTI5spe15
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(478600001)(9686003)(5660300002)(71200400001)(55016003)(83380400001)(316002)(186003)(54906003)(6916009)(38100700002)(76116006)(38070700005)(122000001)(4744005)(33656002)(66446008)(64756008)(4326008)(8676002)(66556008)(66476007)(26005)(7696005)(8936002)(52536014)(6506007)(66946007)(41300700001)(86362001)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9794
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2b60729-d345-41d3-1d7e-08da8c228382
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pz8Rr54yAMYTWa/1R64jv1Rwfmefoe0s4xzxFW8wsIAC+FJ+EWq2TSEmDrsPZ/lXyqVB1DOsn3VrYJBHM4l2yUcMDkkoqJbTeFq9O+6eyH7v6y/lvfIsk0M72abiqt6AaOKga0k3CCHm1+i2bzvMDdcoWt68uUEaRdgBmObXs10ol6R8uplKMJctMwP08SASSGggTRbbYeX0aQ5lhn5yxdsRxYSI/xLdytIzitbPI1AQEUSRfJPfiQE+Os4IwLXvM3IVJvOrkBYLYTQLXDjGn3wWJzRR5V+UvjjUv/c7gCXkiOEP1oX4eDVP7V0t09xyapRKUsPNkIMWPzm8RfbuL2X1NY/gu1A7v7ewDhjJp3rJLrTp8b4xSElV9MskBBKqm/jr58uCcVB32mCiVgqQma4jwmbS5ZxiAGXrTIFuOEfyJuavS2jd3JnQEgZxBgvlxtuk908YgVnsGlFE85+1ZjGFT5facCJBoUaJPgj4gF6YLYyEb9F9bQDi0rn1A2ttnx668N11iYypO8aG5wpMYGOT2Rlov24d/ieq8zQ82MYt6mNqIa1XTf7reVR3W6j7YbnBnRKygLA9FVL0hjDBZpT6D9CXAuNU55jZqDCqa37/NIIB8SRPzTNgITP371D0hzhZVvwoIH/WLLiHAVb8fwJ0AUV33uas7ttWC8hkNxo1CXobjWRYU/QQ2r0+wEyhK2GFdJb+W80K0WKtv/WMgJY+E7pFMSNwr8SihcoWdeOC5qBPS3qDLpDOL/kl6/GPIBy8gVKg4/We2yPH+1I82A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(40470700004)(36840700001)(41300700001)(70206006)(86362001)(336012)(70586007)(2906002)(4744005)(6506007)(52536014)(7696005)(8676002)(8936002)(40460700003)(6862004)(36860700001)(5660300002)(478600001)(40480700001)(55016003)(83380400001)(107886003)(4326008)(47076005)(186003)(33656002)(81166007)(356005)(82310400005)(9686003)(82740400003)(316002)(26005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 14:02:02.3882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7397353d-c5b1-4ab4-8b39-08da8c228b87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9759

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+ICsgICAgcGFkZHJfdCByZXNlcnZlZF9oZWFw
X3N0YXJ0ID0gfjAsIHJlc2VydmVkX2hlYXBfZW5kID0gMCwNCj4gPg0KPiA+IElOVkFMSURfUEFE
RFIgb3IgfjBVTEwNCj4gDQo+IEkgd291bGQgc3Ryb25nbHkgcHJlZmVyIHRoZSBmb3JtZXIuIEl0
IGlzIG1vcmUgZGlmZmljdWx0IHRvIHVuZGVyc3RhbmQNCj4gd2hhdCdzIHRoZSB2YWx1ZSBtZWFu
cyBpbiB0aGUgbGF0dGVyLg0KDQpUaGFua3MgZm9yIHRoZSBpbnB1dC4gWW91IG1lYW4gdGhlIElO
VkFMSURfUEFERFIgY29ycmVjdD8gWWVhaA0KdGhpcyBpcyB0aGUgb25lIHRoYXQgSSB1c2VkIGlu
IG15IGxvY2FsIHYyLCB3aWxsIHNlbmQgaXQgdG9tb3Jyb3cgYWZ0ZXINCmRvaW5nIHRoZSBib290
aW5mbyBjaGFuZ2UuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

