Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AB3F2496
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 04:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169164.309020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGtvE-00030l-Ei; Fri, 20 Aug 2021 02:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169164.309020; Fri, 20 Aug 2021 02:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGtvE-0002yw-9J; Fri, 20 Aug 2021 02:06:16 +0000
Received: by outflank-mailman (input) for mailman id 169164;
 Fri, 20 Aug 2021 02:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mGtvC-0002yo-TB
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 02:06:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.59]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31d4d8ea-015b-11ec-a677-12813bfff9fa;
 Fri, 20 Aug 2021 02:06:13 +0000 (UTC)
Received: from DB9PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:10:1d9::33)
 by DB8PR08MB4154.eurprd08.prod.outlook.com (2603:10a6:10:b1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 02:06:11 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::21) by DB9PR02CA0028.outlook.office365.com
 (2603:10a6:10:1d9::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 02:06:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 02:06:11 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Fri, 20 Aug 2021 02:06:11 +0000
Received: from 9e82f807077f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F121F9B-7824-43BA-831E-6CFA9DA9577A.1; 
 Fri, 20 Aug 2021 02:06:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e82f807077f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 02:06:01 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6266.eurprd08.prod.outlook.com (2603:10a6:10:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 02:05:59 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 02:05:59 +0000
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
X-Inumbo-ID: 31d4d8ea-015b-11ec-a677-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqvv9mYwVRX86wxil2CdVbXYFbhpnNUpFZvMwRQ/ReE=;
 b=OOL8U09/KXWXUNU25iSExa6j3GrZxNALyfut65Q4sLBprOe2egIH0p1uVdv4CHctYeDmcXQfwaZvKQ0dK4KXW5p7fRNsPCZlPUIf+jdOU2X8l0v7oilj+f6Ysli6rjvGAXhSs7xF8Z1li2lnz9fqvaObedNED6Nv917HG4VDyrs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n72BQbG9XzA9bgpGS3+JV20+ND303DSP/sN8IXq3hQOtliGNOvjWs9Win72QRZ5armq97lvjPUr4u2SScIQedqngiDEuiBb6DGB9fMPCplpaiiKERMQUIR3gDvS+l53JLWjTcm+ZZnLeJEheQeX9mnPFmaMtuJ7WwzZ30rKrwlgi8KL8C30RwWJ9/Cnj+2b23AGeyewdFN0dVZ4s70jJsMqagjMJoUdU8BDY20s8TBHxlJ3IskeS8v3yXs2QULYAc/ASSCveXb+IRgK1h3b/9nQBXjJ6Wqxnp+P8fc/1vxIl8qFeg1eXq4beD9IdPl7xSb/8b9ffMHGm+dTwfm9rLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqvv9mYwVRX86wxil2CdVbXYFbhpnNUpFZvMwRQ/ReE=;
 b=V1O0QDKKj4WcjNSnQtimvBuwFzJX+lolCE/QgP2nMlYL/VPbHR3jC+WFDnHjY1eouZ6qOVD6lCfym6SU2WIecY4US8wgMxIO/mXeM3sRr/c8HEhJBhyrehoBMrQESBTgifvMKFSv90pltp3NZ8U/4phZ7gra6T00oZCSkUV30xi4eKsvn+QxUY4nQ4bhTNm9ay1tzr/1+M+rlhe4K9/JxIrae71ab2zI+kXS93dmskBVUyQhhxhruWwSMVbG63PJNL8y3Q4YofRscK2T37a3NT0yB2OrZVemn7175xuvmIGVyoFkzSvJlWQCJMDtdJU/NmJiUEOyQEjkbc4NbZdG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqvv9mYwVRX86wxil2CdVbXYFbhpnNUpFZvMwRQ/ReE=;
 b=OOL8U09/KXWXUNU25iSExa6j3GrZxNALyfut65Q4sLBprOe2egIH0p1uVdv4CHctYeDmcXQfwaZvKQ0dK4KXW5p7fRNsPCZlPUIf+jdOU2X8l0v7oilj+f6Ysli6rjvGAXhSs7xF8Z1li2lnz9fqvaObedNED6Nv917HG4VDyrs=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 05/40] xen/arm: Fix lowmem_bitsize when
 arch_get_dma_bitsize return 0
Thread-Topic: [XEN RFC PATCH 05/40] xen/arm: Fix lowmem_bitsize when
 arch_get_dma_bitsize return 0
Thread-Index: AQHXjpsg83Zycdnz1UG/A4jl+o2Uqat63/yAgADSY6A=
Date: Fri, 20 Aug 2021 02:05:59 +0000
Message-ID:
 <DB9PR08MB68570FDDBDEAE38E0301744F9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-6-wei.chen@arm.com>
 <ce78f938-3fda-f7a9-f92b-4a692774b497@xen.org>
In-Reply-To: <ce78f938-3fda-f7a9-f92b-4a692774b497@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A078830C2112A64C8BDA8B70F2C0637E.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 746929f5-f12a-493a-b703-08d9637f153a
x-ms-traffictypediagnostic: DBBPR08MB6266:|DB8PR08MB4154:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4154218F2B2A755A8BE67E119EC19@DB8PR08MB4154.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hVNe3ytCYBxIBFf5A8RuHZeec3KFmTniCGrv8PmnYl1qYG1JikVSna8yRNPFE21b5tw13zX0UKDUGacLb672YWPWjbnSTiTwRRJo3tjS4RGclxFYlVno/4QkuRfsrWAHjXDiKfyh/H66cmOtkLfk/GPbvk/5hFWdx7/6LNVjdbOeLfihZjeD14fpkWRQbNC/tJ/1jnvWW7DUa6cRUe/eYMoyd9Xhs8Jdv5xqp6+zluXX+WbqL3XBp0yUfbOlZIddqmVrSmgDMlFmycmBVIUOGDVVRf9REbAHZbOgw16mqxcHZR9lvc7l8k1wNAgTZTMMz0sIRzDp6fX0mJ15Nk7DPkHuaOGuZ/PjK9ZQzQsZ/0RJ9PCKThy1fwUDVoDvP1jK3n2OVAMIe8gjFgMbpeXvBSczTpwV/QpdlfzAW0aT3QZOE4jXkvF0xVf3CaHdlwtv88oojXuawapOp9gpAIDXya8LqyoYkFSMwlXWB0tUqvQWW8ac8pbMfuW+MNLRaODvdvPyKgD0l8ADQepjrrERm+RRo/b+Mw3LZs/ajcjde0a4dYf6ROgFcHDQvQ8kDsbXxCyav1mAA3IP2Wo9izPiYKh1pTKopQ3XZOxDLzgFUvPiQFFWYqFfiiJQ1cwYx8PW4CAW5DJv1d6Mqas2sZ+x+468w2xwUVT3GD+bzo9NI7KWPJD/pLL1AiatVwvuS4ZgMNZLQabFmBehVyqbXvnqxg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(64756008)(53546011)(110136005)(86362001)(76116006)(66476007)(186003)(478600001)(52536014)(4326008)(66446008)(8936002)(71200400001)(55016002)(66946007)(316002)(5660300002)(38070700005)(38100700002)(83380400001)(66556008)(33656002)(7696005)(122000001)(6506007)(9686003)(26005)(8676002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFJzaUwwM0ZkcHpaK3FuOTE0UGx2RGxNaG5xRUZhV3Q5OXI0ZVNZK0tIa01t?=
 =?utf-8?B?WGN5OVBVRVl3dlRabVk2SlorOWI4V0ZmQjFqSWZLakpZdEkrV1BsVzduSFFq?=
 =?utf-8?B?eGdPaVh4TUNPeDJQdkRKUVhTSk5ROUh3cVRSRGZaK0EyNW9BY0dscDVRZkc1?=
 =?utf-8?B?bGZsUDdkTzRVcFpDaEJVYm9tUzVRTnZaRUlwYlorSXV6VDVtd1hacUZ5NEpU?=
 =?utf-8?B?ZGtpcjZ0bHYyNW1kTkwwd0IxOGc5Z0RRU0s2ZW9ZVGRvRUo0SHVmSVVIRUFB?=
 =?utf-8?B?aWpBWDFIU2I5VlcyeTZsaURSTjlRUUc2c0wwcHAwamY3SjhpUXQwU0RZV1dH?=
 =?utf-8?B?UEc1UE9WWEdqZXVWVGNBd1dlekpPbi91dDJlalVoYVpFWlAralJTUGVRanNV?=
 =?utf-8?B?OGxYU2orcGlKWXJTNG9KZFFKUk5xR1I3THgxNnZvdnlTTy9jOGRseHBaSW5F?=
 =?utf-8?B?djU5WFl3RnFtRzRpNEdNSG9ab2Z6V3BQenliMTFBcWNZSm4rNFNQaDVxQkZI?=
 =?utf-8?B?WWpXTHpldW1jajJ1NmxjQVFKOUhaVGRLUmk3VDl4cWxqMVIxa3JpdWxENXJl?=
 =?utf-8?B?T2xvTEpYUFZTaDZOQ2ttTDZYMnFkR0g3WHhvdDF4cVZDc1VwdVhqS0c1L0w2?=
 =?utf-8?B?bGpnZmRMRHFBcEVqa25QblpLcUVRMWFvUThFNG1vRUU1MnRoV3NqdDRmK2Nx?=
 =?utf-8?B?ZlZiemE3bzRqaVY5MWw0V284TDhGZWwrNCtFUGxiSGJqSy8yTWdmWFJKTVBF?=
 =?utf-8?B?SWxsWVFmaFRocThOV3VjempqcDVKNWZNTmpqMVdsdWdwLzQreEVqWFBDKzVz?=
 =?utf-8?B?UWczc0NnNWc2K3A2MDE3UzlrczBGblY4a2tmSEdEK1ROdUk1NDZ6UEFaSGVQ?=
 =?utf-8?B?bWtFZTNTTVhka1V6alhPd1FaY3luQktISmRuWjFwNThVMFBtTmhkY0dBTnk5?=
 =?utf-8?B?YVF5NmtLN3ExekplUjNFbFAwSlA4L3gzdElJUmliMGp0c1VPcmdGQTRVVWVV?=
 =?utf-8?B?OWRXTVRwekxPY2NVQ0F6TEg1d3EyWHU1L2xoWVdCMSsrSFhOY0ttQkZNZXlN?=
 =?utf-8?B?SWVBbVEyOW1FZ1NadFIrSnptWVpJN3ZScEhYNlFmekhXWk9kRkczaGgwUUF1?=
 =?utf-8?B?RkJGS3dLY0dTYlpZTGlSVWNOc3dzbUE1Y0NnMTFUb0hMZjFRcFd2eEtPRklH?=
 =?utf-8?B?THVlcWhGS2ptSC9JRFFYZ2xpanRMdGdwQ28ra0pjbmpBOXpVcWZIL1diL0lS?=
 =?utf-8?B?OGdwMXJydzNhZG5Yckl4c1VVRkxva2l5Nm1mVFhjZTZBcUNzVjRLbWZ0d0tT?=
 =?utf-8?B?M1V1TVZwRXFxUVRMb05oTHM3S0lSVlR4M2FVT2I0NGNTUHNQVm1IcjZyakxO?=
 =?utf-8?B?dUVYVlg5QnZQQVNPQ0YrK2VBOFZuMUdNMzZOOFJQMXUwTElPb2svYmRZSjhN?=
 =?utf-8?B?T1hXNjVEOEY1ZE9iQ2ZmNEJBS2tyTk5SUnlLYzVMT2ViM1lLWEk3ZHlzYW1n?=
 =?utf-8?B?Nkxjcnl1VVZQZmgzLzFFa0JHVmZXNGg2eE14elNFbXgzeHZBL3RlY3J2QkM3?=
 =?utf-8?B?MCswdDEyQ21Od1J0WkVHUzVxdVBFd3ZwQXorWVJzTndIbXhqRUNrNjVhNElM?=
 =?utf-8?B?MmVIdHR3WUc3MGxJTThadGhZdHZHTnVBSTdaZzhocHZRcXN0R1RRaHgyREE1?=
 =?utf-8?B?THExbStXYW0vQ2QrNFUyU1hTc2F6Zjlxb1FCZkJabWY4RDJ6Q3AzYmZlQ0Jj?=
 =?utf-8?Q?Rx/VTgNnNsjPo/XJrHbzmscafzw9YYpaLbacZEh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6266
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a73c9d9d-7e5a-4565-65a1-08d9637f0dbf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NgknQEr1TWpYBVslXEmjvkC7BHpElPsv+mTd7UYxleHGHp+DN5KqeCmDxv4mOKIyHFJTbbveXV+m8ijIF/LPnrIvxUH+yGA9ccgefYtW86bxMqqzOSuyJliWjnLhjE7Pics51TDPQaA/dZ+MzfHOkfBA9ptJt9xXFTC6WPPYpoocPbHWrNRLiiSD0CuvBbkHzltTj0MpvuuT4mgK+0sOYnfAq0DQFp7iTkRQ/Z0IM1BcrlmP2IGn6IG9/tYZ7Uqd/mY+J0I/ISlkm6ehR3sy/l682fOtrL8IjcwF4VYIuFqG9dItZRYbrvGz6q5mCml/snnaSVtqMrC5D10yuLid5aPgkqR2yccY+2kyPRDD7oNpygPU33SzjEikzpyzE1n6gWzvYwUIfCvUiZqT5he0LTemAm7Wc8KexGGi11h8/9AUTFkggP7zcDN/0vtOMzd6HEU8Ci3C5FMdoj31ihMnMKoU7yL67R7gTSozwnW/h3LGkZrdQeDZ79q+EnYisiSyFOVNEmvGyj+HNFO/7PUQv9tX4eCotdmsAo8TU2fzFPLMhBTGXRTfCQoSc7bw/0cCy+WMNtDQJEdPqO8xlJq7QGVhFJ/JJKrOeUZLb4UP+hcpAWSkIoTjbp/rb3v0JXL40XdPmQ5fbA1zQ7jYCc9uP9ft9Ik32z18m7juCgIho3rS1CLoMXT6kP8p9Foe4F5gOvvrLLtF+mXwxuFImwmo6w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(55016002)(53546011)(83380400001)(52536014)(81166007)(6506007)(5660300002)(110136005)(70586007)(70206006)(9686003)(186003)(7696005)(508600001)(356005)(8936002)(8676002)(336012)(33656002)(36860700001)(86362001)(82310400003)(2906002)(47076005)(26005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 02:06:11.7721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746929f5-f12a-493a-b703-08d9637f153a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4154

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMTnml6UgMjE6MzIN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDUvNDBdIHhlbi9hcm06IEZpeCBsb3dtZW1fYml0c2l6
ZSB3aGVuDQo+IGFyY2hfZ2V0X2RtYV9iaXRzaXplIHJldHVybiAwDQo+IA0KPiBIaSwNCj4gDQo+
IEkgZ3Vlc3MgdGhpcyBwYXRjaCBtYXkgYmUgZHJvcHBlZCBhZnRlciBteSBjb21tZW50IG9uIHBh
dGNoICM0LiBJIHdpbGwNCj4gY29tbWVudCBqdXN0IG9uIHRoZSBwcm9jZXNzLg0KPiANCg0KT2sN
Cg0KPiBPbiAxMS8wOC8yMDIxIDExOjIzLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBGcm9tOiBIb25n
ZGEgRGVuZyA8SG9uZ2RhLkRlbmdAYXJtLmNvbT4NCj4gPg0KPiA+IEluIHByZXZpb3VzIHBhdGNo
LCB3ZSBtYWtlIGFyY2hfZ2V0X2RtYV9iaXRzaXplIHJldHVybiAwIHdoZW4NCj4gPiBkbWFfYml0
c2l6ZSBhbmQgcGxhdGZvcm0tPmRtYV9iaXRzaXplIGFyZSBub3Qgc2V0LiBCdXQgdGhpcw0KPiA+
IHdpbGwgYWZmZWN0IGxvd21lbV9iaXRzaXplIGluIGFsbG9jYXRlX21lbW9yeV8xMSBmb3IgZG9t
YWluMC4NCj4gPiBCZWNhdXNlIHRoaXMgZnVuY3Rpb24gZGVwZW5kcyBsb3dtZW1fYml0c2l6ZSB0
byBhbGxvY2F0ZSBtZW1vcnkNCj4gPiBiZWxvdyA0R0IuDQo+ID4NCj4gPiBJbiBjdXJyZW50IGNv
ZGUsIHdoZW4gYXJjaF9nZXRfZG1hX2JpdHNpemUgcmV0dXJuIDAsIGxvd21lbV9iaXRzaXplDQo+
ID4gd2lsbCBiZSBzZXQgdG8gMC4gSW4gdGhpcyBjYXNlLCB3ZSB3aWxsIGdldCAiTm8gYmFuayBo
YXMgYmVlbg0KPiA+IGFsbG9jYXRlZCBiZWxvdyAwLWJpdC4iIG1lc3NhZ2Ugd2hpbGUgYWxsb2Nh
dGluZyBkb21haW4wIG1lbW9yeS4NCj4gPiBBbmQgdGhlIGxvd21lbSB3aWxsIGJlIHNldCB0byBm
YWxzZS4NCj4gPg0KPiA+IFRoaXMgYmVoYXZpb3IgaXMgaW5jb25zaXN0ZW50IHdpdGggd2hhdCBh
bGxvY2F0ZV9tZW1vcnlfMTEgZG9uZQ0KPiA+IGJlZm9yZSwgYW5kIGRvZXNuJ3QgbWVldCB0aGlz
IGZ1bmN0aW9ucyByZXF1aXJlbWVudHMuIFNvIHdlDQo+ID4gY2hlY2sgYXJjaF9nZXRfZG1hX2Jp
dHNpemUncyByZXR1cm4gdmFsdWUgYmVmb3JlIHNldCBsb3dtZW1fYml0c2l6ZS4NCj4gPiBBdm9p
ZCBzZXR0aW5nIGxvd21lbV9iaXRzaXplIHRvIDAgYnkgbWlzdGFrZS4NCj4gDQo+IEluIGdlbmVy
YWwsIHdlIHdhbnQgdG8gYXZvaWQgYnJlYWtpbmcgYmlzZWN0aW9uIHdpdGhpbiBhIHNlcmllcy4g
VGhpcw0KPiBtZWFucyB0aGF0IHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGJlZm9yZSBwYXRjaCAjNC4N
Cj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIb25nZGEgRGVuZyA8SG9uZ2RhLkRlbmdAYXJtLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDExICsrKysrKysrKyst
DQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+IGluZGV4IDZjODZkNTI3ODEuLmNmMzQxZjM0OWYg
MTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gKysrIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gQEAgLTI2NSw5ICsyNjUsMTggQEAgc3Rh
dGljIHZvaWQgX19pbml0IGFsbG9jYXRlX21lbW9yeV8xMShzdHJ1Y3QgZG9tYWluDQo+ICpkLA0K
PiA+ICAgICAgIGludCBpOw0KPiA+DQo+ID4gICAgICAgYm9vbCBsb3dtZW0gPSB0cnVlOw0KPiA+
IC0gICAgdW5zaWduZWQgaW50IGxvd21lbV9iaXRzaXplID0gbWluKDMyVSwgYXJjaF9nZXRfZG1h
X2JpdHNpemUoKSk7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgbG93bWVtX2JpdHNpemUgPSBhcmNo
X2dldF9kbWFfYml0c2l6ZSgpOw0KPiA+ICAgICAgIHVuc2lnbmVkIGludCBiaXRzOw0KPiA+DQo+
ID4gKyAgICAvKg0KPiA+ICsgICAgICAgV2hlbiBkbWFfYml0c2l6ZSBhbmQgcGxhdGZvcm0tPmRt
YV9iaXRzaXplIGFyZSBub3Qgc2V0LA0KPiA+ICsgICAgICAgYXJjaF9nZXRfZG1hX2JpdHNpemUg
d2lsbCByZXR1cm4gMC4gVGhhdCBtZWFucyB0aGlzIHN5c3RlbQ0KPiA+ICsgICAgICAgZG9lc24n
dCBuZWVkIHRvIHJlc2VydmUgbWVtb3J5IGZvciBETUEuIEJ1dCBpbiBvcmRlciB0bw0KPiA+ICsg
ICAgICAgbWVldCBhYm92ZSByZXF1aXJlbWVudHMsIHdlIHN0aWxsIG5lZWQgdG8gdHJ5IHRvIGFs
bG9jYXRlDQo+ID4gKyAgICAgICBtZW1vcnkgYmVsb3cgNEdCIGZvciBEb20wLg0KPiA+ICsgICAg
Ki8NCj4gDQo+IFRoZSBjb2Rpbmcgc3R5bGUgZm9yIGNvbW1lbnRzIGlzOg0KPiANCj4gLyoNCj4g
ICAqIEENCj4gICAqIEINCj4gICAqLw0KPiANCg0KSSB3aWxsIGZpeCBpdC4NCg0KPiA+ICsgICAg
bG93bWVtX2JpdHNpemUgPSBsb3dtZW1fYml0c2l6ZSA/IG1pbigzMlUsIGxvd21lbV9iaXRzaXpl
KSA6IDMyVTsNCj4gPiArDQo+ID4gICAgICAgLyoNCj4gPiAgICAgICAgKiBUT0RPOiBJbXBsZW1l
bnQgbWVtb3J5IGJhbmsgYWxsb2NhdGlvbiB3aGVuIERPTTAgaXMgbm90IGRpcmVjdA0KPiA+ICAg
ICAgICAqIG1hcHBlZA0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3Jh
bGwNCg==

