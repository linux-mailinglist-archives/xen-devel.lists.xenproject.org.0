Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D887E7A6C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629990.982596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NSw-0001q4-Bo; Fri, 10 Nov 2023 09:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629990.982596; Fri, 10 Nov 2023 09:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NSw-0001nS-8l; Fri, 10 Nov 2023 09:06:14 +0000
Received: by outflank-mailman (input) for mailman id 629990;
 Fri, 10 Nov 2023 09:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVdC=GX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r1NSu-0001lO-OA
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:06:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63c4b521-7fa8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 10:06:10 +0100 (CET)
Received: from DB8P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::23)
 by GV1PR08MB7873.eurprd08.prod.outlook.com (2603:10a6:150:5c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 09:06:04 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::ba) by DB8P191CA0013.outlook.office365.com
 (2603:10a6:10:130::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21 via Frontend
 Transport; Fri, 10 Nov 2023 09:06:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 09:06:04 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Fri, 10 Nov 2023 09:06:04 +0000
Received: from 397f7efb002d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7766C469-3FBF-448F-A2F8-052E38DC958A.1; 
 Fri, 10 Nov 2023 09:05:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 397f7efb002d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Nov 2023 09:05:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB7528.eurprd08.prod.outlook.com (2603:10a6:102:24e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Fri, 10 Nov
 2023 09:05:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f6b:d51:7aa3:ad16]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f6b:d51:7aa3:ad16%6]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 09:05:54 +0000
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
X-Inumbo-ID: 63c4b521-7fa8-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FmqkU4y0EaXRz6K9LtK+eqZB5V0jQdYCrEBgM8H7UjbAwvhKCTH0cKgUfDMye9jqp/YIwObXGIGuABA1YTnNgIpBM3zy7IK6s4UhtEesaoXOUl9O/iBirf/4lTX4astJKI0Wh+KNL24nA9f8pnraULdaz+L2JvJnvsADdMmpOoCYE+iTP47Kb/ss8N/8FeS3gDM8wso4FQVQnZA7KtedjsdDDxUqaK7Yl6uuWKVdPbZlfU9UWyzRtC3qWDpW23f6WGHHEjxRN1gWhC46iMaNIoLNU/xAVGid7nIediWlNBSSAwvzgy1Wp6S9VOAesFGMo8lSV9J3bMLnFyDJvgaN3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KwrrXqSUCORrwez7T+hnBNJJy8Eq5YVwcKK7KyiIQ4=;
 b=G9i7ssttYwzwgxj/LecHxuoEMCVyirgkRCzbcSp2ljS74qzzxvT+LrBQu3S1poecwXF51k2jFgGoynF1rZtgUAPikP58Vk1BQrusZQRncu3SA5+/SAYSan1ebEiJV/p67ewVB2HMoStkYvtYejPpKL6JhErFroLhZ5aeL1PcqFpumOXEJpi/QqFEhmQOh6ym81+UzicyUeLnwPv9H7SuiajbByTEPEI1bbcKlr1mK0mLcBNmLQd3ZBUi81RB8HQjHO/2VxpufgM1aI+/gsZLEQEGZ5y6AIJsl5LuyLAoXzS5VDyJl+GaQ+Ih/2XiOZ4MtGuxwowAbCmKwwd1m+3b4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KwrrXqSUCORrwez7T+hnBNJJy8Eq5YVwcKK7KyiIQ4=;
 b=FiNaYY2v/Fs8mcDkC0J2YTcNHXim2kv21IiD1epYOZSVADBz+Uss3m6khq2Yz/d85lVVbTF2HtOx5cAhQcrXGiu4+PrZv+uqBjJHY8jInxRjXYueJ+E2fU/K+iVC1VxhneZzFSPYMD8asPEXzlrT0gFOJJxZqs3VT8hwZuoiC2Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a63a391da8aff7e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZzhELc5xnohFXRj8pPag1b1SqVf03LdxD7smsl0Z9jwiqmmW3x5eD448lpERCRDZSKXT5VE8IOSANuT939fz77AGhxzpJnRq8nSuEpnsiaajZdOjh8pypWgfTQElCXOrpkw79ua7MmK7EOoxLkySERY0m/P5vFXMOYJdmqCy5yGLdN5595JZFx3eWXufKTsp18RS+OxyHvfL4ANutn+bD7913eXA7Bv5tYGEeb4fErCN6gQi19aqBkKS8Jq1oWy/DQ0pySOPssdwSJ4kLymwK2owiTMj2bOOSN9EW2+Hr2xpaL9xs86KuVnDVtZOEC/BUyHTrEdi5A/425iL7fGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KwrrXqSUCORrwez7T+hnBNJJy8Eq5YVwcKK7KyiIQ4=;
 b=EYd4yelbdQu40lsUdIfodvn6Lb19oczTyr50AaAVypr0QVSQo2m8NhjQiXMaeQMNVZV9W22lVvb2ZjKAXNRNHOm6b5F7/jiuM7WkZFEmHt3IFXjphMXMlsUIfoAqoMrzWr2rrNFWq2z8M0NFYaFFe42xVBuQjjIpZt+m1cuvRn+dchBDFFfHirLNnSp0jb5Q1F0ezza+cnDI6CXfinJDaBNkURYnESZ8Yghv9X733s7achhyADCM3jVlxksD/KY8h00AGacSJb8r2aNK8qGpYsAcD9Rd+QP/B8yo9jY1xDnI2F1Nnk6zm3oAzQyg7lABij1XhOTU2ah5vLQ0BzOPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KwrrXqSUCORrwez7T+hnBNJJy8Eq5YVwcKK7KyiIQ4=;
 b=FiNaYY2v/Fs8mcDkC0J2YTcNHXim2kv21IiD1epYOZSVADBz+Uss3m6khq2Yz/d85lVVbTF2HtOx5cAhQcrXGiu4+PrZv+uqBjJHY8jInxRjXYueJ+E2fU/K+iVC1VxhneZzFSPYMD8asPEXzlrT0gFOJJxZqs3VT8hwZuoiC2Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Thread-Topic: [PATCH v3 5/5] arm/dom0less: introduce Kconfig for dom0less
 feature
Thread-Index: AQHaEuwVAcRvSKcty0WG4JBMWUF0b7BzQ0WAgAABDgA=
Date: Fri, 10 Nov 2023 09:05:54 +0000
Message-ID: <9FE35A69-2EEF-4098-8F9E-B373D813AB47@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-6-luca.fancellu@arm.com>
 <43a1c5c8-6243-4912-bf3f-f3e35b504271@amd.com>
In-Reply-To: <43a1c5c8-6243-4912-bf3f-f3e35b504271@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB7528:EE_|DB5PEPF00014B95:EE_|GV1PR08MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfb98f9-fcdb-43fd-d2a6-08dbe1cc447e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PhIBuUrsZMP8dWoeuU5Z0WOBzIEAFtQv97QTSuWY9uu3Uve+pd9hi61R3AjVsO/6ku3Z0ZAF+MfGPwEGMJqCbyg5qfgi70BS8ia1JogfK2jGdU5bY/tYeT8EmEin6Zd6W7XPTolYow6JLkVXdvfVo2jed4VQM1jbr150DtC9g7ObT9vegM8cqI/9R1XyRLOQqsunxQ1ytMJRE9Kd5+pBB4dg7Nq2yOTQ6+qRZqU0Xl+r7bZRnd291HYlsia6nFKaZPdfXqcsHs4r28SCOaKThdPKDF5eDnM2N6KZI//JeCh0o0gh26+gDLCswKA1yEi/fF+OvJGMh3SwHi71CvtnX+mSZUSBcWlS+ezC5Cq+jPLC+kQ++T4sP6SU2MYbtlfRubGxclGDLEdiA17DFIvUpDQ3w+QMKmit0BNcO8iH0jz+wJGKFKC7QpUaBgL7ivUeuPI1WKWl5kgeZJRVQ6Mme60MIn7LsNL5IqiGjGz4cFK5CjebQ5aZ6vP3SktGYnktObNHde+TAzhw6ouUNWyCwf60TcOxfd4A1+ykmztNMXK/mfXCCmxIWeRltuAIkrsb76S2JZ2V8H30FXOScdz27xX5VYTq7L/cBLh9Fh849UDuK7q0aR5sFqcK6/TkdVI7DM3I9mIg7E/th7isCRKO/kSQg0uE3dCPOgtB/DmX/oE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(6512007)(122000001)(2616005)(86362001)(71200400001)(36756003)(91956017)(76116006)(6916009)(4326008)(54906003)(33656002)(66476007)(8936002)(8676002)(66556008)(6506007)(316002)(66946007)(66446008)(64756008)(38070700009)(6486002)(5660300002)(478600001)(2906002)(41300700001)(4744005)(38100700002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E01D136B72B07419472F9B9DC1CD27B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7528
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba32fdab-606d-4032-3154-08dbe1cc3eb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qjMYJacQ0IRIOV/VMCcIsvZX/wFSB5iczIcCKWj3GmQ4ZqwYTegePmI7lfsgoJ8NW58vMbcQmSIRCfeJWEKBXMyg95SUC8mwn7SJD1P+qxLwIV/fi2RdlEtaiIiHAkZ8McflGC9CV/9/zw2u72FVzKb67uuQrMk/5vEQnyaVhTl3+LcPWqmAIhw7kS79ab2Gd4sIk8DiBHvy80i1TRuF8mjs8YeZnxwrwoeT0zqeHKqAsJ8D/NIgr/D3NSe/iScI63gIRtDfcEh3QPDuCreZ/OeNHfJ/GWUJgpdi+Q4PUeTr67N+xeB00FQfKFl03oMbC6BVOgY5TyoUhXpeGYEl+pB4/L0eBASSDpRYK70DDMRqqaPnKvcQrfvdzMToqAV0CNKWYJJAo3Fk0HhbIdwrQNTLOEZMDl+e7BCo6l64Ou5Ee1j9ASMD55jTMo76K72EV/WEiHdRMvSpMDiQq2zuUYtQ2RqhX3S7heIldDd6bxdzeW6R9P0viF3XMcjIbK8kF2zU0Ol/YoTM65uLYT9fxYRCIf0hsgzIh/dPAgCCE7HCjkgdwi38JsjfUAdaFndkKj6dnnDQuwtDS/Vx/nfo2RBpAomjQsHFEKHzUqrJiYl/stdjHaCcAOYlHx+DBHT5RNZvdhyEiouM3kgieWUFmkmSfh05bVOBFS7fRZZ5iC7Im+YVbpbyx4X7iW1DPAnEtGuD25e70/4/8EznjFguFTjuqw+epZmhgVu4Ehy/gHqL9thtiwLDcS+od/OyCTWuP2z3Tx18z+SppRK7qa9rmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(356005)(36860700001)(6506007)(81166007)(47076005)(40480700001)(336012)(6512007)(107886003)(2616005)(82740400003)(41300700001)(33656002)(4744005)(6862004)(86362001)(8676002)(36756003)(4326008)(2906002)(5660300002)(54906003)(316002)(70586007)(70206006)(8936002)(26005)(40460700003)(478600001)(6486002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 09:06:04.1797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfb98f9-fcdb-43fd-d2a6-08dbe1cc447e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7873

SGkgTWljaGFsLA0KDQo+PiANCj4+ICtjb25maWcgRE9NMExFU1NfQk9PVA0KPj4gKyAgICAgICBi
b29sICJEb20wbGVzcyBib290IHN1cHBvcnQiIGlmIEVYUEVSVA0KPj4gKyAgICAgICBkZXBlbmRz
IG9uIEFSTQ0KPiBZb3UncmUgaW4gdGhlIEFybSBLY29uZmlnLCBzbyB0aGVyZSBzaG91bGQgYmUg
bm8gbmVlZCBmb3IgdGhpcyBkZXBlbmRlbmN5IChpdCBpcyBpbXBsaWNpdCkuDQo+IA0KPiBBcGFy
dCBmcm9tIHRoYXQsIHdlIGhhdmUgMiBmZWF0dXJlczogc3RhdGljIG1lbSBhbmQgc3RhdGljIHNo
bWVtIHRoYXQgYXJlIG9ubHkgbWVhbnQgZm9yIGRvbTBsZXNzIGRvbVVzLg0KPiBTaG91bGRuJ3Qg
d2UgbWFrZSB0aGVtIGRlcGVuZGVudCBvbiBET00wTEVTU19CT09UPyBPdGhlcndpc2UsIHdoYXQg
aXMgdGhlIHB1cnBvc2Ugb2Ygc2VsZWN0aW5nIHRoZW0NCj4gd2l0aCBET00wTEVTU19CT09UPW4/
DQoNClN1cmUsIEnigJlsbCBhZGQgdGhlIGRlcGVuZGVuY2llcyBhbmQgcmVtb3ZlIHRoZSBBUk0g
b25lDQoNCj4gDQo+IH5NaWNoYWwNCg0K

