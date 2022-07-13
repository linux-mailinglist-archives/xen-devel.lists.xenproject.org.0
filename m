Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6983572B64
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 04:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366161.596825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBSKY-0001Ig-Sr; Wed, 13 Jul 2022 02:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366161.596825; Wed, 13 Jul 2022 02:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBSKY-0001Fe-PV; Wed, 13 Jul 2022 02:42:26 +0000
Received: by outflank-mailman (input) for mailman id 366161;
 Wed, 13 Jul 2022 02:42:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZ/F=XS=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oBSKX-0001FY-AA
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 02:42:25 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a6d83bf-0255-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 04:42:22 +0200 (CEST)
Received: from AS9PR06CA0376.eurprd06.prod.outlook.com (2603:10a6:20b:460::14)
 by AS8PR08MB6630.eurprd08.prod.outlook.com (2603:10a6:20b:337::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Wed, 13 Jul
 2022 02:42:17 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::79) by AS9PR06CA0376.outlook.office365.com
 (2603:10a6:20b:460::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Wed, 13 Jul 2022 02:42:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 02:42:16 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Wed, 13 Jul 2022 02:42:16 +0000
Received: from da93b92bf064.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8CC7A81-48D4-4FF9-B86C-0E5661F3A6FA.1; 
 Wed, 13 Jul 2022 02:42:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da93b92bf064.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 02:42:10 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AS8PR08MB8159.eurprd08.prod.outlook.com (2603:10a6:20b:560::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 02:42:00 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 02:42:00 +0000
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
X-Inumbo-ID: 6a6d83bf-0255-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=e8cmxMDa254VLRB+36V9DWIal9JFHrIGoFbmD2SoKBmLui1MmZhcBIuPlfi3jDKESJwoWrMIsQ/roRpjOKVNIl9ZrjMm59bi83/5bquhMsNNuZlXJeO/NioBf5kGboztwBl0Rqby3kRjwRZNl0wMXf2E12rkDBIvxQsxO8TsDbp5Nu8n+/kgcuQguQtlUAzakLlAcaxdMniIj+NO1R354nsIYH0uccw/HpeCYljKoZdbsDIi1NVFc/7NhUjXnRca/oadG3lnM8XeQbqJJd2B1AuyfXjCqaQFUUulOpBGjhT8yn285wq3sWZ7RgrM1GxPUPIrs9b/0kWLinGTchNtvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pzNI4diC0sXRof6JLCyc3g6ztWYqp7CAXlXODf2eFQ=;
 b=JL4EiIt+jYw9FRecAs3iqov8XQ0nPG70kLL0teVfGgPt6w7z1BRIfuejo+Es4ZGHZTnstfLj5aLQpB0FTnjJIJX/lFzgPOi2pbw7SFaXEuIpF5KJi+6KMgjWdZYJInWyX9CTnzsY+vbL4Kzdj8wrMMtjpP2Az3gfb5uKd1kr87N3TsZftei9YAo3JI5r+iioB5dyxh7UZXjq0iIy0wru/KczCuMjBsuBE2fQQNgdIriHyVCTodDSdEUxBg1fYOSyjwED3Ai2Qny+YiTRbLTc1mnD3jipoTOWmKPid7kf+N7TNHmep3wBSGLkshsNyJcM+drzpPdD+Nn7fRBpptYFOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pzNI4diC0sXRof6JLCyc3g6ztWYqp7CAXlXODf2eFQ=;
 b=3ULOKXhMwXKnsWtYSocgELrOMQP2WqYaqf6DAUph4awvvVNFXXbAOq/mZfWU/5M8U1Spp/8OhPntkG6FIYO99HHTYoqdItTEtG+zsdWr64bxuUYjkm+MRx7Z9iGd2rjkaori9Ihpqx+GIf+yDo5lwjAizPA8IQ+MTH04ez9bmFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVxe1OYyYpOp0rYpfDb0P0j454m/v+qAuuSNjNgK6Tvwz1t8R5KP06tgp+KkL4h6FUvWROEdsPDZHOCR+ELTXtq8m6py9mTXvhpiYe7vPjRv+97AYXWc/+KOgcx+HvuJb0BiZeVYxbHZs5gNa3WRBYcO6BeASC96kqFICu78oqB3GU3I/2/01sD8SCpaC13q/6tfa4x+0wyv6PSh5H9CxqwReOb9HvhRgMlhhn0k8V8TMyEIyFmaTyvfcgRosn5K2UZfr69rTyJ4TtRjGerYoMfel7vymaXT5lgnHCxwvAnV0t8olFGsSngNQaUH34igqzYXiaa5bKPlpIBod8z9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pzNI4diC0sXRof6JLCyc3g6ztWYqp7CAXlXODf2eFQ=;
 b=RAfJZ96fuqDro/Fh0jKYH+JiEOlKa0jVqCp/hmPHax/ALVL1IL8pwH7zR1mj0GvOFUOYF5nTe8E7fEAua9aVaCpHbLHu9b2f5N8ZYB8PtPPuLJFrKupDeTNHgqeFH3gbMAoLkOZ5FANLz9VJLv6kbxfW3+W/KJuSfh/8HGCeJ4+Y1HrvQ122QxYiD9Z+Sz6p580zz0/D15Fua5Im0pnBN6nqNIaug6BFHTkGDW/gvOLgOVxTxSNQlgt9buB9FkkVw9oZTfNc94PolCI4xaQ37YcihltbEU4e5ZgbTkvDmJk4XXdRVmRSEOkyT2o6/bxbrNdxkrOfUM1wsDgPsesSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pzNI4diC0sXRof6JLCyc3g6ztWYqp7CAXlXODf2eFQ=;
 b=3ULOKXhMwXKnsWtYSocgELrOMQP2WqYaqf6DAUph4awvvVNFXXbAOq/mZfWU/5M8U1Spp/8OhPntkG6FIYO99HHTYoqdItTEtG+zsdWr64bxuUYjkm+MRx7Z9iGd2rjkaori9Ihpqx+GIf+yDo5lwjAizPA8IQ+MTH04ez9bmFk=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 1/8] xen/arm: introduce static shared memory
Thread-Topic: [PATCH v5 1/8] xen/arm: introduce static shared memory
Thread-Index: AQHYhGRAIMWAAZoglEyYz3pT8Ubq/a1e3kuAgAboQaCAAHOqgIAVfzCA
Date: Wed, 13 Jul 2022 02:42:00 +0000
Message-ID:
 <DU2PR08MB73253B76AB01215366619572F7899@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-2-Penny.Zheng@arm.com>
 <45a41132-1520-a894-a9eb-6688c79a660d@xen.org>
 <DU2PR08MB7325C156D4D6D5A2D18E0FF4F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <9172fc95-0939-3680-94cf-b991c46d0918@xen.org>
In-Reply-To: <9172fc95-0939-3680-94cf-b991c46d0918@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BD4689873E813B4CA9CF3B19C67F6AC2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8f02daa1-eb29-41e9-e94e-08da64794cb0
x-ms-traffictypediagnostic:
	AS8PR08MB8159:EE_|VE1EUR03FT044:EE_|AS8PR08MB6630:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ecgGcmq6CmCn2Rwlx4MvcbbE5TJP+GWLdJz6IDCgA8xpPuAsBPeizExLsJc+a8H+8MlLrqmpKyZS13dEN9IiWHxbcyJlny6SniUSWYGUaWuUg5kzUY1EeRzFRA/le671hB5mBYYuQHEXCqTwFdaR/3sZLHdrunu3sDwhzsnzqEDIZ1jJtIthFawA9f/WfJ7Ehg/MHnCG63GHl7i+ASYH1fgMPSi+tLUwlqPHrKpYJpaq8ho4TAWb3ldE241XJQmwBJFbz5wqjmXWVYI/BqgPtJVLbyajI07xd/USjyST7lxSV+ilf3r1qSaYooNN+lDGNyXe84KzhZHcRQ/briZ4ZK5wz4Y+GboACel3LOu2jTqcQAqrs/j/ZmooQtgUbm63iKaqacAPMoIP0gErXOaPkIlteQrIe5O/cl0MyLyk6kRbDNagJ4An55DMSMpEvGf3Ax4Z3avojgYXJ4CLCDMwQTrN+qsVvEbdgYf12IzpphUIvN2EqXjoGckn2pqmziX/pSAQYlPdexG8g/aKvtCdfBMcSVigetPVGK72XMnR+JJ52BtSFAkIGFhDSDf4Sjxu0I+sAnqYtKk1uVWVNunaqM1CSwVWxi20CZh8a0Yqnv+EqQyyTxhdltbT1Lg7hYW+HJjaQdbDQRfgatUQBaSsZfy8rLaXzJjKpThrCC4ThhoEQT3kMuTtwElx0Z1lMiYhwvvstUcM0nSOIIcifeKSLxRVHXWgbbdGhJNNcOMUWSPUh0wV69NshrmrV0Flq544nSvJ9+Qdrqxb1lTRWrMqSJaGgBHgWAnsJQ8kavJJMNdOsjKjo/II1ShuQavKR2KZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(122000001)(7696005)(6506007)(9686003)(41300700001)(26005)(53546011)(478600001)(8936002)(5660300002)(38070700005)(71200400001)(52536014)(38100700002)(8676002)(66446008)(4326008)(64756008)(76116006)(66946007)(66556008)(83380400001)(316002)(110136005)(54906003)(186003)(2906002)(66476007)(55016003)(86362001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8159
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea3db521-7eae-4e14-785e-08da647942e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i7sWpZWKFqrXWUe1Nktoe45GJGIjvYWhJHtIwRz4IA8LI9giwSxYTZtOYQOMgFot4KiRrhYx/tWfokuQRPHUOzlsF40j3gsY+lC8qKKCqnXiH4zwROjKpU+FYbexYTp/11J0qwpK7X/NLPLBpmAlwB/QUKpAU2oaIq4dU/4se16owZ1w6y8f4XaiegibGuCrPqBZ6RYiBzBdJ8DG5h93yYE+NvbzWfdaVNv4j8QSIoXmPrbQ8XBhB/268SGHyg7gW4wQ24waG7v3VhC1EyEwIp1qSynV1Goe7cSY8iac9xr7011EtSW6okaMfAcu8r9GPcJ1RPex+ZaBAVtoO7pImu+LS3izPiqdXeNI3b7YoSYoT1e/2QvKf1vdUEM7jDYTVtWFcG9NdyNEro9efseevrRpji9hS6YSMkg7LbKSRC9pM07k6Gf9w8L1QmKeA/xzAlfA1etDD/N7XeUMipIZU8idH58WFgE4XWFtfO/7y0FCzD2rhjWSCgnRD+Hsbh4FUSaZuzewkOPpVB+JJjLJStHT01BV3JrU+8QfpbHS1isnIDdgBCxTycyAeIDwvrrJT5mx/Xlj6UXvGEvo5buZbyFTdtzT0eoR7HpqYBiGHAgAezuyJpmLXZ0hhIO53GD755/uD8Gcm9q3wd9Aoo7pGAdvQwvTEpPe91Edq/HcyLRLNeV3iNBqCtTUIISlOO+5+wu5qQ8fMUrCXdqrMeZpb9Z85Oi0VOh4reU4nZc9i57cS02ZRNRftGlSPMJQ5KPIFTWX8WyxCtWIrYO//qz+Fe6qQ24Ir4jlSn4Et3yNSbMwiSC+0LqzEbnI8YO8nGP9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(55016003)(2906002)(186003)(478600001)(41300700001)(336012)(40480700001)(82310400005)(70206006)(86362001)(110136005)(316002)(9686003)(33656002)(8676002)(4326008)(26005)(54906003)(6506007)(53546011)(70586007)(7696005)(83380400001)(52536014)(82740400003)(81166007)(5660300002)(36860700001)(47076005)(107886003)(8936002)(356005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 02:42:16.5423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f02daa1-eb29-41e9-e94e-08da64794cb0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6630

SGkgSnVsaWVuDQoNCkJlZm9yZSBzdWJtaXR0aW5nIHRoZSB2NiBwYXRjaCBzZXJpZXMsIEkgd291
bGQgbGlrZSB0byBkb3VibGUgY29uZmlybSB0aGF0IC4uLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVuZSAyOSwgMjAyMiA2OjE4IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVu
bnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFy
bS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMS84XSB4ZW4vYXJtOiBpbnRyb2R1Y2Ugc3RhdGlj
IHNoYXJlZCBtZW1vcnkNCj4gDQo+IA0KPiANCj4gT24gMjkvMDYvMjAyMiAwNjozOCwgUGVubnkg
Wmhlbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+ID4NCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gPj4gU2VudDogU2F0dXJkYXksIEp1bmUgMjUsIDIwMjIgMTo1NSBB
TQ0KPiA+PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tDQo+IGRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJt
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IEJlcnRyYW5kIE1hcnF1aXMNCj4gPj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9k
eW15ciBCYWJjaHVrDQo+ID4+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NSAxLzhdIHhlbi9hcm06IGludHJvZHVjZSBzdGF0aWMgc2hhcmVk
IG1lbW9yeQ0KPiA+Pg0KPiA+PiBIaSBQZW5ueSwNCj4gPj4NCj4gPj4gT24gMjAvMDYvMjAyMiAw
NjoxMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiBGcm9tOiBQZW5ueSBaaGVuZyA8cGVubnku
emhlbmdAYXJtLmNvbT4NCj4gPj4+DQo+ID4+PiBUaGlzIHBhdGNoIHNlcmllIGludHJvZHVjZXMg
YSBuZXcgZmVhdHVyZTogc2V0dGluZyB1cCBzdGF0aWMNCj4gPj4NCj4gPj4gVHlwbzogcy9zZXJp
ZS9zZXJpZXMvDQo+ID4+DQo+ID4+PiBzaGFyZWQgbWVtb3J5IG9uIGEgZG9tMGxlc3Mgc3lzdGVt
LCB0aHJvdWdoIGRldmljZSB0cmVlIGNvbmZpZ3VyYXRpb24uDQo+ID4+Pg0KPiA+Pj4gVGhpcyBj
b21taXQgcGFyc2VzIHNoYXJlZCBtZW1vcnkgbm9kZSBhdCBib290LXRpbWUsIGFuZCByZXNlcnZl
IGl0DQo+ID4+PiBpbiBib290aW5mby5yZXNlcnZlZF9tZW0gdG8gYXZvaWQgb3RoZXIgdXNlLg0K
PiA+Pj4NCj4gPj4+IFRoaXMgY29tbWl0cyBwcm9wb3NlcyBhIG5ldyBLY29uZmlnIENPTkZJR19T
VEFUSUNfU0hNIHRvIHdyYXANCj4gPj4+IHN0YXRpYy1zaG0tcmVsYXRlZCBjb2RlcywgYW5kIHRo
aXMgb3B0aW9uIGRlcGVuZHMgb24gc3RhdGljIG1lbW9yeSgNCj4gPj4+IENPTkZJR19TVEFUSUNf
TUVNT1JZKS4gVGhhdCdzIGJlY2F1c2UgdGhhdCBsYXRlciB3ZSB3YW50IHRvIHJldXNlIGENCj4g
Pj4+IGZldyBoZWxwZXJzLCBndWFyZGVkIHdpdGggQ09ORklHX1NUQVRJQ19NRU1PUlksIGxpa2UN
Cj4gPj4+IGFjcXVpcmVfc3RhdGljbWVtX3BhZ2VzLCBldGMsIG9uIHN0YXRpYyBzaGFyZWQgbWVt
b3J5Lg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVu
Z0Bhcm0uY29tPg0KPiA+Pj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4NCj4gPj4+IC0tLQ0KPiA+Pj4gdjUgY2hhbmdlOg0KPiA+Pj4gLSBu
byBjaGFuZ2UNCj4gPj4+IC0tLQ0KPiA+Pj4gdjQgY2hhbmdlOg0KPiA+Pj4gLSBuaXQgZml4IG9u
IGRvYw0KPiA+Pj4gLS0tDQo+ID4+PiB2MyBjaGFuZ2U6DQo+ID4+PiAtIG1ha2UgbnJfc2htX2Rv
bWFpbiB1bnNpZ25lZCBpbnQNCj4gPj4+IC0tLQ0KPiA+Pj4gdjIgY2hhbmdlOg0KPiA+Pj4gLSBk
b2N1bWVudCByZWZpbmVtZW50DQo+ID4+PiAtIHJlbW92ZSBiaXRtYXAgYW5kIHVzZSB0aGUgaXRl
cmF0aW9uIHRvIGNoZWNrDQo+ID4+PiAtIGFkZCBhIG5ldyBmaWVsZCBucl9zaG1fZG9tYWluIHRv
IGtlZXAgdGhlIG51bWJlciBvZiBzaGFyZWQgZG9tYWluDQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRv
Y3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgfCAxMjANCj4gPj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gPj4+ICAgIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgICAg
ICAgICAgICAgfCAgIDYgKysNCj4gPj4+ICAgIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAgICAg
ICAgICAgICAgfCAgNjggKysrKysrKysrKysrKysrDQo+ID4+PiAgICB4ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vc2V0dXAuaCAgICAgIHwgICAzICsNCj4gPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwg
MTk3IGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2Fy
bS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPiA+Pj4gYi9kb2NzL21pc2MvYXJtL2RldmljZS10
cmVlL2Jvb3RpbmcudHh0DQo+ID4+PiBpbmRleCA5ODI1MzQxNGI4Li42NDY3YmM1YTI4IDEwMDY0
NA0KPiA+Pj4gLS0tIGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPiA+
Pj4gKysrIGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPiA+Pj4gQEAg
LTM3OCwzICszNzgsMTIzIEBAIGRldmljZS10cmVlOg0KPiA+Pj4NCj4gPj4+ICAgIFRoaXMgd2ls
bCByZXNlcnZlIGEgNTEyTUIgcmVnaW9uIHN0YXJ0aW5nIGF0IHRoZSBob3N0IHBoeXNpY2FsIGFk
ZHJlc3MNCj4gPj4+ICAgIDB4MzAwMDAwMDAgdG8gYmUgZXhjbHVzaXZlbHkgdXNlZCBieSBEb21V
MS4NCj4gPj4+ICsNCj4gPj4+ICtTdGF0aWMgU2hhcmVkIE1lbW9yeQ0KPiA+Pj4gKz09PT09PT09
PT09PT09PT09PT09DQo+ID4+PiArDQo+ID4+PiArVGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGRl
dmljZSB0cmVlIG5vZGVzIGFsbG93IHVzZXJzIHRvDQo+ID4+PiArc3RhdGljYWxseSBzZXQgdXAg
c2hhcmVkIG1lbW9yeSBvbiBkb20wbGVzcyBzeXN0ZW0sIGVuYWJsaW5nDQo+ID4+PiArZG9tYWlu
cyB0byBkbyBzaG0tYmFzZWQgY29tbXVuaWNhdGlvbi4NCj4gPj4+ICsNCj4gPj4+ICstIGNvbXBh
dGlibGUNCj4gPj4+ICsNCj4gPj4+ICsgICAgInhlbixkb21haW4tc2hhcmVkLW1lbW9yeS12MSIN
Cj4gPj4+ICsNCj4gPj4+ICstIHhlbixzaG0taWQNCj4gPj4+ICsNCj4gPj4+ICsgICAgQW4gOC1i
aXQgaW50ZWdlciB0aGF0IHJlcHJlc2VudHMgdGhlIHVuaXF1ZSBpZGVudGlmaWVyIG9mIHRoZQ0K
PiA+Pj4gKyBzaGFyZWQNCj4gPj4gbWVtb3J5DQo+ID4+PiArICAgIHJlZ2lvbi4gVGhlIG1heGlt
dW0gaWRlbnRpZmllciBzaGFsbCBiZSAieGVuLHNobS1pZCA9IDwweGZmPiIuDQo+ID4+PiArDQo+
ID4+PiArLSB4ZW4sc2hhcmVkLW1lbQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBBbiBhcnJheSB0YWtl
cyBhIHBoeXNpY2FsIGFkZHJlc3MsIHdoaWNoIGlzIHRoZSBiYXNlIGFkZHJlc3Mgb2YgdGhlDQo+
ID4+PiArICAgIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGluIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBz
cGFjZSwgYSBzaXplLA0KPiA+Pj4gKyBhbmQgYQ0KPiA+PiBndWVzdA0KPiA+Pj4gKyAgICBwaHlz
aWNhbCBhZGRyZXNzLCBhcyB0aGUgdGFyZ2V0IGFkZHJlc3Mgb2YgdGhlIG1hcHBpbmcuIFRoZQ0K
PiA+Pj4gKyBudW1iZXIgb2YNCj4gPj4gY2VsbHMNCj4gPj4+ICsgICAgZm9yIHRoZSBob3N0IGFk
ZHJlc3MgKGFuZCBzaXplKSBpcyB0aGUgc2FtZSBhcyB0aGUgZ3Vlc3QgcHNldWRvLQ0KPiBwaHlz
aWNhbA0KPiA+Pj4gKyAgICBhZGRyZXNzIGFuZCB0aGV5IGFyZSBpbmhlcml0ZWQgZnJvbSB0aGUg
cGFyZW50IG5vZGUuDQo+ID4+DQo+ID4+IFNvcnJ5IGZvciBqdW1wIGluIHRoZSBkaXNjdXNzaW9u
IGxhdGUuIEJ1dCBhcyB0aGlzIGlzIGdvaW5nIHRvIGJlIGENCj4gPj4gc3RhYmxlIEFCSSwgSSB3
b3VsZCB0byBtYWtlIHN1cmUgdGhlIGludGVyZmFjZSBpcyBnb2luZyB0byBiZSBlYXNpbHkNCj4g
ZXh0ZW5kYWJsZS4NCj4gPj4NCj4gPj4gQUZBSVUsIHdpdGggeW91ciBwcm9wb3NhbCB0aGUgaG9z
dCBwaHlzaWNhbCBhZGRyZXNzIGlzIG1hbmRhdG9yeS4gSQ0KPiA+PiB3b3VsZCBleHBlY3QgdGhh
dCBzb21lIHVzZXIgbWF5IHdhbnQgdG8gc2hhcmUgbWVtb3J5IGJ1dCBkb24ndCBjYXJlDQo+ID4+
IGFib3V0IHRoZSBleGFjdCBsb2NhdGlvbiBpbiBtZW1vcnkuIFNvIEkgdGhpbmsgaXQgd291bGQg
YmUgZ29vZCB0bw0KPiA+PiBtYWtlIGl0IG9wdGlvbmFsIGluIHRoZSBiaW5kaW5nLg0KPiA+Pg0K
PiA+PiBJIHRoaW5rIHRoaXMgd2FudHMgdG8gYmUgZG9uZSBub3cgYmVjYXVzZSBpdCB3b3VsZCBi
ZSBkaWZmaWN1bHQgdG8NCj4gPj4gY2hhbmdlIHRoZSBiaW5kaW5nIGFmdGVyd2FyZHMgKHRoZSBo
b3N0IHBoeXNpY2FsIGFkZHJlc3MgaXMgdGhlIGZpcnN0IHNldCBvZg0KPiBjZWxscykuDQo+ID4+
DQo+ID4+IFRoZSBYZW4gZG9lc24ndCBuZWVkIHRvIGhhbmRsZSB0aGUgb3B0aW9uYWwgY2FzZS4N
Cj4gPj4NCg0KLi4uIHdoYXQgeW91IHN1Z2dlc3RlZCBoZXJlIGlzIHRoYXQgZHVyaW5nICJ4ZW4s
c2hhcmVkLW1lbSIgZGV2aWNlIHRyZWUgcHJvcGVydHkNCnBhcnNpbmcgcHJvY2VzcywgaWYgd2Ug
ZmluZCB0aGF0IHVzZXIgZG9lc24ndCBwcm92aWRlIHBoeXNpY2FsIGFkZHJlc3MsIHdlIHdpbGwg
b3V0cHV0DQphbiBlcnJvciwgc2F5aW5nIHRoYXQgaXQgaXMgbm90IHN1cHBvcnRlZCBhdCB0aGUg
bW9tZW50LCByaWdodD8NCg0KPiA+DQo+ID4gU3VyZSwgSSdsbCBtYWtlICJ0aGUgaG9zdCBwaHlz
aWNhbCBhZGRyZXNzIiBvcHRpb25hbCBoZXJlLCBhbmQgcmlnaHQNCj4gPiBub3csIHdpdGggbm8g
YWN0dWFsIGNvZGUgaW1wbGVtZW50YXRpb24uIEknbGwgbWFrZSB1cCBpdCBsYXRlciBpbiBmcmVl
DQo+ID4gdGltZX4NCj4gPg0KPiA+IFRoZSB1c2VyIGNhc2UgeW91IG1lbnRpb25lZCBoZXJlIGlz
IHRoYXQgd2UgbGV0IHhlbiB0byBhbGxvY2F0ZSBhbg0KPiA+IGFyYml0cmFyeSBzdGF0aWMgc2hh
cmVkIG1lbW9yeSByZWdpb24sIHNvIHNpemUgYW5kIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MNCj4g
YXJlIHN0aWxsIG1hbmRhdG9yeSwgcmlnaHQ/DQo+IA0KPiBUaGF0J3MgY29ycmVjdC4NCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

