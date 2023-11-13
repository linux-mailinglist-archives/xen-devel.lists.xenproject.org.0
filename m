Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9ED7E9ECB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 15:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631620.985162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Xzm-00028h-0Y; Mon, 13 Nov 2023 14:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631620.985162; Mon, 13 Nov 2023 14:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Xzl-00026j-Tx; Mon, 13 Nov 2023 14:32:57 +0000
Received: by outflank-mailman (input) for mailman id 631620;
 Mon, 13 Nov 2023 14:32:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUjx=G2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r2Xzj-00026d-Nc
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 14:32:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 877009ad-8231-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 15:32:53 +0100 (CET)
Received: from AM6P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::42)
 by AS4PR08MB7655.eurprd08.prod.outlook.com (2603:10a6:20b:4f1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 14:32:50 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:209:83:cafe::51) by AM6P192CA0029.outlook.office365.com
 (2603:10a6:209:83::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.26 via Frontend
 Transport; Mon, 13 Nov 2023 14:32:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 14:32:50 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Mon, 13 Nov 2023 14:32:50 +0000
Received: from 72ce293f0bad.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BDC9C80F-18B8-4770-8099-338783A8DAAC.1; 
 Mon, 13 Nov 2023 14:32:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72ce293f0bad.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Nov 2023 14:32:40 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by PAVPR08MB9841.eurprd08.prod.outlook.com (2603:10a6:102:31d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 14:32:37 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 14:32:37 +0000
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
X-Inumbo-ID: 877009ad-8231-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PNdyv8po6yKpQNZJ+KRVHtiRmKZeiS4AQmIpsm3Pz5DrR0JodrAadlj1xsvOgl46YAfM4MwKIOm9BOLsTlMUg+IR7oWg0YkqTIgoELNpYOGqJInrxSxkEk/jYuRK+hrnQQV/HPKUZ+wUUUJJNfxP0CdfNPeSNiSJ7qFPumZ0VkrVeMzd+ENjVoA/FL/cS3uhm7uJ+mGR3bAJACFm/ZV0VTWKHQOjlPWQf1qnlzj9xV+C3WRzV9DOjhDfwhu7U232OW0cOr61YBVp214jvDigrWaE79Ipc99rtYAwqFK4QpnTuzuDTOVvtgvozUZiWpi45Pa0qVlTwz+oohrJhQfXHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMjEqzAg1EVqIbFSpF8TUfhLyUPn2l0YoDvu5OikYYE=;
 b=AoAOZ+D0pjNA8yERXv8w3xD+QMI3V4NosxjEw3EZYFu5O56GcDYmB0wp8zHVXpy8alYWO7HXpgn2lRLnK6wZpIjjDI55irthiPJPYbzyMmv6KW1D+ABdF1MwkPnCB7WL7Zfe0gnoabxZYbQS7i0xhOPlhrZLSYaFfUoSUCjPVoQwd3LsycTaf6iOPrNTJ+BFjbbWlRW3Kq4BaRni89B6BnS7hyjud/6nYLqYnI+znnnnJ2UYvuRRRA7mBE0p92xiHd2ux4jixDHmW34v4KpCLVkL93BVvX/IGDEBDnZhAP8iyMZ7Mh0PvxFlsvQHwRilKFiHews6bUFfQfrUr3K6jw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMjEqzAg1EVqIbFSpF8TUfhLyUPn2l0YoDvu5OikYYE=;
 b=nrNNnvVE2lbyA84A8h5FjI3+Y1pycMVclscAaEeVmnFYwko7jqFXBlXQVh42uPAEsJMWUaddJULbEriE6tITAbGLKiGv5jYkMPNFnX714iROD9BfIprsmFbZHN9XaUsPF8QqitgLGDShBqhWMWUCT7OH5iII6Lq1xc/4XLnyYio=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9e33ed75a087194
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdB+54ODJoX9v5S3FNIrlqIUqMUzhzNzeZjvcLg5MQGKXvBz2a6aQsm25pZxEWu/Lyoyp1HRqC3YRRCEM9uGtfuK7UQ02MI9mc85GL9sVX572NWbFCEYvejhFo/RMvucceqBiILKBvmCTb/5f96hfC1ulaLifB829nPOT1VpS1bygfZuv1TqfmOpbvXKIQC7GRHexEKNHSQN/jTvDVQS8M+5h2oqA+KiBTvQH803TsvgclQZNoxK/Ru15tlRIh3gCgnTvH2SBmuupKVswPv4aKrPAcX3qaGVttYoevk2UmaASlaCdT179Ba8N2v/Vr9HsTCiUMcP41PyQm9rIVkUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMjEqzAg1EVqIbFSpF8TUfhLyUPn2l0YoDvu5OikYYE=;
 b=GKIGwe59w/4B4ZnpnMCp6hjIAA1mIx61mAhIWyTMnpCf3D4OoxCErkbZNPrhGRgaPxBkx7U1XLtwThuJg9WFVGKWPXGpIEAc/2KMYnhZDFO9MK/Mb75mQWMJBkNipKVxz3khPONDrXU8yHC5TBkidbnEh3qigCLuMjJvZDgs0w7rKqcsRudZgk/X4itHALWeWXFWK90zohaEPoQ6Az6bCKFsg3CCBM9wjHXuUg35Wys51lXy0x1mTLYXKJf4XDl4pAiVyoX2ioYMLSg9Wpd0fpEVOte4DDzqXV2kgYrAatHOL2r6bGy675gzrZ5cVQdAVhT1eXPvCdcVhcGzaBl3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMjEqzAg1EVqIbFSpF8TUfhLyUPn2l0YoDvu5OikYYE=;
 b=nrNNnvVE2lbyA84A8h5FjI3+Y1pycMVclscAaEeVmnFYwko7jqFXBlXQVh42uPAEsJMWUaddJULbEriE6tITAbGLKiGv5jYkMPNFnX714iROD9BfIprsmFbZHN9XaUsPF8QqitgLGDShBqhWMWUCT7OH5iII6Lq1xc/4XLnyYio=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHaEuwcMi2uzYg9sUaekJ4uQMuKYLBx1QmAgAY1GYCAAB47gIAALj2A
Date: Mon, 13 Nov 2023 14:32:37 +0000
Message-ID: <FA1360BA-2909-42E1-B066-1650C280F585@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-4-luca.fancellu@arm.com>
 <bec276f9-ea9d-4c9f-887c-358a3f7815fd@amd.com>
 <7C92A577-716B-4D48-B685-3EA0C93AAF5C@arm.com>
 <998BB5A5-515C-4656-BD94-9ACC461235E8@arm.com>
In-Reply-To: <998BB5A5-515C-4656-BD94-9ACC461235E8@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|PAVPR08MB9841:EE_|AM1PEPF000252DF:EE_|AS4PR08MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c73171d-c81d-4b68-79b9-08dbe4556a2e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IoVSHpCV5iaDPJXgzuXlUi1C454ZMPbt0bZuFop6Ij77YNcAk3SgwAluNx1ZNN4M+/5ZS3CRzHKkNw1aNfBXPJ+oXQkhpF1lydzjUmkAaGJZn9AARDmh0G/hRYnXBUnfo2F/sfrJDN5iwABlviGSO3sYFUOCclXfcyvY+tuVrxyxVK2pGA0QIvu3sdl/Drls9u4kjLDczbA5cOJt/o3o+O742KAdSCe6lWYdQczi9zLI/bmQfwUL5FeugvXj329XIVDOH9+PRDf8XhjcAd6ZEPUEUHkZkaESd3heoVQr7p3DWGQ5Oz5zeFUV6VjFZIr/M0NPl2omBuPe1N1gD+UkTXVyvhz/wkO5HVs/xMSIYb6ZhpUNAfFiafcGz4vpjv2zK1pLkVAxqhTNjnQrIGqZoEqX7bNcZQctP9jAzH45+rs0ZYXvDUcwkal1j8ZQN99SDYOqQbE4SsngKMjzPpvCqA0XIw2pPd0IpBFVVBvqESNW6Cwra1N/lrJa2gwhJ+vcV2Wdmd13ovNN/7CEeR7bE16QaF2jgr5C2Drhg7A0IRFjsQ04kJnXgCn91DHOa7UYsAbBmnX3tRpqurFU3NOLZBznrG+7QIHmrpM2Nh8xre0RY0lBzcpkmuHN6d6AOarReQhTTATTWO0/3liP3/BoVsxzFs60EeqhefQhcyRt9t0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(71200400001)(6506007)(2616005)(6512007)(4326008)(5660300002)(8936002)(8676002)(6862004)(4744005)(2906002)(41300700001)(6486002)(478600001)(6636002)(316002)(91956017)(37006003)(66946007)(64756008)(66446008)(66476007)(66556008)(54906003)(76116006)(122000001)(36756003)(33656002)(86362001)(38100700002)(38070700009)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <24660566D195E44D8B4217115C30EBD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9841
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ee01e64-5f77-4240-6e9e-08dbe455626b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wv58BZwMvUZwU3JohJzlJkItgksY4sdoLVTEVJtOIBb2rUKLx9wMfhJjnNz2sD1lJt7Oy6d78UAEXwqxtF5XFIjsYGArO1JHyIuUqaulGDCycTD7LoTEstqDSJqVxQBZK3aKjoy89OF/CO2piVJJgyFKyjXfW2VcaflGpalGLVzzkeWxIL6XW2IFqkt2L/KHGogbRfA+NOFaw2OexcoLIMiv+J4bo4eLQJ8Iq2lQoKfCdbQjysVpvTXl7hFBW9/cr7QAx7NHhuPR+PjRxkHMOr3tr/UO45v7HphR4ruEree1gr4M8NrKWXZTXgX3sC6+y6UQEap+WmdDANNycJRbVduSygBZS2nkF35hxFNpOFujZ33Czbk/JIkXO6SN2mo6LTkNUfaJdoZRU8hVmoq5fx5iHhBMI5YOlame/1mYX4PugxAopiIvJ4KGlJMmxH7QtQ0ZfnTlRzIrgtwcx3ZIRZGieBQWPuz74goPeYFgEQoA1oyDsLlcsh7HNudqnj0Fupwfxo1Zh4MyUc4/oUr30wbHv1BcLKPAXdHXzbUGKWwG+pl2ym2Zfkk7BwnL9kG4YhkmElEtDmL5daLQwNWVry1xStuYWFOGZYKbOz+HlH02Jlq8Yp0LeEFJ3v3BC8K5SO/eF1I6UXD76dfOg2axFS7o0p4Tb3JyeARylumDgMCrBj5Q9ph26a3XqMIUMHq7VywCKBbiuAZ57YLqLIuKVIMw/uQPWAOcGSLNUJSpQT5BlS3edStP3uC+93j1zvv24QJa+YBBVmASbyRqNnkUJQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(40460700003)(8936002)(4326008)(6862004)(8676002)(316002)(70206006)(70586007)(6636002)(37006003)(54906003)(2906002)(33656002)(41300700001)(4744005)(86362001)(5660300002)(81166007)(47076005)(356005)(2616005)(107886003)(82740400003)(336012)(26005)(36860700001)(478600001)(36756003)(6486002)(40480700001)(6512007)(6506007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:32:50.7372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c73171d-c81d-4b68-79b9-08dbe4556a2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7655

DQo+Pj4gSSBjYW4gc2VlIHlvdSByZW1vdmVkIHRoZSBjb3B5cmlnaHQgZnJvbSAuYyBidXQgLmgg
c3RpbGwgaGFzIGl0LiBUaGlzIGFsc28NCj4+PiBhcHBsaWVzIHRvIG90aGVyIG5ld2x5IGludHJv
ZHVjZWQgZmlsZXMgdGhhdCB3ZXJlIHN1YmplY3Qgb25seSB0byBjb2RlIG1vdmVtZW50Lg0KPj4g
DQo+PiBJ4oCZdmUganVzdCByZWFkIGFnYWluIHlvdXIgY29tbWVudCwgSSBwdXNoZWQgdGhlIHY0
IGJ1dCByZW1vdmluZyB0aGUgaGVhZGVyIG9ubHkgZnJvbQ0KPj4gZG9tMGxlc3MtYnVpbGQuaC4N
Cj4+IEkgbGVmdCB0aGUgaGVhZGVyIGluIHRoZSBvdGhlciBzdGF0aWMtKiBiZWNhdXNlIHRoYXQg
SSB0aGluayB3YXMgY29kZSBwcm9kdWNlZCBieSBBcm0sDQo+PiBwbGVhc2UgbGV0IG1lIGtub3cg
eW91ciB0aG91Z2h0cyBhYm91dCB0aGF0ICh5b3UgYW5kIHRoZSBBcm0gbWFpbnRhaW5lcnMpDQo+
IA0KPiBFdmVuIGlmIHRydWUsIGFkZGluZyB0aGUgY29weXJpZ2h0IGFmdGVyIGlzIGEgYml0IG9k
ZC4NCj4gSSBkbyBub3QgdGhpbmsgdGhpcyBpcyBjb2RlIG9uIHdoaWNoIHRoZSBjb3B5cmlnaHQg
cmVhbGx5IGhhcyBpbXBhY3Qgc28gSSB3b3VsZCBub3QgYWRkIGl0IGR1cmluZyB0aGUgbW92ZS4N
Cg0KU3VyZSwgSeKAmWxsIGRyb3AgaXQgDQoNCg==

