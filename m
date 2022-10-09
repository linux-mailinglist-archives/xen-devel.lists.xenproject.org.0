Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5353C5F8A00
	for <lists+xen-devel@lfdr.de>; Sun,  9 Oct 2022 09:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418899.663616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohQgo-00073D-5l; Sun, 09 Oct 2022 07:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418899.663616; Sun, 09 Oct 2022 07:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohQgo-000705-2P; Sun, 09 Oct 2022 07:25:34 +0000
Received: by outflank-mailman (input) for mailman id 418899;
 Sun, 09 Oct 2022 07:25:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWcR=2K=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ohQgl-0006zx-MY
 for xen-devel@lists.xenproject.org; Sun, 09 Oct 2022 07:25:32 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50060.outbound.protection.outlook.com [40.107.5.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c03bd00-47a3-11ed-9377-c1cf23e5d27e;
 Sun, 09 Oct 2022 09:25:27 +0200 (CEST)
Received: from DB8P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::31)
 by DU0PR08MB9323.eurprd08.prod.outlook.com (2603:10a6:10:41e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sun, 9 Oct
 2022 07:25:24 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::7) by DB8P191CA0021.outlook.office365.com
 (2603:10a6:10:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Sun, 9 Oct 2022 07:25:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Sun, 9 Oct 2022 07:25:24 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Sun, 09 Oct 2022 07:25:24 +0000
Received: from 634525224f6b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2081EC75-5BBB-44E8-BC07-46825C757132.1; 
 Sun, 09 Oct 2022 07:25:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 634525224f6b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 09 Oct 2022 07:25:18 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU0PR08MB9680.eurprd08.prod.outlook.com (2603:10a6:10:444::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 07:25:14 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%4]) with mapi id 15.20.5676.028; Sun, 9 Oct 2022
 07:25:14 +0000
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
X-Inumbo-ID: 8c03bd00-47a3-11ed-9377-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TRQXSXuShkTTpttDVFogQldPI2yKzgg16DGAe+2EDe5UetiDgkoGRaPBa6Wqye/Xnd76aWLD2H+1KpNF2T6XPYCWGqlpABw3Voe7SOCADSz25+RSQy68XaK5OvA+G1mypUueaNLyXm18YtbMV+I1QCATCJqD6tHuv+uLky+on/tE6iWNXfJCNvcuMy0WiUIR46v3zovvzGlDOEKqSa58sxVLXz7MKXIKK+1dG5txgv8ZjyNAZen6P4weoPYsNCos12+ZxjadzaTcJKCKqnXTnSIixNgxE5fcdXAOLGlfnEYsD67UwS3WnrTIppr4yPwZmg+7IZJiInuXjaFcQ8HSow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RmasekNwVZi3GCrRiO0Y6AzzYy2ZSdK+KPVikoIS2I=;
 b=U7XXoJBx9Q77mm/Ku3sGwALbOqiRxvg7qT4mGRjxJl1R+zZMzBSt5sGmD8egIM9avUdcH9vevTghDLW2MN8azQbtjQt6BgMtgJ+23ebOVXOSjp/CktHozLuTLmGzDYMGBSGIkbzQR8FxewEdFD8fPiMrrt9aJhaFq6LAFJ7XYq1rXDvcFjE9EhvFKt6rEFCf+9Ij+p+jAxS38DcRPFtTqyg/BH46s2whcI3tUpFPXLUei1mXejuSVGl4roozH6rOZpFzSR36WldXsVn6W2cvVPid5JJmGEIDiYcu4MpJyj2oVZ9MkZ/t2HyktVBFE/+xojise0zLC0341oRrhRBq9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RmasekNwVZi3GCrRiO0Y6AzzYy2ZSdK+KPVikoIS2I=;
 b=4MIqF38b6aHYmST2ZndjMqJ+kGMXxkRJhRopYDqJPIgvwM+XwnlEyvp9753VYwYVfJX9ToTTHmVJwo3bj6twRj13qhVuTavpHTclv3Z8xGEyqQBt83pvXbcG9mX++TP9bKLDvfYkOEn/mHJL7/HXLVga3pXlRJgkJ2559w7WNTg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TITeQl0G8RYlii/zj2Svt5DvV0W4rT6wSbBiZAsEHXUaFFUvCbrj1hjNRbF7VG2BjvEJSg7D2mPSkc6DEDwkLACoTGjhsiwCzZg8ODmwszUjC0fE6T90EKJFt79AMM6Y7zG0kUxAx0hjZQLLDS0FBprDmk6fgNuK52hFUUg3OGN2tU/8sLAnFjXIbcC6fJX8HwHIbWrjgpIQHGatWEQnlANdowgZmioZ1m8ZgRjtNdoRwT3C5SiXQcQ3y8/vFTRTISSCkEaoj9doVlVoTvcqcRe3twYbmUoSdz9HcolyGb/L+i2i/IrlisL/V/XFQeYaiO8jQ3PHjhwuL2zA70GG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RmasekNwVZi3GCrRiO0Y6AzzYy2ZSdK+KPVikoIS2I=;
 b=NVPZwTCDEkxlad4YkgUUHlFUkCp89amDuKBZs94UTvCgZ+3WtIXV4EI5aHT8xI6bsOsxE9fofAmxKehoL8taYecBF110NODNXnCnv391uglIQ8/Ie16kLNhnDhVozycB+A10CGOwRlJHEVh38E8XF9ojB1Mh8qMiK3IGVcWbyALYUNx9siLqHZTrrR02aMQw8PUlDTHH5aY6haqSFklgOSNACtktjK3juJpJDRD5AvZ/UQxvFD41fbDszAMrh5UEIK9hYFlZz/NaLt+x1D5JXAuta2DNAWsRQrMvRE0CJ9LIMgUiECfMkAtqoqyBKyjLEam2i/qcQmrVmGCfP03JsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RmasekNwVZi3GCrRiO0Y6AzzYy2ZSdK+KPVikoIS2I=;
 b=4MIqF38b6aHYmST2ZndjMqJ+kGMXxkRJhRopYDqJPIgvwM+XwnlEyvp9753VYwYVfJX9ToTTHmVJwo3bj6twRj13qhVuTavpHTclv3Z8xGEyqQBt83pvXbcG9mX++TP9bKLDvfYkOEn/mHJL7/HXLVga3pXlRJgkJ2559w7WNTg=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Topic: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Index:
 AQHYzNExhaWvtVxVf06aoC2sQxI0u63zd60AgAKngwCAAEMigIAA3nNwgABKNYCADjuwgA==
Date: Sun, 9 Oct 2022 07:25:14 +0000
Message-ID:
 <PAXPR08MB7420DE5F342F17E77F5483879E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-6-wei.chen@arm.com>
 <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
 <fc03f565-8c05-e310-fa0a-698ad7c569e3@arm.com>
 <47ec8e01-8ea6-4678-78c2-c67305fe3b7a@suse.com>
 <PAXPR08MB742077FE40B3FB0614787B599E569@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <9c32c4a9-d319-8886-c026-f33820a4f77b@suse.com>
In-Reply-To: <9c32c4a9-d319-8886-c026-f33820a4f77b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B59D858B5E2C6A48B24AD788ED6A7FF4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DU0PR08MB9680:EE_|DBAEUR03FT022:EE_|DU0PR08MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8747d7-a171-4d1a-9124-08daa9c76e6c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +Dbo+CRNI3Xd7I5Ndjq+V8Bx906o4qIo7AA/T1oSimHzXRakQYOsdnVvo/uyyrpuVvuk7qApsNYXMICl1awe11I1+ubVNMwtoi6rLQDHwRwYgSfOBIZgtc5WuE3HjOxGerR+YwKZFkkG/3xfgesxGLjiirLO9Z7+I/+n5Rvp3Cv+nsFTNGXywAicfrmnVMv7MdxIGZgrBvOftS0DJf/zkjkr3E7CAvdOvX0fSM9w09/9IFj3R6xUptsYbHz2OdEMJs0qgn/3tglDY8TQ9QRjQ7Gk2H2EqsDgx1T978G/KKmv0ke2Jbl/rBQLuYU6+Lrwun9taEj3Ss3TTtsc7MTxOFXGXKgih1Oo4xkjGr6AFAtuiGRPYuPQLU9fLF9wXVFxiCuzAX4so7tFpkhFNMvYU4L/SC/x4SHM653liiK06C1EcUgII92eGpF0RmJlax9Okf25FSiG9nTuhtCsVD7Xo+0N0ZAHVbE1km7LNDbOfkKKqTL+hMqL3h5+d6QkerNwFE8FtyZzjXh58ouhJuh5ZroL4MwzFUcQ2/G3CHpOC7XQbtPdUXCDNkERSLhtthk/ecIN/GVdbJevr+lyJkVzLvUBGkPHHCqaAfZTUGKQUrev72W44Qc1ckvnWCweIc3KnCdyb+8Av8pFvpwIv4OHfxyFhLwOdaWoOtsDDixVJQGCzF6hR/LGRtIdC3uLQ9V+mvnOU66ASFDw+7S5jxSQsHMfgi8VGzudaTRsQt/B3LG7+2LakyBnlL9WO7rIK7ogEAwWUUCwlRfqWiVp0ypTyg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199015)(38100700002)(55016003)(86362001)(64756008)(66556008)(8676002)(4326008)(66476007)(54906003)(6916009)(38070700005)(76116006)(5660300002)(41300700001)(83380400001)(53546011)(8936002)(478600001)(26005)(186003)(52536014)(2906002)(9686003)(71200400001)(33656002)(6506007)(7696005)(122000001)(66446008)(316002)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9680
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea2f5ec8-373d-4ecf-3928-08daa9c768d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xPlf2ani9+lmsfFx/tGPGQoN2rnVW3VKao4sxOfUaEl3153zmWxNR4PqA9aS87DMTfGVY/veDfgHr4zwa743Gxwvz7DVNuyUe65ZGsg/vylNPpJVLuL2gKPaWl0AQjH+ZPVs5XgrSCRDSEOrjXHiWW7dhf85XIlpEM7pqaRXkmL0SSsckvl5j0osZ7Md/6qPMwn7kg67U7ZTuoGUv9dvIzVJZezSkUr/cJQM21eGDVwqIhoUPJusJYUfQy+i2DdKYt+pkodDOeQvpJLoczIuyam3mA1ot/HuUp2GbBdQzAvc8UaUe445Gn7+PWN5A0UoVr7HRBCFbKg0Di3PQBoFNHq741gZ4S1eAcgcYA+yp3I9kdQpHPJkH76b0lY37MMOHYcKSazFIjnKei6WTrKCZLc6xtV9Hfms0ACf/zPB79I8mmJyU8qzZ5NmEerOIsuDNKelM7aDXrgj6CYl1EIm7ax0DRLL7LoyRVLrfC8JLQZ9pn9tmRVcuN3Y3JxpzFxdNJZZ3V24Vzn9ctAh/K/bcuBYOfZtHZe1KVNkZZLd8jzBStxj+dyzWVdSoOEUZakW2Iq7AWNqXgi4ayV0PAFVxTfxGT7a7yj/4+7buIEsbSlsLXdy9fJb3+GKy8H80ltLKSm233sEKOaurMfsoVV+Zqkk+zNXZsR5EtjXezA20H06Cb3F/9q9RPUytdWFHhPUSfazsTAks6MdWu+tePd8ZhkVZ1CVaPQ1/IA3yoLPdzhApK+B224rNDzmivmJjq6/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(36840700001)(46966006)(356005)(81166007)(5660300002)(82310400005)(478600001)(33656002)(54906003)(2906002)(316002)(7696005)(6506007)(36860700001)(55016003)(86362001)(40480700001)(70586007)(186003)(4326008)(70206006)(336012)(6862004)(82740400003)(9686003)(8676002)(52536014)(41300700001)(8936002)(83380400001)(26005)(53546011)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 07:25:24.2541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8747d7-a171-4d1a-9124-08daa9c76e6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9323

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDnmnIgzMOaXpSAxNDowMw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgNS82XSB4ZW4veDg2OiBtb3ZlIE5VTUEgc2NhbiBub2RlcyBjb2RlcyBmcm9tIHg4Ng0K
PiB0byBjb21tb24NCj4gDQo+IE9uIDMwLjA5LjIwMjIgMDM6NDAsIFdlaSBDaGVuIHdyb3RlOg0K
PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IDIwMjLlubQ55pyIMjnml6UgMjA6MjENCj4g
Pj4NCj4gPj4gT24gMjkuMDkuMjAyMiAxMDoyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBPbiAy
MDIyLzkvMjcgMjM6NDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+IE9uIDIwLjA5LjIwMjIg
MTE6MTIsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy9hY3BpL0tj
b25maWcNCj4gPj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvYWNwaS9LY29uZmlnDQo+ID4+Pj4+IEBA
IC03LDQgKzcsNSBAQCBjb25maWcgQUNQSV9MRUdBQ1lfVEFCTEVTX0xPT0tVUA0KPiA+Pj4+Pg0K
PiA+Pj4+PiAgIGNvbmZpZyBBQ1BJX05VTUENCj4gPj4+Pj4gICAJYm9vbA0KPiA+Pj4+PiArCXNl
bGVjdCBIQVNfTlVNQV9OT0RFX0ZXSUQNCj4gPj4+Pj4gICAJc2VsZWN0IE5VTUENCj4gPj4+Pg0K
PiA+Pj4+IFdoaWxlIEkgbWlnaHQgZ3Vlc3MgdGhhdCB5b3UndmUgY2hvc2VuIHRoZSBpbnNlcnRp
b24gcG9pbnQgdG8gaGF2ZQ0KPiA+Pj4+IHRoaW5ncyBzb3J0ZWQgYWxwaGFiZXRpY2FsbHksIEkg
dGhpbmsgaGVyZSBpdCB3b3VsZCBiZSBtb3JlIG5hdHVyYWwNCj4gPj4+PiB0byBzZWxlY3QgdGhl
IHdpZGVyIG9wdGlvbiBmaXJzdCBhbmQgdGhlbiBhbHNvIHNlbGVjdCB0aGUgbW9yZQ0KPiA+Pj4+
IG5hcnJvdyBvbmUuDQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBPaywgSSB3aWxsIGFkanVzdCB0aGUg
b3JkZXIuDQo+ID4+Pg0KPiA+Pj4+IE9uZSBmdXJ0aGVyIHF1ZXN0aW9uIHRob3VnaDogSG93IGlz
IHRoaXMgZ29pbmcgdG8gd29yayBmb3IgQXJtNjQNCj4gPj4+PiBvbmNlIGl0IHdhbnRzIHRvIHN1
cHBvcnQgYm90aCB0aGUgZm9ybSBvZiBOVU1BIHlvdSdyZSB3b3JraW5nIHRvDQo+ID4+Pj4gZW5h
YmxlIF9hbmRfIEFDUEktYmFzZWQgTlVNQT8gVGhlcmUgYmV0dGVyIHdvdWxkbid0IGJlIGEgcmVx
dWlyZW1lbnQNCj4gPj4+PiB0byBwaWNrIG9uZSBvZiB0aGUgdHdvIGF0IGJ1aWxkIHRpbWUgLSBp
dCB3b3VsZCBiZSBuaWNlIGZvciBzdXBwb3J0DQo+ID4+Pj4gb2YgYm90aCBmb3JtcyB0byBiZSBh
YmxlIHRvIGNvLWV4aXN0IGluIGEgc2luZ2xlIGJpbmFyeS4NCj4gPj4+DQo+ID4+PiBXZSBhcmUg
YWxzbyB3b3JraW5nIGluIHRoaXMgd2F5LiBJbiBwYXJ0IzMsIHdlIHdpbGwgY2hlY2sgQUNQSSBm
aXJzdCwNCj4gPj4+IG9ubHkgd2hlbiBBQ1BJIGlzIG9mZiwgdGhlIERUIE5VTUEgd2lsbCBiZSB1
c2VkIGJ5IEFybS4gSWYgQUNQSSBpcyBvbiwNCj4gPj4+IHdlIHdpbGwgc2tpcCBEVCBOVU1BLg0K
PiA+Pg0KPiA+PiBFdmVuIG1vcmUgc28gYW4gYW5zd2VyIHRvIG15IHF1ZXN0aW9uIHdvdWxkIGJl
IG5pY2U6IFlvdSdsbCB0aGVuIGhhdmUNCj4gPj4gQ09ORklHX0hBU19OVU1BX05PREVfRldJRD15
IGV2ZW4gb24gQXJtICh1c2luZyBQWE0gYXMgbWFuZGF0ZWQgYnkgQUNQSQ0KPiA+PiB3aGVuIGlu
IEFDUEkgbW9kZSkuIEJ1dCB0aGVuIHdoYXQncyB0aGUgRldJRCBmb3IgRFQ/IEkga25vdyBpdCB3
YXMgbWUNCj4gPj4gdG8gc3VnZ2VzdCB0aGlzIGJ1aWxkIHRpbWUgZGlzdGluY3Rpb24sIGJ1dCBJ
J20gYWZyYWlkIEkgd2Fzbid0IGRvaW5nDQo+ID4+IG11Y2ggZ29vZCB3aXRoIHRoYXQgKGFuZCBJ
J20gc29ycnkpLg0KPiA+DQo+ID4gSG93IGFib3V0IGludHJvZHVjaW5nIGEgZmxhZyBmb3Igc2Vs
ZWN0ZWQgTlVNQSBpbXBsZW1lbnRhdGlvbiB0bw0KPiA+IHNldCBpdCBpbiBydW50aW1lPw0KPiA+
IEZvciBleGFtcGxlOg0KPiA+IGJvb2wgbnVtYV9oYXNfZndfbm9kZWlkOw0KPiA+DQo+ID4gQUNQ
SSBOVU1BIHdpbGwgc2V0IHRoaXMgZmxhZyB0byAxLCBidXQgMCBmb3IgRFQgTlVNQS4NCj4gDQo+
IFRoYXQncyBhbiBvcHRpb24gYWxvbmdzaWRlIGdvaW5nIGJhY2sgdG8gd2hhdCB5b3UgaGFkIGlu
IGFuIGVhcmxpZXINCj4gdmVyc2lvbi4gQW5vdGhlciB3b3VsZCBiZSAobmFtZSBzdWJqZWN0IHRv
IGltcHJvdmVtZW50KQ0KPiANCj4gY29uc3QgY2hhciAqX19yb19hZnRlcl9pbml0IG51bWFfZndf
bmlkX25hbWU7DQo+IA0KPiB3aGljaCBmb3IgQUNQSSB3b3VsZCBiZSBzZXQgdG8gIlBYTSIgKGVs
aW1pbmF0aW5nIHRoZSBuZWVkIHRvIHBhc3MNCj4gaXQgdG8gY2VydGFpbiBmdW5jdGlvbnMsIGFs
YmVpdCB0aGUgZndfbmlkIHdpbGwgY29udGludWUgdG8gbmVlZCB0bw0KPiBiZSBwYXNzZWQgYW55
d2F5KS4gSSBndWVzcyBJJ20gbm90IHJlYWxseSBjZXJ0YWluIHdoaWNoIG9mIHRoaXMgYW5kDQo+
IHlvdXIgZWFybGllciBhcHByb2FjaCBJIHByZWZlcjsgdGhlIGJvb2xlYW4geW91IHN1Z2dlc3Qg
YWJvdmUgbG9va3MNCj4gbGVzcyBkZXNpcmFibGUgdG8gbWUsIHRob3VnaC4NCj4gDQoNCk9rLCBJ
IHdpbGwgZm9sbG93IHlvdXIgc3VnZ2VzdGlvbi4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiBK
YW4NCg==

