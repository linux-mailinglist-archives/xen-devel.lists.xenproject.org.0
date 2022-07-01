Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333B56296E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 05:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358829.588199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o774a-0000cb-PF; Fri, 01 Jul 2022 03:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358829.588199; Fri, 01 Jul 2022 03:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o774a-0000ZU-LJ; Fri, 01 Jul 2022 03:12:00 +0000
Received: by outflank-mailman (input) for mailman id 358829;
 Fri, 01 Jul 2022 03:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pwB7=XG=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o774Y-0000ZO-GN
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 03:11:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9075eee1-f8eb-11ec-bdce-3d151da133c5;
 Fri, 01 Jul 2022 05:11:57 +0200 (CEST)
Received: from FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::16)
 by VI1PR08MB3965.eurprd08.prod.outlook.com (2603:10a6:803:dd::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 03:11:52 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::99) by FR0P281CA0131.outlook.office365.com
 (2603:10a6:d10:97::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.6 via Frontend
 Transport; Fri, 1 Jul 2022 03:11:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 03:11:51 +0000
Received: ("Tessian outbound d5fa056a5959:v121");
 Fri, 01 Jul 2022 03:11:51 +0000
Received: from 3aec3b52da63.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 45A2B899-C5EF-4F2F-9AF7-93D4D5077E82.1; 
 Fri, 01 Jul 2022 03:11:40 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3aec3b52da63.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Jul 2022 03:11:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB4225.eurprd08.prod.outlook.com (2603:10a6:208:137::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 03:11:37 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%7]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 03:11:36 +0000
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
X-Inumbo-ID: 9075eee1-f8eb-11ec-bdce-3d151da133c5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gprzJoxpl/0L21qcw/g6rVL3JFy7VkPtm+umOVAXybXe4xxmhqyyMB8a/xjfL0gCbDLFJJ8R0Ah/WJdd4dPVHSCspi8T1f2j1g7P9s9BGVHvECihCYSovUJXzK3gC3FE1JfxnyEfXiVvxVNTA2V59e3z/eFLZANcoApP7XT3DLkCL86SzGZaMqdyHR0ZKKqUaKnlPybHlVWpT1UnEPZAkkPhJDC0Vg1c2Bk/tIbBRcqigb/K0H5w/hDvvzKfirnTRH4Jd3Be5H3q8A6x+vrSNWDxxtBw+tynPoyhJZf8vQ2uPSIDxima+2A5qQUBpPNkifDldoL2uvtTidpFd4oBvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N50VCiCKkdRqMSpkK9h4MxE+fkysBHt0vZZk7ZihQHM=;
 b=cuJW+kWkqMseaQtsIcQviapbc1MGqM6maXPmA0Eho7Q1UD/P5Xvg1OG/LPa00swJhV+1V+gRmWoz4I0TnQR+0sR/sBomMdAsYkIWXx4Nv/w4IRvceJnjXCZuldbmV4PFOBu99sf8ks5+MnSFwimTFnQOQF4M8zIPqhEB6O6CiF6jyyOmOoFwHqIdH45+JLPKHQhDbZoOSHVuuyJ+LaMtQwYjZHFo/vtBh5Og3nDeWfDWrzfgUa6vTQNwBMI2finQQTIwHF7OSOEtiTmRv2tvT1m4A2hQpMJsxujvCiLVe9W4icAiBWCILz5VUyEaqG/0ra2HYyIZin12WZOC8V/YQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N50VCiCKkdRqMSpkK9h4MxE+fkysBHt0vZZk7ZihQHM=;
 b=MzXUnp/7wNtJKy7u0cYHu1Cd6rNDSk4cbBZ3K5V8t512pO+bWAIEjgI0u54pjgGGZY5SN7o2cUQZtg7Sgz7nqiI+cnls1rFnI3dRm4OFekF+B2MuatmQ156QF4GhCeEmLd/5pJFwhgbqJsz6Eb+uHs142cYDtTfOIZQ8V/Q6Kc4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/8G3HRYA/0Z+vT+W6m+flgIWsksjzJLipxmwVH1OKStYa3RnGSlEamwqjAdXJz5p5xLgVM4oekAFiv6BrlE7ad1t5F7lao7VUASiXgzMJ7vMlcoHCYhfaQIzszXEOa8+vxBVRjUz/d/umGdqK9VJvkujEqX5n/9SK3NhSwqLuycENaBl/R+HGpcytXU1TB8mbqX5glvESN3mvFIAH4UnObNaZlcswZOay8sRvwDBsrtH3zt49Fr8lVT87t5qDAAoOGlsKWNeCfHPD8fTp16urZoiS+foehuzBJhio83CMluhRewdfh70nSyWM81fHvNGRdiOErprY/xeFgNEgIP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N50VCiCKkdRqMSpkK9h4MxE+fkysBHt0vZZk7ZihQHM=;
 b=XI7vxmRUQA5ft1OaWRTsnBR1Yi57rVvPwwEDx/7qqlRPKVU8buZkQlgPuoCwSqiWbmGqXMCnckeuZ675xFkk7GEXiw81cizJ3mhOKohVCnofPR0gy1OWY7xqFSpx8ZYZmMVsau4Usn2KSCOmqrCGZweVLr/L5YLhLR0KPKjh+UQABeO56YN+gzQMM0BXcDeqMUOLahotSBiWdxPLmljWUzj91a4NrfVMkIa7+BmIrTOt88k/EClrbcbznEjXn5RRl7z4r5jiUJ7CUkXOwV5zNv/bRGOgn0Y3pdLz5p4kqRckGVWMObKMbzHMbjUzmrHVxWDcP22XTMykssD5risKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N50VCiCKkdRqMSpkK9h4MxE+fkysBHt0vZZk7ZihQHM=;
 b=MzXUnp/7wNtJKy7u0cYHu1Cd6rNDSk4cbBZ3K5V8t512pO+bWAIEjgI0u54pjgGGZY5SN7o2cUQZtg7Sgz7nqiI+cnls1rFnI3dRm4OFekF+B2MuatmQ156QF4GhCeEmLd/5pJFwhgbqJsz6Eb+uHs142cYDtTfOIZQ8V/Q6Kc4=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>
Subject: RE: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Index:
 AQHYfI531SRNO5A+8Ei3iOFoJrK02K1dB3iAgAE0OjCAABXrgIAAECwAgAAEoICAAARlgIAAAO0AgAmAA0CAABcRAIAA6+aA
Date: Fri, 1 Jul 2022 03:11:36 +0000
Message-ID:
 <PAXPR08MB7420F8745E83D013AAF566689EBD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
 <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1d488f5d-bfd3-a816-dab1-515f49a57f67@suse.com>
In-Reply-To: <1d488f5d-bfd3-a816-dab1-515f49a57f67@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1C2A7C846B54B940B7236AC34B498C38.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 599c4d48-e753-491a-7324-08da5b0f71ec
x-ms-traffictypediagnostic:
	AM0PR08MB4225:EE_|VE1EUR03FT016:EE_|VI1PR08MB3965:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vFZX4Rw9tzS6zyF0j6STewzLLpyguAZqlM/DOxN9HQ/RLOstK6LgBUn3sSeiKKVBwKrftRCVApE1lmsgTdtDhj+czaQG+2Ct2xL28AohYAeQ6sDu6oBDtkquz3TpXtAjU1HUq3GBKMhhLlsgjFY/I8ogsi7RLT7UwWMHyb9vwLtG9qbfUyhrXoYIK0WhBrcDf9vrtI7SATkB9yi8ft4sb4FB58gtZR72OvzXF9eywtl2ZFusy+ysQFVaZlaWXso9h7YFcnep4sxi1pQPQxDJz6xhKtoICKu/1suhdctMP0+eyOrpvLfqToEt6A1vzi3onXY49sfzqYxqWLBQs3fGuTv6MrHDJNr/x9F8NlOa4LpLRDRbl5x2ANFXTioqpSEgnKjMH2XezW5eDSGJlo++BygBPa4JEgTBFfPh7Zsu62f3ZanthBtKDNdFigLj6c9mlRk0m1vPId3JprCHcz4lSnj/2b+WlOYXbofFxLEDKVoyyWjX/7yjdJ5PmeYh/H4gYB8e17zEI+/rdWc0M45H9PTNfEbUsxXpiGqJ9qesXpvBFq6fpySo1S9wy/yHz/saiqJpwg6Fkc8JMCTLZ4PoMqsEchAqZRDhR2XPBugxt7/QnH75amOPfiiz8rPR4pTINZT28M+Q+fs6ifg3M6mnlxT5kyWXj6F6hcV1HfqRyQ8v+if7T8WxVFg1XZqGxYqZ8c9joBV0AsUDYvxrZryaiLewLBxQ7OTQSQrQLClhuKnU64nL+6d/hlVJCny51hS5zXoymgUHpnxWPJz97pyXgt5qKQXsp7k5g0zqBiYJcxAKQ+fG5x9fJzOLmQSdyLv4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(38100700002)(86362001)(83380400001)(186003)(76116006)(66556008)(8676002)(122000001)(316002)(66446008)(55016003)(4326008)(64756008)(66946007)(66476007)(6916009)(71200400001)(54906003)(5660300002)(478600001)(53546011)(38070700005)(26005)(9686003)(2906002)(8936002)(6506007)(7696005)(33656002)(52536014)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4225
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	650c18c8-70b8-4ed7-027e-08da5b0f6876
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BuNcSPw7aQY1FAul8WjDMdj5A2UrORw22//cDctNaNiFkbkMXh1/WQREGTqsi1S12BgzeHsDLEWQu8Sx0LmAxubvIwduIYC412w+ZjILxfZe4hzKmkLvdOTJVlyF6tbgAUHAxA9+oeTU6VzqrGqfjq9Bi02IwREjtXNjxufuO/b41xgOhoNRrdgW1AuyV16rbp6NlICt+VcXoXIsIxg7e+dCQlWpSiKNoSA6LYYSwpBj2LJj5cSLpkq1rTv7Bp52qO35JE7Q3yl5F5Md6z6y29uWPI3Zjs6CaOjsjthJg1bicXlr0Fm+sA2JcoVuPMWX2ihDd2PkBdJcE3MZC2pxgSN4hHmyNQsoMhRPlS//U46Gh3YUGdlVmPSMdcjMB6BmHoW44xhk8yOQvYNKOb4369nhBys1jzui6Y1DRUoONFk9Ez9Fnr4NlcGZVuKD8PPhUEIDW4cnKPdLXOl4OcR3kHiG2EVlvbhlGcBn3lBla5Nw6K1wKR3zBItSZorCEQ8vbeCh+BOx0Dm+2rjOrjwVdjD+H+20wIiH+spG6TquejxjjsRA3ayj+EpNRXIjGdyPOOwDfwoLEOa3JDtAYTocKSCY1lcMCrQ6Cd/AjAfRrz8YkVlxwVYeeAuSfV0vVOvRtRv59IX6VxGvxfbAm8X/FJkMEqriQ1hHNcPOMHwAMij1zlQ5OfkTYn/8WsPzUIbhmoZym5nITmyJEXfIhvKhmX67fJ/9/I2gixA+x+ORhpspZT6ygQmgg9M3gKhm6xg9vQGx7Xd/7SK20NpTgGmYEIsoXX07TAh6inzmzs0tLjok1nC93MvKXyCGT9F/4KI4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(40470700004)(46966006)(36840700001)(81166007)(54906003)(47076005)(316002)(356005)(82740400003)(52536014)(4326008)(86362001)(40460700003)(5660300002)(33656002)(70586007)(70206006)(2906002)(8936002)(8676002)(186003)(82310400005)(6862004)(55016003)(41300700001)(336012)(40480700001)(53546011)(26005)(7696005)(478600001)(9686003)(6506007)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 03:11:51.8898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599c4d48-e753-491a-7324-08da5b0f71ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3965

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDbmnIgzMOaXpSAyMDozNg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+
IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBKaWFtZWkgWGllDQo+IDxKaWFtZWkuWGllQGFybS5j
b20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEp1bGllbiBHcmFsbA0KPiA8anVs
aWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS84XSB4ZW46IHJldXNlIHg4
NiBFRkkgc3R1YiBmdW5jdGlvbnMgZm9yIEFybQ0KPiANCj4gT24gMzAuMDYuMjAyMiAxMzoyNSwg
V2VpIENoZW4gd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4gU2VudDogMjAyMuW5tDbmnIgyNOaXpSAxODowOQ0KPiA+Pg0KPiA+PiBPbiAyNC4w
Ni4yMDIyIDEyOjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+IE9uIDI0LjA2LjIwMjIgMTE6
NDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9l
ZmkvTWFrZWZpbGUNCj4gPj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9lZmkvTWFrZWZpbGUN
Cj4gPj4+Pj4+Pj4+IEBAIC0xLDQgKzEsMTIgQEANCj4gPj4+Pj4+Pj4+ICAgIGluY2x1ZGUgJChz
cmN0cmVlKS9jb21tb24vZWZpL2VmaS1jb21tb24ubWsNCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+
PiAraWZlcSAoJChDT05GSUdfQVJNX0VGSSkseSkNCj4gPj4+Pj4+Pj4+ICAgIG9iai15ICs9ICQo
RUZJT0JKLXkpDQo+ID4+Pj4+Pj4+PiAgICBvYmotJChDT05GSUdfQUNQSSkgKz0gIGVmaS1kb20w
LmluaXQubw0KPiA+Pj4+Pj4+Pj4gK2Vsc2UNCj4gPj4+Pj4+Pj4+ICsjIEFkZCBzdHViLm8gdG8g
RUZJT0JKLXkgdG8gcmUtdXNlIHRoZSBjbGVhbi1maWxlcyBpbg0KPiA+Pj4+Pj4+Pj4gKyMgZWZp
LWNvbW1vbi5tay4gT3RoZXJ3aXNlIHRoZSBsaW5rIG9mIHN0dWIuYyBpbiBhcm0vZWZpDQo+ID4+
Pj4+Pj4+PiArIyB3aWxsIG5vdCBiZSBjbGVhbmVkIGluICJtYWtlIGNsZWFuIi4NCj4gPj4+Pj4+
Pj4+ICtFRklPQkoteSArPSBzdHViLm8NCj4gPj4+Pj4+Pj4+ICtvYmoteSArPSBzdHViLm8NCj4g
Pj4+Pj4+Pj4+ICtlbmRpZg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBUaGlzIGhhcyBjYXVzZWQN
Cj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gbGQ6IHdhcm5pbmc6IGFyY2gvYXJtL2VmaS9idWlsdF9p
bi5vIHVzZXMgMi1ieXRlIHdjaGFyX3QgeWV0IHRoZQ0KPiA+PiBvdXRwdXQgaXMNCj4gPj4+Pj4+
Pj4gdG8gdXNlIDQtYnl0ZSB3Y2hhcl90OyB1c2Ugb2Ygd2NoYXJfdCB2YWx1ZXMgYWNyb3NzIG9i
amVjdHMgbWF5DQo+ID4+IGZhaWwNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gZm9yIHRoZSAzMi1i
aXQgQXJtIGJ1aWxkIHRoYXQgSSBrZWVwIGRvaW5nIGV2ZXJ5IG9uY2UgaW4gYSB3aGlsZSwNCj4g
Pj4gd2l0aA0KPiA+Pj4+Pj4+PiAoaWYgaXQgbWF0dGVycykgR05VIGxkIDIuMzguIEkgZ3Vlc3Mg
eW91IHdpbGwgd2FudCB0byBjb25zaWRlcg0KPiA+PiBidWlsZGluZw0KPiA+Pj4+Pj4+PiBhbGwg
b2YgWGVuIHdpdGggLWZzaG9ydC13Y2hhciwgb3IgdG8gYXZvaWQgYnVpbGRpbmcgc3R1Yi5jIHdp
dGgNCj4gPj4gdGhhdA0KPiA+Pj4+Pj4+PiBvcHRpb24uDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4N
Cj4gPj4+Pj4+PiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJIHdpbGwgdHJ5IHRvIHVz
ZSAtZnNob3J0LXdjaGFyIGZvcg0KPiA+PiBBcm0zMiwNCj4gPj4+Pj4+PiBpZiBBcm0gbWFpbnRh
aW5lcnMgYWdyZWUuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gTG9va2luZyBhdCB0aGUgY29kZSB3ZSBk
b24ndCBzZWVtIHRvIGJ1aWxkIFhlbiBhcm02NCB3aXRoIC1mc2hvcnQtDQo+ID4+IHdjaGFyDQo+
ID4+Pj4+PiAoYXNpZGUgdGhlIEVGSSBmaWxlcykuIFNvIGl0IGlzIG5vdCBlbnRpcmVseSBjbGVh
ciB3aHkgd2Ugd291bGQNCj4gd2FudA0KPiA+PiB0bw0KPiA+Pj4+Pj4gdXNlIC1mc2hvcnQtd2No
YXIgZm9yIGFybTMyLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBXZSBkb24ndCB1c2Ugd2NoYXJfdCBvdXRz
aWRlIG9mIEVGSSBjb2RlIGFmYWljdC4gSGVuY2UgdG8gYWxsIG90aGVyDQo+ID4+IGNvZGUNCj4g
Pj4+Pj4gaXQgc2hvdWxkIGJlIGJlbmlnbiB3aGV0aGVyIC1mc2hvcnQtd2NoYXIgaXMgaW4gdXNl
LiBTbyB0aGUNCj4gc3VnZ2VzdGlvbg0KPiA+Pj4+PiB0byB1c2UgdGhlIGZsYWcgdW5pbGF0ZXJh
bGx5IG9uIEFybTMyIGlzIHJlYWxseSBqdXN0IHRvIHNpbGVuY2UgdGhlDQo+IGxkDQo+ID4+Pj4+
IHdhcm5pbmc7DQo+ID4+Pj4NCj4gPj4+PiBPay4gVGhpcyBpcyBvZGQuIFdoeSB3b3VsZCBsZCB3
YXJuIG9uIGFybTMyIGJ1dCBub3Qgb3RoZXIgYXJjaD8NCj4gPj4+DQo+ID4+PiBBcm0zMiBlbWJl
ZHMgQUJJIGluZm9ybWF0aW9uIGluIGEgbm90ZSBzZWN0aW9uIGluIGVhY2ggb2JqZWN0IGZpbGUu
DQo+ID4+DQo+ID4+IE9yIGEgbm90ZS1saWtlIG9uZSAoanVzdCB0byBhdm9pZCBwb3NzaWJsZSBj
b25mdXNpb24pOyBJIHRoaW5rIGl0J3MNCj4gPj4gIi5BUk0uYXR0cmlidXRlcyIuDQo+ID4+DQo+
ID4+IEphbg0KPiA+Pg0KPiA+Pj4gVGhlIG1pc21hdGNoIG9mIHRoZSB3Y2hhcl90IHBhcnQgb2Yg
dGhpcyBpbmZvcm1hdGlvbiBpcyB3aGF0IGNhdXNlcw0KPiA+Pj4gbGQgdG8gZW1pdCB0aGUgd2Fy
bmluZy4NCj4gPj4+DQo+ID4+Pj4+IG9mZiB0aGUgdG9wIG9mIG15IGhlYWQgSSBjYW4ndCBzZWUg
YW55dGhpbmcgd3Jvbmcgd2l0aCB1c2luZw0KPiA+Pj4+PiB0aGUgb3B0aW9uIGFsc28gZm9yIEFy
bTY0IG9yIGV2ZW4gZ2xvYmFsbHkuIFlldCBvdG9oIHdlIHR5cGljYWxseQ0KPiB0cnkNCj4gPj4g
dG8NCj4gPj4+Pj4gbm90IG1ha2UgY2hhbmdlcyBmb3IgZW52aXJvbm1lbnRzIHdoZXJlIHRoZXkg
YXJlbid0IHJlYWxseSBuZWVkZWQuDQo+ID4+Pj4NCj4gPj4+PiBJIGFncmVlLiBJZiB3ZSBuZWVk
IGEgd29ya2Fyb3VuZCwgdGhlbiBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIG5vdA0KPiA+Pj4+
IGJ1aWxkIHN0dWIuYyB3aXRoIC1mc2hvcnQtd2NoYXIuDQo+ID4+Pg0KPiA+Pj4gVGhpcyB3b3Vs
ZCBuZWVkIHRvIGJlIGFuIEFybS1zcGVjaWFsIHRoZW4sIGFzIG9uIHg4NiBpdCBuZWVkcyB0byBi
ZQ0KPiA+PiBidWlsdA0KPiA+Pj4gdGhpcyB3YXkuDQo+ID4NCj4gPiBJIGhhdmUgdGFrZW4gYSBs
b29rIGludG8gdGhpcyB3YXJuaW5nOg0KPiA+IFRoaXMgaXMgYmVjYXVzZSB0aGUgIi1mc2hvcnQt
d2NoYXIiIGZsYWcgY2F1c2VzIEdDQyB0byBnZW5lcmF0ZQ0KPiA+IGNvZGUgdGhhdCBpcyBub3Qg
YmluYXJ5IGNvbXBhdGlibGUgd2l0aCBjb2RlIGdlbmVyYXRlZCB3aXRob3V0DQo+ID4gdGhhdCBm
bGFnLiBXaHkgdGhpcyB3YXJuaW5nIGhhc24ndCBiZWVuIHRyaWdnZXJlZCBpbiBBcm02NCBpcw0K
PiA+IGJlY2F1c2Ugd2UgZG9uJ3QgdXNlIGFueSB3Y2hhciBpbiBBcm02NCBjb2Rlcy4NCj4gDQo+
IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHF1aXRlIHJpZ2h0IC0geW91IGFjdHVhbGx5IHNheSBiZWxv
dyB0aGF0IHdlDQo+IGRvIHVzZSBpdCB0aGVyZSB3aGVuIGludGVyYWN0aW5nIHdpdGggVUVGSS4g
VGhlcmUncyBubyB3YXJuaW5nDQo+IHRoZXJlIHNvbGVseSBiZWNhdXNlIHRoZSBpbmZvcm1hdGlv
biBpc24ndCBlbWJlZGRlZCBpbiB0aGUgb2JqZWN0DQo+IGZpbGVzIHRoZXJlLCBmcm9tIGFsbCBJ
IGNhbiB0ZWxsLg0KPiANCg0KTWF5YmUgSSBzaG91bGQgZGVzY3JpYmUgaXQgdGhpcyB3YXk6IEFy
bTY0IGRvZXMgbm90IHVzZSB3Y2hhciB0eXBlDQpkaXJlY3RseSBpbiBhbnkgY29kZSBmb3IgcGFy
YW1ldGVycywgdmFyaWFibGVzIGFuZCByZXR1cm4gdmFsdWVzLg0KU28gQXJtNjQgb2JqZWN0IGZp
bGVzIGFyZSBleGFjdGx5IHRoZSBzYW1lIHdpdGggIi1mc2hvcnQtd2NoYXIiIGFuZA0Kd2l0aG91
dCAiLWZzaG9ydC13Y2hhciIuDQoNCkFsdGhvdWdoIFhlbidzIEVGSSBjb2RlIGludGVyYWN0cyB3
aXRoIFVFRkkgZmlybXdhcmUsIHNpbWlsYXIgdG8gUlBDDQpmdW5jdGlvbiBjYWxscywgdGhlc2Ug
Y29kZSBhbHNvIGRvIG5vdCBleHBsaWNpdGx5IHVzZSB3Y2hhci4gQnV0IGl0DQppcyByZWFzb25h
YmxlIHRvIGtlZXAgLWZzaG9ydC13Y2hhciBmb3IgWGVuJ3MgRUZJIGNvZGUsIGJ1dCBhcyBsb25n
DQphcyB3ZSB1c2Ugd2NoYXIgaW4gRUZJIGNvZGUgaW4gdGhlIGZ1dHVyZSwgd2Ugd2lsbCBkZWZp
bml0ZWx5IGVuY291bnRlcg0KdGhpcyB3YXJuaW5nIGxpa2UgQXJtMzIuDQoNCj4gPiBXZSBhcmUg
YWxzbyBub3QNCj4gPiB1c2luZyB3Y2hhciBpbiBBcm0zMiBjb2RlcywgYnV0IEFybTMyIHdpbGwg
ZW1iZWQgQUJJIGluZm9ybWF0aW9uDQo+ID4gaW4gIi5BUk0uYXR0cmlidXRlcyIgc2VjdGlvbi4g
VGhpcyBzZWN0aW9uIHN0b3JlcyBzb21lIG9iamVjdA0KPiA+IGZpbGUgYXR0cmlidXRlcywgbGlr
ZSBBQkkgdmVyc2lvbiwgQ1BVIGFyY2ggYW5kIGV0Yy4gQW5kIHdjaGFyDQo+ID4gc2l6ZSBpcyBk
ZXNjcmliZWQgaW4gdGhpcyBzZWN0aW9uIGJ5ICJUYWdfQUJJX1BDU193Y2hhcl90IiB0b28uDQo+
ID4gVGFnX0FCSV9QQ1Nfd2NoYXJfdCBpcyAyIGZvciBvYmplY3QgZmlsZXMgd2l0aCAiLWZzaG9y
dC13Y2hhciIsDQo+ID4gYnV0IGZvciBvYmplY3QgZmlsZXMgd2l0aG91dCAiLWZzaG9ydC13Y2hh
ciIgaXMgNC4gQXJtMzIgR0NDDQo+ID4gbGQgd2lsbCBjaGVjayB0aGlzIHRhZywgYW5kIHRocm93
IGFib3ZlIHdhcm5pbmcgd2hlbiBpdCBmaW5kcw0KPiA+IHRoZSBvYmplY3QgZmlsZXMgaGF2ZSBk
aWZmZXJlbnQgVGFnX0FCSV9QQ1Nfd2NoYXJfdCB2YWx1ZXMuDQo+ID4NCj4gPiBBcyBnbnUtZWZp
LTMuMCB1c2UgdGhlIEdDQyBvcHRpb24gIi1mc2hvcnQtd2NoYXIiIHRvIGZvcmNlIHdjaGFyDQo+
ID4gdG8gdXNlIHNob3J0IGludGVnZXJzICgyIGJ5dGVzKSBpbnN0ZWFkIG9mIGludGVnZXJzICg0
IGJ5dGVzKS4NCj4gPiBXZSBjYW4ndCByZW1vdmUgdGhpcyBvcHRpb24gZnJvbSB4ODYgYW5kIEFy
bTY0LCBiZWNhdXNlIHRoZXkgbmVlZA0KPiA+IHRvIGludGVyYWN0IHdpdGggRUZJIGZpcm13YXJl
LiBTbyBJIGhhdmUgdG8gb3B0aW9uczoNCj4gPiAxLiBSZW1vdmUgIi1mc2hvcnQtd2NoYXIiIGZy
b20gZWZpLWNvbW1vbi5tayBhbmQgYWRkIGl0IGJhY2sgYnkNCj4gPiAgICB4ODYgYW5kIGFybTY0
J3MgRUZJIE1ha2VmaWxlDQo+ID4gMi4gQWRkICItbm8td2NoYXItc2l6ZS13YXJuaW5nIiB0byBB
cm0zMidzIGxpbmtlciBmbGFncw0KPiA+DQo+ID4gSSBwZXJzb25hbGx5IHByZWZlciBvcHRpb24j
MSwgYmVjYXVzZSBBcm0zMiBkb2Vzbid0IG5lZWQgdG8gaW50ZXJhY3QNCj4gPiB3aXRoIEVGSSBm
aXJtd2FyZSwgYWxsIGl0IHJlcXVpcmVzIGFyZSBzb21lIHN0dWIgZnVuY3Rpb25zLiBBbmQNCj4g
PiAiLW5vLXdjaGFyLXNpemUtd2FybmluZyIgbWF5IGhpZGUgc29tZSB3YXJuaW5ncyB3ZSBzaG91
bGQgYXdhcmUgaW4NCj4gPiBmdXR1cmUuDQo+IA0KPiBJIGRvbid0IG1pbmQgIzEsIGJ1dCBJIHRo
aW5rIHlvdXIgc3Vic2VxdWVudGx5IHByb3Bvc2VkICMzIHdvdWxkIGJlDQo+IHRoZSBmaXJzdCB0
aGluZyB0byB0cnkuIFRoZXJlIG1heSBiZSBjYXZlYXRzLCBzbyBpZiB0aGF0IGRvZXNuJ3Qgd29y
aw0KPiBvdXQgSSdkIHN1Z2dlc3QgZmFsbGluZyBiYWNrIHRvICMxLiBBbGJlaXQgaWRlYWxseSB0
aGUgZmxhZyBzZXR0aW5nDQo+IHdvdWxkbid0IGJlIG1vdmVkIGJhY2sgKGl0IF9pc18gYSBjb21t
b24gRUZJIHRoaW5nLCBhZnRlciBhbGwpLCBidXQNCj4gcmF0aGVyIEFybTMyIGFycmFuZ2luZyBm
b3IgaXRzIGFkZGl0aW9uIHRvIGJlIHN1cHByZXNzZWQuDQo+IA0KDQpJIGFtIE9LIHdpdGggb3B0
aW9uIzMgdG8gc2V0ICItZnNob3J0LXdjaGFyIiBhcyBhIGdsb2JhbCBDRkxBR1MuIFRoaXMNCmZs
YWcgd2lsbCBhZmZlY3Qgd2NoYXIgcGVyZm9ybWFuY2UgKG5vbi00Ynl0ZXMtYWxpZ25tZW50KSwg
YnV0IFhlbg0KZG9lc24ndCB1c2Ugd2NoYXIgb3V0IG9mIEVGSS4gU28gc2V0dGluZyBpdCBhcyBh
IGdsb2JhbCBmbGFnIHNob3VsZA0KYmUgaGFybWxlc3MuIEl0IGNhbiBhbHNvIGF2b2lkIHNpbWls
YXIgd2FybmluZ3MgZnJvbSBhcHBlYXJpbmcgYWdhaW4uDQoNCkNoZWVycywNCldlaSBDaGVuDQoN
Cj4gSmFuDQo=

