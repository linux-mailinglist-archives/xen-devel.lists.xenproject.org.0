Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751DA52C9DA
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 04:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332573.556288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrW1t-0005D4-MI; Thu, 19 May 2022 02:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332573.556288; Thu, 19 May 2022 02:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrW1t-0005AF-IN; Thu, 19 May 2022 02:36:45 +0000
Received: by outflank-mailman (input) for mailman id 332573;
 Thu, 19 May 2022 02:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+51y=V3=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nrW1r-0005A9-Ub
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 02:36:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8385a3f6-d71c-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 04:36:41 +0200 (CEST)
Received: from DB6PR07CA0172.eurprd07.prod.outlook.com (2603:10a6:6:43::26) by
 AM0PR08MB3331.eurprd08.prod.outlook.com (2603:10a6:208:5b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 02:36:38 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::4e) by DB6PR07CA0172.outlook.office365.com
 (2603:10a6:6:43::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.5 via Frontend
 Transport; Thu, 19 May 2022 02:36:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 02:36:37 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Thu, 19 May 2022 02:36:37 +0000
Received: from 19da94ecff14.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 180682EA-4BDB-4DBC-AA22-1699C5127364.1; 
 Thu, 19 May 2022 02:36:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19da94ecff14.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 May 2022 02:36:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6796.eurprd08.prod.outlook.com (2603:10a6:10:2ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Thu, 19 May
 2022 02:36:29 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 02:36:29 +0000
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
X-Inumbo-ID: 8385a3f6-d71c-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BSjShLCE2H9pzDM45wgO1u/OYxOgu2UtgM/ralqbxNRxfH5vq60ddYbVMjbBywDu7BDodafSaxDooRbUPSy1cJ/XrInm1PRA0enaZVbOnjCT21k1rU0lEfQ20iXPHkFuyPsd0ID24d7h2k8XxzDFnHNasF0WptBWyr/0/ceUbVz2GYq2PuCiQk+qXEmibN/QimMuxVvJnazjK/CuXQgU/180bTN9Fda0t5VXN60vPFSdBloKuYrxlLcGq5siaivjrmG+zPA2AaVMeBpc12kWO5BZ78mKm+M3r9E92ieRu6vnZLLiKUgmBzz1jMCNjqjIQNkHS7EA0IS03+nYfEKFDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcYcWYo67SS8oRwVfMgyQwbAiML4RxhxUOaj5K+ZuKY=;
 b=aB9oPy/Q4kzvi6Bz+t2j3gPFexhtCCFARmxsIn2pkrA+Z16mMYhORFpk5cot+qo4cxIi1VfltjCiYQCDAg8ZptDm7ltEYiq2d3AFg5M920b+1elsGGV5viHpV0P4SMMhESmlBX/Niq1FkpXHpIeQ+k72z4w1sm61OqfuoO+ssRlYSysiWcgUseJkOnBp4nNPp6ezrKQr+kIf5PkZZYJkJKi5N+7CNW/Z84G45ebIcdog1CHifdqSRXFRxfXJSNrdFTY47mLTquFU8TUs7BHWgm3JBqmhzlnamtMilJ/F3weKGJkGdqVFf8QZAbGqpHez5Uj6pd/+W/4Na5FI6e5XTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcYcWYo67SS8oRwVfMgyQwbAiML4RxhxUOaj5K+ZuKY=;
 b=G3fVSojYGqzbOeAldkNoXxXGOaxgg4TErTe6IrbdOzwtfQJZeLTMiBPdXVcSv18eYUVLn5y3wWqOIlF9PG1ntsFqXlP/5pV4fviGEZspXu8wZASxDRr+JrPcFZxCaLs7WbUw0rIVJ79nUJRdgIlogs+E25py7RYKrdNCs0D3LS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3pZcdlimEbhyjiE5ajAkp80XyYzpvlG6eg0xM+5Xs6KPrAz94DiN0SN/SyvmXrRNBXBqSSyofTMPSh/W2iKYtVEiHX2jHR2c7keFAzryrGgma2YQIr3GT2ZXj4UBZPqrDpWWkh3KZ+NkgGHSdY0ua2E+LNZVse2CvBjY1UCfVMllAcCSEShpbsH1JAVjIUJqEOARBtjc27CrRAxWCw2NTYKPq120y+UCDILYCTVibNa43BYPhXKHtu4mMra6G2bX+9ENg8+rbg61ZT3fksC8JZsrimr3/cd3+oZbNDDaxtws4k1VAFFuRIEReOB4irr6cZIcPGvAyQBmdICaQhDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcYcWYo67SS8oRwVfMgyQwbAiML4RxhxUOaj5K+ZuKY=;
 b=d74/dlnupvcDpK0mFmBnKd9MYaxsS02M4pLc74x+5mELA/mq5+ZjvThY9GwZJD0n1/MPGgTafJ95RrFo54PFSeGFqXvqcxkmPY19deg/lgv55Xior8k1LYf4YaQCL7fUeG8E/XQXrpIfwC6TINfPjQZ1fW+NWDOyPPJ1b1h68GTNwGaM0wiYyhlrMYbKTfNznp4lS43nEvIlKDANg1+/UEaoLPN46/lXCUjH2C9Zbeb7R8jkdp+/IZUmfvwkOfnViyI5UMpKnW26MLsYPfPdlL8Yhz+1cbF3wCZuHI9f49zgll018Mn4R9cpSSAwlDH4Q4djfAFjBt0n9TzkFevxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcYcWYo67SS8oRwVfMgyQwbAiML4RxhxUOaj5K+ZuKY=;
 b=G3fVSojYGqzbOeAldkNoXxXGOaxgg4TErTe6IrbdOzwtfQJZeLTMiBPdXVcSv18eYUVLn5y3wWqOIlF9PG1ntsFqXlP/5pV4fviGEZspXu8wZASxDRr+JrPcFZxCaLs7WbUw0rIVJ79nUJRdgIlogs+E25py7RYKrdNCs0D3LS4=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jiamei Xie
	<Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
Thread-Index: AQHYZNkE0M8gmGVKY0iTs20r+BonU60kpgQAgADcFxA=
Date: Thu, 19 May 2022 02:36:28 +0000
Message-ID:
 <PAXPR08MB7420C70C703B1C006A3403EE9ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-3-wei.chen@arm.com>
 <9b04ca55-f617-dc14-cbf0-a3e427ad5869@suse.com>
In-Reply-To: <9b04ca55-f617-dc14-cbf0-a3e427ad5869@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: julien@xen.org,Bertrand.Marquis@arm.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E868C6518C01E148817EC27BD443BF9E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4e9a3795-f1c3-4c00-da62-08da3940660e
x-ms-traffictypediagnostic:
	DB9PR08MB6796:EE_|DBAEUR03FT041:EE_|AM0PR08MB3331:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3331F22C2468C1CEF5C3D2BE9ED09@AM0PR08MB3331.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vLfCDhFEnhQeDrH0sqDO/a1w9Oi1UAOJ7BnfxzveLw+Qo+I41NdoIbhddsxw2QMBl/tF1YLSdZuu77hEBbAhI6Q7oReY8/oE5UuoWVQOSzSmvWhlo5EHn2C5dcCyHQJmtEfpahxwmo/pv2NrKMxHLw0xHGek20NMDstYeVOo29NbP7+yi90JqSflzVp5Kg92dEibEFDQ+ctEw3dBFYH8ezwIDwVMBocARShqHwLABkgQ1aCXhkci1/QFzpgDq/sKc8zcjeh/DvFDJJZRSsqFEpt0QgsLD52TobCKoclF5fbHI/ciWy52BU4QpbqX9KMoAOGG1fQmn/N5PknEIBLz799QRmoeQ+MFthiLrs41frGyzOp4n+BGBlsUIXmA3M4ny/hmvAe6sXj5/1qqMKs1GU2GHuRPtfk3RCe9/R0lgE7VJfciQF2pkOQAXxzJ6+o08E/EMhFBaxlnRggyMMhIb9mvaOGXppKZFaZn0gu2SqIWJplN4lma48VgYM1+U0JvyVxLgrNho7e+nrQPPQQ10LLw+Zq3BPkpTWDRz8nDNBmuLd6ZIomX4ErisfUNJ5V8jfCgLqxQca9lt5+VJC2wefAKiiz0N7vtKgfToh02CRs9R8l0aKMl4Hrvx1NdjciLpYo1hYE1993gWcIK5m/ZWf0Zux6hPlRNv3RfN3z4t2iYdvGIQ3NW0LKHrRTP4vQuZ8ZgxlK5m7qdfI0rrmX55Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(38070700005)(4326008)(8676002)(38100700002)(66446008)(66946007)(122000001)(66556008)(76116006)(66476007)(316002)(33656002)(71200400001)(55016003)(508600001)(83380400001)(54906003)(110136005)(6636002)(86362001)(2906002)(8936002)(52536014)(5660300002)(9686003)(26005)(6506007)(53546011)(186003)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6796
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2208f7c1-77af-4ff1-4e35-08da394060c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qwEcmIlH5r+vJjY5x5xHD/GPMOYyh8tLZEQJNSq6Ewp6bi/QHioyVo6n2JQam7vj+vnMPKf3UTeggWQnOy9KrkydGh2LRpyTQoORxBbixkxDbj3AekNqm/ftUX2uOiW+l9WgXSGuLVMLQ0UBS8M68IW/p0S4r+3m1UueSwtBvIZVM/gcFZsHt7qaiQqjfIY2X/hs9pgSNUcUH044pAQsMAKXaiuni26gPEsutLIlFYNMuvpRlRp0roR7+1oBaWBhsIGAw8mD32rIkLv5UkS/0Rnaa03HjExTVQG64yxgVOz7Avkkf7mv19pGy6Q8y22BrjnpAP/+I2J9OrAeWIpe1e9gkP2BEYEbY/N1Ivv9Pt00VlpZpMNPU/yqH7LHcfqgi03hB9COcqHry5cepXzOV6R+vhkWl7CDp7t2L03ah/BYP72tJFZ3ASKnzWRdRBy79n88K1p8sLnZfUyvrOaoS8BgrRsuqqOm8cL7B697z5oGFe23LbZ1hqIhyD7a0f5PYCSXxa+ycD5hMHWEoyTgT/3MR4wmOUMTcWzI/bZX9RqLJrTTFcuszunLvSKjW69W3gYNDUQfyhKXaQPdrmqqvWlThIMRt2aLU/ENK+89iNGLu0u/YjCG+ZJCp0Cfp06A3qVsTClBVDRoihkxA9BhZzDrH/ij/KVkPAR8e3bJr//qGY989VDBxnzAiXxMi5j1
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(336012)(47076005)(186003)(86362001)(36860700001)(83380400001)(356005)(8676002)(4326008)(81166007)(8936002)(54906003)(110136005)(82310400005)(70586007)(6636002)(70206006)(2906002)(55016003)(53546011)(508600001)(316002)(5660300002)(33656002)(26005)(9686003)(40460700003)(6506007)(7696005)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 02:36:37.9129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9a3795-f1c3-4c00-da62-08da3940660e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3331

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDXmnIgxOOaXpSAyMTowNQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbg0KPiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3Jn
PjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvOV0geGVuOiByZXVzZSB4
ODYgRUZJIHN0dWIgZnVuY3Rpb25zIGZvciBBcm0NCj4gDQo+IE9uIDExLjA1LjIwMjIgMDM6NDYs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+IHg4NiBpcyB1c2luZyBjb21waWxlciBmZWF0dXJlIHRlc3Rp
bmcgdG8gZGVjaWRlIEVGSSBidWlsZA0KPiA+IGVuYWJsZSBvciBub3QuIFdoZW4gRUZJIGJ1aWxk
IGlzIGRpc2FibGVkLCB4ODYgd2lsbCB1c2UgYW4NCj4gPiBlZmkvc3R1Yi5jIGZpbGUgdG8gcmVw
bGFjZSBlZmkvcnVudGltZS5jIGZvciBidWlsZCBvYmplY3RzLg0KPiA+IEZvbGxvd2luZyB0aGlz
IGlkZWEsIHdlIGludHJvZHVjZSBhIHN0dWIgZmlsZSBmb3IgQXJtLCBidXQNCj4gPiB1c2UgQ09O
RklHX0FSTV9FRkkgdG8gZGVjaWRlIEVGSSBidWlsZCBlbmFibGUgb3Igbm90Lg0KPiA+DQo+ID4g
QW5kIHRoZSBtb3N0IGZ1bmN0aW9ucyBpbiB4ODYgRUZJIHN0dWIuYyBjYW4gYmUgcmV1c2VkIGZv
cg0KPiA+IG90aGVyIGFyY2hpdGVjdHVyZXMsIGxpa2UgQXJtLiBTbyB3ZSBtb3ZlIHRoZW0gdG8g
Y29tbW9uDQo+ID4gYW5kIGtlZXAgdGhlIHg4NiBzcGVjaWZpYyBmdW5jdGlvbiBpbiB4ODYvZWZp
L3N0dWIuYy4NCj4gPg0KPiA+IFRvIGF2b2lkIHRoZSBzeW1ib2wgbGluayBjb25mbGljdCBlcnJv
ciB3aGVuIGxpbmtpbmcgY29tbW9uDQo+ID4gc3R1YiBmaWxlcyB0byB4ODYvZWZpLiBXZSBhZGQg
YSByZWd1bGFyIGZpbGUgY2hlY2sgaW4gZWZpDQo+ID4gc3R1YiBmaWxlcycgbGluayBzY3JpcHQu
IERlcGVuZHMgb24gdGhpcyBjaGVjayB3ZSBjYW4gYnlwYXNzDQo+ID4gdGhlIGxpbmsgYmVoYXZp
b3JzIGZvciBleGlzdGVkIHN0dWIgZmlsZXMgaW4geDg2L2VmaS4NCj4gPg0KPiA+IEFzIHRoZXJl
IGlzIG5vIEFybSBzcGVjaWZpYyBFRkkgc3R1YiBmdW5jdGlvbiBmb3IgQXJtIGluDQo+ID4gY3Vy
cmVudCBzdGFnZSwgQXJtIHN0aWxsIGNhbiB1c2UgdGhlIGV4aXN0ZWQgc3ltYm9sIGxpbmsNCj4g
PiBtZXRob2QgZm9yIEVGSSBzdHViIGZpbGVzLg0KPiANCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvIG1hbmRhdGUgdGhhdCBldmVyeSBhcmNoIGhhcyBpdHMgc3R1Yi5jLA0KPiBhbmQgaW4gdGhl
IEFybSBvbmUgYWxsIHlvdSdkIGRvIChmb3Igbm93KSBpcyAjaW5jbHVkZSB0aGUgY29tbW9uDQo+
IG9uZT8gKEJ1dCBzZWUgYWxzbyBiZWxvdy4pDQo+DQoNClBlcnNvbmFsbHksIEkgZG9uJ3QgbGlr
ZSB0byBpbmNsdWRlIGEgQyBmaWxlIGludG8gYW5vdGhlciBDIGZpbGUuDQpCdXQgSSBhbSBPSyBh
cyBsb25nIGFzIHRoZSBBcm0gbWFpbnRhaW5lcnMgYWdyZWUuDQpAU3RlZmFubyBTdGFiZWxsaW5p
IEBCZXJ0cmFuZCBNYXJxdWlzIEBKdWxpZW4gR3JhbGwNCg0KPiA+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9NYWtlZmlsZQ0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPiA+IEBAIC0xLDYg
KzEsNSBAQA0KPiA+ICBvYmotJChDT05GSUdfQVJNXzMyKSArPSBhcm0zMi8NCj4gPiAgb2JqLSQo
Q09ORklHX0FSTV82NCkgKz0gYXJtNjQvDQo+ID4gLW9iai0kKENPTkZJR19BUk1fNjQpICs9IGVm
aS8NCj4gPiAgb2JqLSQoQ09ORklHX0FDUEkpICs9IGFjcGkvDQo+ID4gIG9iai0kKENPTkZJR19I
QVNfUENJKSArPSBwY2kvDQo+ID4gIGlmbmVxICgkKENPTkZJR19OT19QTEFUKSx5KQ0KPiA+IEBA
IC0yMCw2ICsxOSw3IEBAIG9iai15ICs9IGRvbWFpbi5vDQo+ID4gIG9iai15ICs9IGRvbWFpbl9i
dWlsZC5pbml0Lm8NCj4gPiAgb2JqLXkgKz0gZG9tY3RsLm8NCj4gPiAgb2JqLSQoQ09ORklHX0VB
UkxZX1BSSU5USykgKz0gZWFybHlfcHJpbnRrLm8NCj4gPiArb2JqLXkgKz0gZWZpLw0KPiA+ICBv
YmoteSArPSBnaWMubw0KPiA+ICBvYmoteSArPSBnaWMtdjIubw0KPiA+ICBvYmotJChDT05GSUdf
R0lDVjMpICs9IGdpYy12My5vDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9lZmkvTWFr
ZWZpbGUgYi94ZW4vYXJjaC9hcm0vZWZpL01ha2VmaWxlDQo+ID4gaW5kZXggNDMxM2MzOTA2Ni4u
ZGZmZTcyZTU4OSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZWZpL01ha2VmaWxlDQo+
ID4gKysrIGIveGVuL2FyY2gvYXJtL2VmaS9NYWtlZmlsZQ0KPiA+IEBAIC0xLDQgKzEsMTIgQEAN
Cj4gPiAgaW5jbHVkZSAkKHNyY3RyZWUpL2NvbW1vbi9lZmkvZWZpLWNvbW1vbi5taw0KPiA+DQo+
ID4gK2lmZXEgKCQoQ09ORklHX0FSTV9FRkkpLHkpDQo+ID4gIG9iai15ICs9ICQoRUZJT0JKLXkp
DQo+ID4gIG9iai0kKENPTkZJR19BQ1BJKSArPSAgZWZpLWRvbTAuaW5pdC5vDQo+ID4gK2Vsc2UN
Cj4gPiArIyBBZGQgc3R1Yi5vIHRvIEVGSU9CSi15IHRvIHJlLXVzZSB0aGUgY2xlYW4tZmlsZXMg
aW4NCj4gPiArIyBlZmktY29tbW9uLm1rLiBPdGhlcndpc2UgdGhlIGxpbmsgb2Ygc3R1Yi5jIGlu
IGFybS9lZmkNCj4gPiArIyB3aWxsIG5vdCBiZSBjbGVhbmVkIGluICJtYWtlIGNsZWFuIi4NCj4g
PiArRUZJT0JKLXkgKz0gc3R1Yi5vDQo+ID4gK29iai15ICs9IHN0dWIubw0KPiA+ICtlbmRpZg0K
PiANCj4gSSByZWFsaXplIFN0ZWZhbm8gaW5kaWNhdGVkIGhlJ3MgaGFwcHkgd2l0aCB0aGUgQXJt
IHNpZGUsIGJ1dCBJIHN0aWxsDQo+IHdvbmRlcjogV2hhdCB1c2UgaXMgdGhlIHN0dWIgb24gQXJt
MzI/IEV2ZW4gZnVydGhlciAtIG9uY2UgeW91IGhhdmUgYQ0KPiBjb25maWcgb3B0aW9uIChyYXRo
ZXIgdGhhbiB4ODYnZXMgYnVpbGQtdGltZSBjaGVjayBwbHVzIHg4NidlcyBkdWFsLQ0KPiBwdXJw
b3Npbmcgb2YgYWxsIG9iamVjdCBmaWxlcyksIHdoeSBkbyB5b3UgbmVlZCBhIHN0dWIgaW4gdGhl
IGZpcnN0DQo+IHBsYWNlPyBZb3Ugb3VnaHQgdG8gYmUgYWJsZSB0byBkZWFsIHdpdGggdGhpbmdz
IHZpYSBpbmxpbmUgZnVuY3Rpb25zDQo+IGFuZCBtYWNyb3MsIEkgd291bGQgdGhpbmsuDQo+IA0K
DQpXZSB3aWxsIHVzZSBlZmlfZW5hYmxlZCgpIG9uIHNvbWUgY29tbW9uIGNvZGVzIG9mIEFybS4g
SW4gdGhlIGxhc3QNCnZlcnNpb24sIEkgaGFkIHVzZWQgc3RhdGljIGlubGluZSBmdW5jdGlvbiwg
YnV0IHRoYXQgd2lsbCBuZWVkIGFuDQpDT05GSUdfRUZJIGluIHhlbi9lZmkuaCB0byBnYXRlIHRo
ZSBkZWZpbml0aW9ucyBvZiBFRkkgZnVuY3Rpb25zLA0Kb3RoZXJ3aXNlIHdlIGp1c3QgY2FuIGlt
cGxlbWVudCB0aGUgZWZpX2VuYWJsZWQgaW4gbm9uLXN0YXRpYy1pbmxpbmUNCndheS4gT3IgdXNl
IGFub3RoZXIgbmFtZSB0byB3cmFwcGVyIGVmaV9lbmFibGVkLiAocGF0Y2gjMjAsIDIxKQ0KQnV0
IGFzIHg4NiBoYXMgaXRzIG93biB3YXkgdG8gZGVjaWRlIEVGSSBidWlsZCBvciBub3QsIHRoZSBD
T05GSUdfRUZJDQpoYXMgYmVlbiByZWplY3RlZC4gSW4gdGhpcyBjYXNlLCB3ZSB1c2UgQ09ORklH
X0FSTV9FRkkgZm9yIEFybSBpdHNlbGYuDQoNCkZvciBDT05GSUdfQVJNX0VGSSwgaXQncyBpbXBv
c3NpYmxlIHRvIGJlIHVzZWQgaW4geGVuL2VmaS5oIHRvIGdhdGUNCmRlZmluaXRpb25zLiBTbyBp
ZiBJIHdhbnQgdG8gdXNlIG1hY3JvcyBvciBzdGF0aWMtaW5saW5lIGZ1bmN0aW9ucywNCkkgbmVl
ZCB0byB1c2UgI2lmZGVmIENPTkZJR19BUk1fRUZJIGluIGV2ZXJ5d2hlcmUgdG8gZ2F0ZSB4ZW4v
ZWZpLmguDQpPciB1c2UgYW5vdGhlciBoZWFkZXIgZmlsZSB0byB3YXJwcGVyIHhlbi9lZmkuaC4N
Cg0KPiA+IC0tLSBhL3hlbi9jb21tb24vZWZpL2VmaS1jb21tb24ubWsNCj4gPiArKysgYi94ZW4v
Y29tbW9uL2VmaS9lZmktY29tbW9uLm1rDQo+ID4gQEAgLTksNyArOSw4IEBAIENGTEFHUy15ICs9
IC1pcXVvdGUgJChzcmNkaXIpDQo+ID4gICMgZS5nLjogSXQgdHJhbnNmb3JtcyAiZGlyL2Zvby9i
YXIiIGludG8gc3VjY2Vzc2l2ZWx5DQo+ID4gICMgICAgICAgImRpciBmb28gYmFyIiwgIi4uIC4u
IC4uIiwgIi4uLy4uLy4uIg0KPiA+ICAkKG9iaikvJS5jOiAkKHNyY3RyZWUpL2NvbW1vbi9lZmkv
JS5jIEZPUkNFDQo+ID4gLQkkKFEpbG4gLW5mcyAkKHN1YnN0ICQoc3BhY2UpLC8sJChwYXRzdWJz
dCAlLC4uLCQoc3Vic3QNCj4gLywgLCQob2JqKSkpKS9zb3VyY2UvY29tbW9uL2VmaS8kKDxGKSAk
QA0KPiA+ICsJJChRKXRlc3QgLWYgJEAgfHwgXA0KPiA+ICsJbG4gLW5mcyAkKHN1YnN0ICQoc3Bh
Y2UpLC8sJChwYXRzdWJzdCAlLC4uLCQoc3Vic3QNCj4gLywgLCQob2JqKSkpKS9zb3VyY2UvY29t
bW9uL2VmaS8kKDxGKSAkQA0KPiANCj4gUGxlYXNlIGNhbiB5b3UgaW5kZW50IHRoZSAibG4iIHRv
IG1hdGNoICJ0ZXN0Iiwgc3VjaCB0aGF0IGl0J3MgZWFzaWx5DQo+IHZpc2libGUgKHdpdGhvdXQg
cGF5aW5nIGF0dGVudGlvbiB0byBsaW5lIGNvbnRpbnVhdGlvbiBjaGFyYWN0ZXJzKQ0KPiB0aGF0
IHRoZXNlIHR3byBsaW5lcyBhcmUgYSBzaW5nbGUgY29tbWFuZD8NCj4gDQoNClllYWgsIG9mIGNv
dXJzZSwgSSB3aWxsIGRvIGl0Lg0KDQo+IEphbg0KDQo=

