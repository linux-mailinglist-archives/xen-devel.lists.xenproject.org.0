Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF27F33CB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:32:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638037.994274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Tfb-0004mb-6y; Tue, 21 Nov 2023 16:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638037.994274; Tue, 21 Nov 2023 16:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Tfb-0004kP-2X; Tue, 21 Nov 2023 16:32:15 +0000
Received: by outflank-mailman (input) for mailman id 638037;
 Tue, 21 Nov 2023 16:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+4w=HC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r5TfZ-0004jn-R6
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:32:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85f5854f-888b-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:32:12 +0100 (CET)
Received: from AS9PR06CA0223.eurprd06.prod.outlook.com (2603:10a6:20b:45e::11)
 by DU0PR08MB8905.eurprd08.prod.outlook.com (2603:10a6:10:47d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 16:32:05 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:45e:cafe::5) by AS9PR06CA0223.outlook.office365.com
 (2603:10a6:20b:45e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Tue, 21 Nov 2023 16:32:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.13 via Frontend Transport; Tue, 21 Nov 2023 16:32:04 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Tue, 21 Nov 2023 16:32:04 +0000
Received: from 7849e32de779.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 493ED6EA-41FF-4EF1-83C3-7BB7DE827214.1; 
 Tue, 21 Nov 2023 16:31:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7849e32de779.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Nov 2023 16:31:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB9661.eurprd08.prod.outlook.com (2603:10a6:102:2ec::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 16:31:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%6]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 16:31:56 +0000
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
X-Inumbo-ID: 85f5854f-888b-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XkrdOo1bRgEeOp6nTbevT2sI3mJIuPYkZxHX+FGh/443j1FN3uKcQKbcgK0vddf9FButd9lWzle/p9q14bNCeK5D5oe3y0fDSa/r9fy+0NvGhQDyNwoZszzkA9mxQ/OPWAGyB65VigfAN927Z4f4zWmwm2x8374Hn+6Kw17npaN1VK0kcKlB9S43I3Aeje1cXV5yoli6Ktc3P7SYTGclJ8furWC4BbZid48tjFgjcaZ/WO/l7zlOxAWUjJGIb7Z+wUmRz2RcVvE4E40l1lGWZ3w+ZErJg7q8p0McPfYx5n8tjlzmb94MRTg/NS5iiOhTAlJrYkQUV1MVQopZUuQotw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHPfD/1DF3FkTM9MqpRrTxtfkT7bLAM9o/SymS0IXEw=;
 b=J4ffzWddGN0Qt3VDWIc/13Atl+sThAooWtdICOp8iutsra9VFajaaKj8Pf1fy9BVhi8r3YxDk3Cd3mWjfBYGOx40ZKJ4wHu9/1cA55c5y7K0IM+1hcFtm1GwJG0TeYk0U/8ZZ2Mqwa5nSRF9HExFyJB/Iqpl/XDxdw/Gw3WQLk/zFrURnInaVVce5aBVxMGhocaZRX0LmsUojYynfX5vE0CfSte2VRQ1RJo0HL1YaIzk5HZ3Rqf9loyyuPeLr8VS7A3SbebPh3zKvd3BDfMTMojDAXCneFPtIv2P0zzKwXlpwDXox9O27MRNRuXpSedewRhCH+XRMh+XsjWVDjQOMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHPfD/1DF3FkTM9MqpRrTxtfkT7bLAM9o/SymS0IXEw=;
 b=EDUNAUHMhiwqopgvcoEp3qt0tAn/tarR824eyDeFvyuJ0rIcZBrlRyNusr0cLdoEP2rNHc5CNjHodNHM+CZ8yJCi0IN0AbLPxLT6FokgYrn44/sW9t1GBgqKZfIirK11lMBOIDczPSkz4HEwLGO8gJkCcM9AtRhdQyJH/2Pdxeg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65328c179dbd240f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWXRm4dcvaELyjZxqcGimldyhFWga8IagQC/UYYkJqArq1LyNXORi0Kz8b6FiTSXJpZqngmN7a/YdC8MKZGbyd6sMA0Yf/S8kaZZK5KfJC0sOF9SmjOJjeJdu3O+fs1uvBZ5mIPAtw7HCOlqmHWCl6TUmjKYXy6SVt7eXrm5auPyb9OKtuDQZtZfn43fitLNkspeLI7uRb2k5wfOHveMy7xLtW5ehhsomOVnQE1agEo14y/L+1xewiVtTdU+JcBjGR2Ieow3Vb1sps9pcyiS1WRtTO8dyNX8fCnv4AkGX1ZPxMyYdOw3cH00kP9EA9B7ziQOB1ga3QbSqaKy2Rd0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHPfD/1DF3FkTM9MqpRrTxtfkT7bLAM9o/SymS0IXEw=;
 b=B5jkYZoPHWVUIgF1D160jaG/R2BWwxOYko6Avf50aL9ziavdXTam7+r+0yEVMdQE+PIu5tshUyjWSG7DGHzQLBXjHiKE/bDv+5mLPkapMjGt5WTPqFhvd4n0NoJSFG7LkC6V28dv//tuQC+EShls2lTBVthF+mz++ms9XcgArAJI9Ku3r974EZGh67kvOtysbKNjS30EVctiUKQ7vq55FFBDzQk6QuB/pP9wkwwSulIYNfV+MLEwhEAC2OOlzMJKkr9o9weMwVyCWm07SWfajOTajIRwaDrZ0CEJsmpQAYz/lU/h4PtZOVofGqgBKs1sLG387AwMFnWk4hnLT6jNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHPfD/1DF3FkTM9MqpRrTxtfkT7bLAM9o/SymS0IXEw=;
 b=EDUNAUHMhiwqopgvcoEp3qt0tAn/tarR824eyDeFvyuJ0rIcZBrlRyNusr0cLdoEP2rNHc5CNjHodNHM+CZ8yJCi0IN0AbLPxLT6FokgYrn44/sW9t1GBgqKZfIirK11lMBOIDczPSkz4HEwLGO8gJkCcM9AtRhdQyJH/2Pdxeg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm64/mmu: head: Replace load_paddr with adr_l
 where appropriate
Thread-Topic: [PATCH 3/3] xen/arm64/mmu: head: Replace load_paddr with adr_l
 where appropriate
Thread-Index: AQHaHF+NDAu4l/eqYUG7NR9h/u0zY7CE97AA
Date: Tue, 21 Nov 2023 16:31:56 +0000
Message-ID: <9DE3C0CF-4B31-477E-99AE-66798FF5554C@arm.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-4-michal.orzel@amd.com>
In-Reply-To: <20231121094516.24714-4-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB9661:EE_|AMS0EPF0000019E:EE_|DU0PR08MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 4207bca7-9bbd-4608-de51-08dbeaaf65b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2UBkX+VyK2LWsiV22WTU8CGMvUK4Gx0VH0n3xqjohddtOTeB3YUMH+dK6UInYcKlZuU2l8vvdybzRVOXRksxvMthSDTTZDNdMrSshLw8VZaxYsdWxsGFrBTlAAxA3DR5naKlfTAR9te3O0IvSWCv3LimXq7anVnwLFr3/wS4fm55Ma8eatjd4Y31mNIggnbedyfL91dO76CC+eshkLPPFPjKJUm3AI18K8kQtdYjFuNJTThBHb7o3L+kd4UvEeR4W/g6beovNslqTZRiHW7tZNEJrOpFgGWxebq5FMoZkmVQiniB8AxjNFXEsTiLd1S17aOHVaAlmIdRlKBwLlTduhXrbEm/Q35hnTPPX9j9q9AJY81XDMUFmbcADbXyAHYf2fsbNxkaGZ0ou1wzhg4dyW4OwZ6QK6NXzXGT3MDTRITs7TW1h02XBubl2xDPhUMMmlSc56NtkQuLVXEM6oDqrG6YbT2AH1nusUQOO2xRoPWnOpqfyibKUgbnZguvHb8JHBE1QMOiH2qv+5tCBO9W/v81g+HZtzneI2aHHgJNmzPtSW6/QWAVPWs8PT9wOnzcwg53evc6//tOhg1tXKNc9wXWN1Dr8HsN3Av6GmYe1CBzQmqtNUQydiDiCWZr+XmIgDSq3EHkwi40dr0HDzEYEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(4744005)(8676002)(4326008)(8936002)(41300700001)(6916009)(316002)(66476007)(66556008)(54906003)(64756008)(66446008)(76116006)(66946007)(91956017)(71200400001)(6486002)(6506007)(478600001)(53546011)(26005)(2616005)(6512007)(38100700002)(122000001)(38070700009)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A62A88AE55BEC4B9FD9474452FC022B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9661
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23e5742c-8b52-4e4a-2431-08dbeaaf60c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qBIVHqAAXpTHNDex+oA3BBbIUVWP+IsxrJ10lt41kT9uPZiutQUvdpLnScjEUpVDuBiv7uW9Uo3vY4E3PbfH5M04dtlbpPSiADIUNUBuK68CxIRrFd7aFW65kmCJDCSRVBPzpxjXuL2YCzBjgBl3j2aGeqz06u89GRugsKtJWheqt1HYcZmFxRrfQmexplBqm+n+lTKpnR0+Ve40RImCUxuwP2wvPEK7aC948DpjKdodoUqhz8RffFuJETs78BCjDuQVvGPBFF5GvivzXFAPPq1CdtUUmm9QdEhaQpQPjLsNA0lhFMBl8+64UilE8IbAA1U1qMLSAVqtqB+IzAUC356J2UCrCFTsMc0x9ICEixUXXwgQQbca+Y18MswaUmrPZVgt6OaxUN61cuaDvuF29NUw92ZO3ge1OMRbpj7xPqIICYYwV9j/TZpkSrpx8KDau81ZLwlmanMDBfx/nvMOkrt5SXhJLaF2PQuxys09Z3h1lKzYTpuPkP42Wt0QHtzGMwt5Br+HRG4YDMJ5wJ1XuCDYE28R/PbXm5lUBIBU7ZPtJGW06mIskqQDKtYzr7AWqMWc6co/yPRAyDReEvN1QDn56HPQI1ViVVOY6gCIIbmAdl0NNgkNHsPOFfrXuenPJf5e7Em3iaq/+xyZfTu8O24lE0ChJPp1yEGDTaO1q9up0GJqt9MJBK2hQMNJhX3VekSMxfiNX9lrjIx26h9bBmlBV5rxE1pHbYVaYpli4gzG+UVJePcVLdG7QWD98L8i
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(356005)(47076005)(6512007)(478600001)(6486002)(107886003)(2616005)(26005)(81166007)(70586007)(54906003)(53546011)(70206006)(316002)(6506007)(36860700001)(82740400003)(336012)(8936002)(4326008)(6862004)(8676002)(2906002)(40460700003)(33656002)(5660300002)(86362001)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 16:32:04.9001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4207bca7-9bbd-4608-de51-08dbeaaf65b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8905

DQoNCj4gT24gMjEgTm92IDIwMjMsIGF0IDA5OjQ1LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IE1hY3JvcyBsb2FkX3BhZGRyIGFuZCBhZHJfbCBhcmUg
ZXF1aXZhbGVudCB3aGVuIHVzZWQgYmVmb3JlIHRoZSBNTVUgaXMNCj4gZW5hYmxlZCwgcmVzdWx0
aW5nIGluIG9idGFpbmluZyBwaHlzaWNhbCBhZGRyZXNzIG9mIGEgc3ltYm9sLiBUaGUgZm9ybWVy
DQo+IHJlcXVpcmVzIHRvIGtub3cgdGhlIHBoeXNpY2FsIG9mZnNldCAoUEEgLSBWQSkgYW5kIGNh
biBiZSB1c2VkIGJvdGggYmVmb3JlDQo+IGFuZCBhZnRlciB0aGUgTU1VIGlzIGVuYWJsZWQuIElu
IHRoZSBzcGlyaXQgb2YgdXNpbmcgc29tZXRoaW5nIG9ubHkgd2hlbg0KPiB0cnVseSBuZWNlc3Nh
cnksIHJlcGxhY2UgYWxsIGluc3RhbmNlcyBvZiBsb2FkX3BhZGRyIHdpdGggYWRyX2wsIGV4Y2Vw
dA0KPiBpbiBjcmVhdGVfdGFibGVfZW50cnkgbWFjcm8uIEV2ZW4gdGhvdWdoIHRoZXJlIGlzIGN1
cnJlbnRseSBubyB1c2Ugb2YNCj4gbG9hZF9wYWRkciBhZnRlciBNTVUgaXMgZW5hYmxlZCwgdGhp
cyBtYWNybyB1c2VkIHRvIGJlIGNhbGwgaW4gc3VjaCBhDQo+IGNvbnRleHQgYW5kIHdlIGNhbid0
IHJ1bGUgb3V0IHRoYXQgaXQgd29uJ3QgaGFwcGVuIGFnYWluLg0KPiANCj4gVGhpcyB3YXksIHRo
ZSBsb2dpYyBiZWhpbmQgdXNpbmcgbG9hZF9wYWRkci9hZHJfbCBpcyBjb25zaXN0ZW50IGJldHdl
ZW4NCj4gYXJtMzIgYW5kIGFybTY0LCBtYWtpbmcgaXQgZWFzaWVyIGZvciBkZXZlbG9wZXJzIHRv
IGRldGVybWluZSB3aGljaCBvbmUNCj4gdG8gdXNlIGFuZCB3aGVuLg0KPiANCj4gVGFrZSB0aGUg
b3Bwb3J0dW5pdHkgdG8gZml4IGEgY29tbWVudCB3aXRoIGluY29ycmVjdCBmdW5jdGlvbiBuYW1l
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4NCj4gLS0tDQoNCkhpIE1pY2hhbCwNCg0KSeKAmXZlIGFsc28gdGVzdGVkIG9uIEZWUA0KDQpS
ZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KVGVzdGVk
LWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0KDQoNCg==

