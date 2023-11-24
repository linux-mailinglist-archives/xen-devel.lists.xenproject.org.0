Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083BC7F73D5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:30:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640632.999106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VJm-0005As-Uy; Fri, 24 Nov 2023 12:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640632.999106; Fri, 24 Nov 2023 12:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VJm-000595-RK; Fri, 24 Nov 2023 12:29:58 +0000
Received: by outflank-mailman (input) for mailman id 640632;
 Fri, 24 Nov 2023 12:29:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqky=HF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r6VJl-00058z-8c
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:29:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cbc1caf-8ac5-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 13:29:55 +0100 (CET)
Received: from DU6P191CA0046.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::20)
 by GV1PR08MB7708.eurprd08.prod.outlook.com (2603:10a6:150:53::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 12:29:24 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::2a) by DU6P191CA0046.outlook.office365.com
 (2603:10a6:10:53f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 12:29:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 12:29:23 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Fri, 24 Nov 2023 12:29:23 +0000
Received: from 197e5eec30ca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 539BEDD5-0D4E-44E5-A45B-FA8ABC4EE38C.1; 
 Fri, 24 Nov 2023 12:29:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 197e5eec30ca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Nov 2023 12:29:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB10260.eurprd08.prod.outlook.com (2603:10a6:102:369::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 12:29:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 12:29:10 +0000
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
X-Inumbo-ID: 2cbc1caf-8ac5-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Eb+t+SGoOGhzAHqQuIRUkpLh48n9SotXpKZkeS+Nu1B2j6WgukwZ4sxZWl+OwHV91QKe+saosqtHQQ/w0E1CnBhYnFZRyI8TO3JvAq5TeDlYjvDgrAHWXjVTFs5SWy+mnUEqsiphGmoGRqE+dZgZnzT1CbNyx3tATREjF3jvnwiutqYVkR0NBJAY7EpgIYzzI12mWLgVoG3PKGsUZE/cEnBqJ8uzh0CZEtBQH+MJlK6Wr+gC1Q/uxShI4o+rUI9Rj0jZ0RXjQNAsgJ1iz/ZSzo3qOgL+hYG9O9dBuE/2Jg0/3LVkKzHiYLdNfW2zDwazOBHQE6Y24UrxQ//oJAUHOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+imr9Fvw7+ydrW6GcafTxf2V/lPdnwSEjm262AZCEs=;
 b=WfEA9/wEirrL+PTNGdP1zhF5/lwIR9uKbvzEqDLgqBeVUvNgQ86kl/piV2RJrmW47iRulLbstghPh7MOp8pWWjLk3R0JDcM7Yk+f8oLiZIRzOz/rtFKnFhPxYl8YysM64Y6Vrgq/mNuIZmatCIWoKzQW1bCPpeEfXf4ZBqFFRxGbADxvkuEpEeuQBxVqCQ7o1z5fDOERwEcfacMkNMM0alzxMzSNEuWM+MoOKcG5bKLiyWiCMGPY6rZFbGrOka8oSSTLDCki7AkjgOGqBEgFpBVNoHZge871D0IKlSAlL+FIs9d8cqou9KMjRGLgWuUX6TyY8kQH3UuPJtyn7BRzTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+imr9Fvw7+ydrW6GcafTxf2V/lPdnwSEjm262AZCEs=;
 b=zUclnHNLnKDX1EHEIP6xbYstWgCH28zhZLnj64yOZ6hL2k8JJYKPRKys/laoj02xCw9Aq0d2TgkD2yuO/emnCc/ReNdvFuVyRbevH5QV+3GTO1IUNT1ytMCKTvA/+tITllCA76+Kv9cTYb7a2VlJmRWHDMSZdb2rysgSotP4GTI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f6ef7b87a7b3c54
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrrNGjCZrNSyXNoOIjXxgQBkLWNzYM+Nivsi3Js1a9v1rjcZy2kGtpIkwV5IcBCAH6ta9VsKEILEMR3Arpc2dC8Y3uJCYLlcwegVFbYd2PCqqE5tZfjTt9G2kPyuM8dFHqz1hT3mMZVFlJsVRdUMHogjq76ZCz7LKZGw5ZpVHDwip7Wmo+ZfsBhR/9yWKQG2gE84yDbYevrmW0fwj9nZJwm3qSPV2Qv/xs/gouWnDECgoRUv/HTjAOq7fDOCHUWXhQpSzDIvStuL7o9WO8EzzeuyYZiIE3Hz3T1WLAu9OQHZYr/XtPwicaPhxsgpJE1EFAHdkXykGsMa7Xbj3TRwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+imr9Fvw7+ydrW6GcafTxf2V/lPdnwSEjm262AZCEs=;
 b=SKUj8t+Dh57/G4Pd9jlKSp/qo5J3tUffceNPGZpWFKWg4iA2F3leJKEL4tY53JHp/SXKy3LjUcsVgv6jXMLDh8Y1M/FwaXKUjckcA/Ma5v/+GCw0BdFY5IYj1Xv2Rdr2t0NwHEylE7+4am1V0eXjNnkXOydJFpxKLEg84o+AiuDUCZI3AjjrKguA8WfBYjyKyPMlsXrWT3fXjPswEqBZiCKmyhLrXZSEbnHRmocgYmU0qGPnQuERgsZAQzD6jPW6T7IbKQiY+zh+S8mQieP6R7Y3AALFyVEqLc2vZJNd56UWyn421KqwyCSYdiPbCSbOG2mOKb3L/5C90MANfKWqpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+imr9Fvw7+ydrW6GcafTxf2V/lPdnwSEjm262AZCEs=;
 b=zUclnHNLnKDX1EHEIP6xbYstWgCH28zhZLnj64yOZ6hL2k8JJYKPRKys/laoj02xCw9Aq0d2TgkD2yuO/emnCc/ReNdvFuVyRbevH5QV+3GTO1IUNT1ytMCKTvA/+tITllCA76+Kv9cTYb7a2VlJmRWHDMSZdb2rysgSotP4GTI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@cloud.com>
Subject: Re: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index: AQHaHhwDfni7SbjBtk6S7YLD/w4HebCJUeoAgAANCgCAAAc3gIAAATaA
Date: Fri, 24 Nov 2023 12:29:10 +0000
Message-ID: <DB3B132B-0148-4AD7-9BC0-5D4C50D8E6BF@arm.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <CA+zSX=YL0fjM+ZTEoXNpzQ9iFKFwzdZRR-QsyQAZCQVeOGdj6A@mail.gmail.com>
 <DE78DF95-3E57-4283-8252-01A0BA2219F8@arm.com>
 <ced05080-ef2b-4288-93be-74535a7a3982@suse.com>
In-Reply-To: <ced05080-ef2b-4288-93be-74535a7a3982@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB10260:EE_|DB5PEPF00014B9A:EE_|GV1PR08MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: d5513b19-66a8-4704-a90c-08dbece8fd76
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GO/pamyFkSYdmtv/qfq1u25j0Z1OfYJeoLq5pxSe9xpH9bF+BuP1ayl8xrSMOqY4hzfo264m9UyqNLzmYQVaO4EBjmHPW8pRLZ9m8+444fBCswyJU6VX84NI2399jQbsrKzUkFiV9MM4Uq7peoP2rVwixA4yy2Az9deRF0sPPk1iDuTLuUefGrQFDtfu3kuZyZfhS5AGljjzSkbBTu+IkaZu5/bFjQWwXW9pSY7PSwlNcCPtC41iWS02uKI4KxyYmxzraqgB05zbrkOW9M7tSgVj6zPlwbS7qYWau+gH9UWfWxaTgEUkB9jKG/qlFBqX/BSnwJm+snD6N095ISnIJi5q1el2QTWeh0QbRGe5a3PH+igzW+F0LFZmPYu7AFE4L2Ts9ycpIlMh2LgX0KWp6OVD6ifWX7gb94kpMkqP0sTMPdxxirx99R3mA+Dsd1TZEptuC03p2qk2YElm4wu1wiAP+7cm8AeUJ9me2i40CDSIinLLqf+r0Fiw2BNr8QihttIBa5j9blcbRmJQKnTp7rNMXeCCfW+dbIMBKSXVt6noTQsXhCDbh/00IVE0U5/nKp42RDXZjXxb8UGD8yVUJSTaJgTH42+OoS7Pb+YUgeugxsETDQzRvG+GX0zQQfiLmyw08BQRDp2aF78w0Jiwow==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6486002)(966005)(53546011)(6506007)(38070700009)(36756003)(122000001)(6512007)(26005)(66446008)(2906002)(5660300002)(2616005)(86362001)(4326008)(91956017)(83380400001)(66476007)(41300700001)(8676002)(66946007)(64756008)(54906003)(8936002)(76116006)(66556008)(316002)(33656002)(6916009)(38100700002)(71200400001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F35428D9ABAF64E8C799D26387C6416@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10260
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b554c4a7-2728-41c0-967c-08dbece8f59f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Nhb+yg79Y6BlXwGEmVmy8M0O/RiCL/IMeleY5/nj9swMplJNAt43DPG1CalzqJ7s3sH8sd6FvafT2RIzKK+dLFxe0TJXfyeCnSq1owx0CvCnjwatot5B5N/4PHD2jEHGmYzjZszRtFkPA/yLDcxsWWdka+PSju4jX08CaTT4oW9TuhJ5ktTaSaDHL5AeOSTRKYYvsjsJxIlyVLP/dfal99onIoECcaMFJ0KcVZKNs40IMYi47UpF3819Y+UrOdhYWr+mgSWcmhDc951/abcoetSvP09dCmoS2pYiSUyePfSeb+FF8uusiVVYDomUfUJ/0kBfa37AuQbm/Do1O12R/XNqERUUYhiLGnSySc4WMpgSPcvgI5WjQ4BoGAhPOSNCHeJHDUMobq3COV1pntAOay7sGgmDHllu1QauKv/oBASSEZ1yCGuOrghQGowe5yMMgpbVyfcd5Fi++927BCCxdtaVLV71VpRyPvIG5tvIquZ57coWg4pL5yJv4kL8aDax2/7wNBvSf76LSwQPMiy4+dc2d3c7uANe4uvQOzmWeu0I1k04D5aRecJTl671Q6s6zuSPQp2iiVRbp02kEANy78/QvffHqQdDaML5nz2lUJFk3v4EqaC/nyjSdjZnMNOh7TXFcUjccCt0QDSjbWZ4kWZ5Jag/3RriJPsW4+0aMe/S+vy7cigINnE/d+L60FJ3vHCXJZOw1w/mkxfqZgnqGhhgzvGUYDXU+dkJxWuO3I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799012)(46966006)(36840700001)(40470700004)(4326008)(70586007)(70206006)(8676002)(8936002)(6862004)(316002)(53546011)(54906003)(6506007)(107886003)(40460700003)(2616005)(6512007)(966005)(478600001)(6486002)(2906002)(36756003)(33656002)(41300700001)(5660300002)(36860700001)(47076005)(86362001)(40480700001)(81166007)(356005)(82740400003)(83380400001)(336012)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 12:29:23.2037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5513b19-66a8-4704-a90c-08dbece8fd76
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7708

DQoNCj4gT24gMjQgTm92IDIwMjMsIGF0IDEyOjI0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMTEuMjAyMyAxMjo1OSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IEBAIC0zMzMzLDE5ICszMzE4LDE4IEBAIHN0YXRpYyBpbnQgX19pbml0IGFsbG9j
X2RvbWFpbl9ldnRjaG4oc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlKQ0KPj4gcmMgPSBldnRj
aG5fYWxsb2NfdW5ib3VuZCgmYWxsb2NfdW5ib3VuZCwgZG9tVTFfcG9ydCk7DQo+PiBpZiAoIHJj
IDwgMCApDQo+PiB7DQo+PiAtIHByaW50ayhYRU5MT0dfRVJSDQo+PiAtICJldnRjaG5fYWxsb2Nf
dW5ib3VuZCgpIGZhaWx1cmUgKEVycm9yICVkKSBcbiIsIHJjKTsNCj4+ICsgcHJpbnRrKFhFTkxP
R19FUlIgImV2dGNobl9hbGxvY191bmJvdW5kKCkgZmFpbHVyZSAoRXJyb3IgJWQpIFxuIiwgcmMp
Ow0KPj4gcmV0dXJuIHJjOw0KPj4gfQ0KPj4gLSBiaW5kX2ludGVyZG9tYWluLnJlbW90ZV9kb20g
PSBkMS0+ZG9tYWluX2lkOw0KPj4gKyBiaW5kX2ludGVyZG9tYWluLnJlbW90ZV9kb20gPSBkMS0+
ZG9tYWluX2lkOw0KPj4gYmluZF9pbnRlcmRvbWFpbi5yZW1vdGVfcG9ydCA9IGRvbVUxX3BvcnQ7
DQo+PiByYyA9IGV2dGNobl9iaW5kX2ludGVyZG9tYWluKCZiaW5kX2ludGVyZG9tYWluLCBkMiwg
ZG9tVTJfcG9ydCk7DQo+PiBpZiAoIHJjIDwgMCApDQo+PiB7DQo+PiANCj4+IEFzc2lnbm1lbnQg
b2YgYmluZF9pbnRlcmRvbWFpbi5yZW1vdGVfZG9tIHdhcyBhbGlnbmVkIHdpdGggdGhlIGZvbGxv
d2luZyBsaW5lLCBidXQgc2luY2UgdGhlIHZhbHVlDQo+PiBvZiB0aGlzIGNvbmZpZ3VyYWJsZSBp
cyDigJxOb25l4oCdLCBjbGFuZy1mb3JtYXQgaXMgbW9kaWZ5aW5nIHRoYXQgdG8gdXNlIG9ubHkg
b25lIHNwYWNlIGJlZm9yZSB0aGUgYXNzaWdubWVudA0KPj4gb3BlcmF0b3IuDQo+IA0KPiBOZWl0
aGVyIGhlcmUgbm9yIC4uLg0KPiANCj4+IE9uZSBleGFtcGxlIHJlbGF0ZWQgdG8gbWFjcm9zIGNh
biBiZSBmb3VuZCBvbiBsaW5lIDE2NjM6DQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vYXJtMzIvaW5zbi5jIGIveGVuL2FyY2gvYXJtL2FybTMyL2luc24uYw0KPj4gaW5kZXggNDk5
NTNhMDQyYS4uMTYzNWM0YjZkMSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9p
bnNuLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9pbnNuLmMNCj4+IEBAIC0xOSw5ICsx
OSw5IEBADQo+PiAjaW5jbHVkZSA8YXNtL2luc24uaD4NCj4+IC8qIE1hc2sgb2YgYnJhbmNoIGlu
c3RydWN0aW9ucycgaW1tZWRpYXRlLiAqLw0KPj4gLSNkZWZpbmUgQlJBTkNIX0lOU05fSU1NX01B
U0sgR0VOTUFTSygyMywgMCkNCj4+ICsjZGVmaW5lIEJSQU5DSF9JTlNOX0lNTV9NQVNLIEdFTk1B
U0soMjMsIDApDQo+PiAvKiBTaGlmdCBvZiBicmFuY2ggaW5zdHJ1Y3Rpb25zJyBpbW1lZGlhdGUu
ICovDQo+PiAtI2RlZmluZSBCUkFOQ0hfSU5TTl9JTU1fU0hJRlQgMA0KPj4gKyNkZWZpbmUgQlJB
TkNIX0lOU05fSU1NX1NISUZUIDANCj4+IA0KPj4gQ2xhbmcgZm9ybWF0IHNlZXMgdGhlIGNvbW1l
bnQgYmV0d2VlbiBCUkFOQ0hfSU5TTl9JTU1fTUFTSyBhbmQgQlJBTkNIX0lOU05fSU1NX1NISUZU
IGFuZA0KPj4gZXZlbiBpZiBiZWZvcmUgdGhlIHZhbHVlIG9mIHRoZSBtYWNyb3Mgd2VyZSBhbGln
bmVkLCBpdCBhcHBsaWVzIHRoZSBydWxlIG9mIG9uZSBzcGFjZSBiZXR3ZWVuIHRoZSBtYWNybyBu
YW1lDQo+PiBhbmQgdGhlIHZhbHVlLg0KPiANCj4gLi4uIGhlcmUgdGhlcmUgaXMgYW55IGNoYW5n
ZSBpbiB0aGUgZm9ybWF0dGluZyBvbiB0aGUgbGluZXMgaW4gcXVlc3Rpb24uDQo+IEkgd2FzIGZp
cnN0IHN1c3BlY3RpbmcgYSBwb3NzaWJsZSBpc3N1ZSB3aXRoIG15IG1haWwgVUksIGJ1dA0KPiBo
dHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMy0xMS9tc2cw
MjEzMi5odG1sDQo+IGxvb2tzIHRvIGNvbmZpcm0gdGhlIGlzc3VlIHRvIG1vcmUgbGlrZWx5IGJl
IG9uIHlvdXIgZW5kIChhcHBhcmVudGx5IGFsc28NCj4gcmVzdWx0aW5nIGluIGxlYWRpbmcgd2hp
dGVzcGFjZSBoYXZpbmcgYmVlbiBkcm9wcGVkKS4NCg0KWWVzIGluZGVlZCwgaXQgc2VlbXMgdGhh
dCBjb3B5IHBhc3RlIHJlbW92ZWQgdGhlIG9yaWdpbmFsIGZvcm1hdHRpbmcsDQpidXQgdGhlc2Ug
c25pcHBldHMgY2FuIGJlIGNoZWNrZWQgaW4gdGhlIHBhdGNoIGZpbGUgSSBsaW5rZWQsIEnigJl2
ZSBhZGRlZA0KYSBsaW5lIG51bWJlci4NClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4NCg0K
Q2hlZXJzLA0KTHVjYQ0KDQo=

