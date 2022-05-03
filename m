Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A719D51844E
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 14:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319553.539828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlrdV-00037c-78; Tue, 03 May 2022 12:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319553.539828; Tue, 03 May 2022 12:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlrdV-00034h-3a; Tue, 03 May 2022 12:28:13 +0000
Received: by outflank-mailman (input) for mailman id 319553;
 Tue, 03 May 2022 12:28:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlrdT-00034b-FZ
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 12:28:11 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe06::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e108529-cadc-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 14:28:10 +0200 (CEST)
Received: from DB3PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:8:1::25) by
 AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Tue, 3 May
 2022 12:28:06 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::93) by DB3PR06CA0012.outlook.office365.com
 (2603:10a6:8:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Tue, 3 May 2022 12:28:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 12:28:05 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 03 May 2022 12:28:05 +0000
Received: from 980bc8973816.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 925694CA-96C7-4F42-A6E2-257899924CE5.1; 
 Tue, 03 May 2022 12:27:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 980bc8973816.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 12:27:55 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by HE1PR0801MB1641.eurprd08.prod.outlook.com (2603:10a6:3:80::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 3 May
 2022 12:27:44 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 12:27:44 +0000
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
X-Inumbo-ID: 7e108529-cadc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mC3+NaSETCehIt2N3nW38TBnEYqNgVakrOy8QM/q0dC+s/lQ0bBCskmQFpir6xE6BREKZpyjVQYlCkzm1HE6IskYFprjCVsGwSGUpn64H3piAiuq6ELhaNYEYao9DOreD1LF19T+ByMDHIIOsoI3dIfiLSucc/QecwzCEYKuvLI2z6FkhusqNP/Na+tNkWCyuNgFx6K6l9CT6QqwlTr/HT37kHR11v1B3PTQGbl1yX/nN0hxxpxe8xXJZHVj+c0iT64fER3QgCnt48p1pq8ZOZGQ7m6wUIhTClhX1+UEyH4Z9K4F+BxPbdvKSsiCVF78AvSU3Oh7lRFIYyG+i/Ci2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+DjChccwRJy9mvIuY1PhsTOViea0ZZycWnYFbYUdB8=;
 b=O/QNanFsB9nDgVDGG9EN8xkTUXZI2e0apXkvzM5CgllSDE8g8iu9uULd4g1QlYcsMt3xEqA4RTZIf6n+dIA9lrind4U9FJ/5c9viBaKfeajBf2EGkDWtguhu6YmDvan5+jgX0JYMAQPc33xnbWibplsySuEB2za0Wqk5uDmk2pdDupvfxNpn/kql3f1nSgXfdLKOx/31bCZj4dgh8OpibXDiDUWTpGPJSxW1N7KCmLlPJaKHWdgmalMIDoMMC5n83S6qZQ3DNR31xrWZNC2OcjY2ssctD6Wn2pddQF0lbhpltcvQJWrspPS5Kbj91fNTh1mV24MZojUyOL1PqZmrCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+DjChccwRJy9mvIuY1PhsTOViea0ZZycWnYFbYUdB8=;
 b=QpXktlUFkVdlA8jyXhmQl7u831Et86X75ieySZQeIq7TtM8e/XZ1XG15TYRaKda8LSk4Z50jlGRLBMlwC3GHnPHO6hJ8Y3t50kEp9kbBovZ+H51NCOUSzMHniKV8rQh0+9I9k4I6gxlX4DAyBBpx+7BQuPCDPCWFsly1jF0XpZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ccbc0f7eaeaeec8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k82HZsvfoFV6EgR4LdMt7yCmUtSpnzvh17OjziK58Kl8htMBiI2GHnnt6kgSsJrdR8MyRMGLhyMvU/Y/TBlRs97c1K/l+fL30me5JfBM/PrmndgjtrsIc4EBJCTeNYQFpgqcC4u33Z9Rl28jhPBSnEuDKjyoMFyn3x4WFepJy7RGpY8BY9V2nQqn6v0uI3zzUgX7P5s6mkgZc+QTs6TLg89VPsC52bPasndDh33uJgMc4RRMJH7Z7wuCgsTbtfZu+3rVE6diVqSbU6c6fTsucyIeOzGY/DCN3gY9lZ7epIn+zuxdMUJZjOmRhA7n2TlAPBHwMcnykFEICWITCwxdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+DjChccwRJy9mvIuY1PhsTOViea0ZZycWnYFbYUdB8=;
 b=UhuK9lelkW9uReC4+kDGM/pwCF1iUpf073iJEbjDOnMbkV8ZEveWjKyRlDf5s/qIWVeIZg7lFw5Dk13MsxE30wvg1hOZRF2Z2Bk5kYNav5Pye8eumZvw7IMRAwZcenzcGhv9FCjjZfjD5tddrVj3f8DHVAfta45EmuM6Wlq8T4u01knisNmlmIJHd5k2lAkMxynRS3vSPpeQRAh9WOWYFZBOGXN05gF9Fjnlh8bwAGQoP1/8p17PFVCpDDJzAVn7cRnUpsJ+yiSqHec95dVLShX6sSounMAn+6DV6KaFxo3GM9npOOge+U8Qpwp5HMXVUc9eK+rVhj0dsKGKQEqu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+DjChccwRJy9mvIuY1PhsTOViea0ZZycWnYFbYUdB8=;
 b=QpXktlUFkVdlA8jyXhmQl7u831Et86X75ieySZQeIq7TtM8e/XZ1XG15TYRaKda8LSk4Z50jlGRLBMlwC3GHnPHO6hJ8Y3t50kEp9kbBovZ+H51NCOUSzMHniKV8rQh0+9I9k4I6gxlX4DAyBBpx+7BQuPCDPCWFsly1jF0XpZY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, Scott Davis
	<scott.davis@starlab.io>, "jandryuk@gmail.com" <jandryuk@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Dario
 Faggioli <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Topic: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Index: AQHYXt+O5KwXx13Nl0CUGYEFbsIOk60NFJ8A
Date: Tue, 3 May 2022 12:27:44 +0000
Message-ID: <07F5E21C-7C09-4623-81B6-5D9F0633DFED@arm.com>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
 <20220503111731.12642-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220503111731.12642-2-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 332ebc40-2bfe-4960-ff2f-08da2d005fd0
x-ms-traffictypediagnostic:
	HE1PR0801MB1641:EE_|DBAEUR03FT051:EE_|AM5PR0802MB2452:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2452C6D98E2F57C9EB1D87D0E4C09@AM5PR0802MB2452.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FObFdCOJzhd1hke61JeI9bfOewtuZ68lDuhA4sNxfb+1Ya9cIot+jfxXEx3c3g5Q00E60lSjRIMRdh3UB6l47TeftIxPmPm/OmyHdxPopuuWVXWcg7ffgAmhXIvqQlubxJfBLo958QwpVRyhJ3K42fv0tm/qRMQjBEto/1qu5hrHil3GHPNqLZgU5ihFHTg9t9b6qpKPP7ujcBctRmcjNyUZoksKid8IohgARpiQkIUBiO8RRaOoBJtllJwuRXyOCC0RiFyqtK5B/xB36XlI2W8JtKzg8pBo8K2dAeSfhwEDKrv7Bv45hJ0UvuQW5ToR4OHGN4qcn8cztpQM6cX0g+2d4t93TEyBWrPwIr8cQ6tjMJtFBTFnFpPgk7Uq9Zxh6XhAkcBd2BsvIqLFu8FjLwlruaKOl9YcEHE4wvtrsJ7RlQpMZj5C+LNCqhcwgsCT77BzEMJMvYDcVnB0dOCG48kvjH6E5bd+aeNUhQj9xkHJ94rxrdS6ZWbE2CdrruPxtHR0cWbKDMKUa5ppNhyivSqdfI/rKDg7eddWt2QcveKAQS9Xee79BgBirKqt7MfO7QHQn+2mksHxCE0f3Xuv+oamGqUFa3KpmmPVlMfrMVRiYvbbgIzg16V1ow9HSE7YEH21sQUEe3E6L556Z5Zu1SbuGY8h1kbzjE8oLPS6vv38bz6RWjz+T1V8OA1CCDWUcG9rDHNAdUgf/lAllk6CW5JNUHX+Yxhlro5lKgBuKC4l66afHCvEFnkE/EGWlOfA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(66446008)(66946007)(83380400001)(5660300002)(76116006)(66556008)(66476007)(8936002)(2616005)(86362001)(186003)(26005)(33656002)(2906002)(6512007)(53546011)(6506007)(54906003)(508600001)(71200400001)(122000001)(6916009)(316002)(38070700005)(38100700002)(7416002)(8676002)(64756008)(4326008)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <466DB3C341D2D441B0C0F982872F9A19@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1641
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f96e51bf-a170-482a-a19d-08da2d005300
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jcQ7vPDJuZ1sAYjJ2AcrpxmK62eytGRBgcjQesFq0tCS49ilBTCwZHAvTq2B1f2Eq+nJ5hfU1eZgmk4nIIhrFutcqgSugzgS0k5ghczFaebhuCOOowPPE/b2PhiVeC251C/QboS64iIL+Rk79MBpeKOluX2DAjwvpQ2aL30vCte0dZKhDUryE4+s6j6Xlmre7soJu7xHslSF/c1T2oCKEnQljTdSyt955sEJW7t/Uqiq1qw/57bznmraV+BKR8NSYNsutsey+hMsri7XgyPDydtxRoj16iNSNTVjan3/x790NXcnRb4r6s/x6ZY/t2pgx2tk6zYv6wCqv+5Iov3uPBo5aqvzkKSRs80RcT1bvTyVoIwPgFaVtCJvWPo5Csd0IXrx7zQfHEY7lpr7nSSmp2r35YMjgOPfjNg6AyB2Gdpd7M9VO/ASPUZIeVu8UvyxTYnYtLAOzeCISliCBjtXyyk6LvyRqf2bPYuKXZxeg414A2uDYEl2GPesh2feVsc4I73SOmQ/d4ouyq0MrXaPiQ82O/6LJUz8CvfP1wBFmgg1ncS8d6boqymUOiTr9F+zgJrBxriFLoMMQNinokSPmeo950HiZ7VowvGsradgaIdsQBjsyoCNJFEp4UnGwR8WU8PFZxzw13dwBL14+D+/jtLB8SyJSGnQ5+k91tbPS0BKj9aHgduocbtKhe0/FV+e
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(26005)(36860700001)(82310400005)(6512007)(54906003)(6506007)(2906002)(53546011)(8676002)(4326008)(86362001)(33656002)(508600001)(6862004)(6486002)(81166007)(336012)(83380400001)(36756003)(70586007)(70206006)(5660300002)(356005)(186003)(40460700003)(2616005)(8936002)(316002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 12:28:05.7128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 332ebc40-2bfe-4960-ff2f-08da2d005fd0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2452



> On 3 May 2022, at 12:17, Daniel P. Smith <dpsmith@apertussolutions.com> w=
rote:
>=20
> There are new capabilities, dom0less and hyperlaunch, that introduce inte=
rnal
> hypervisor logic which needs to make resource allocation calls that are
> protected by XSM access checks. This creates an issue as a subset of the
> hypervisor code is executed under a system domain, the idle domain, that =
is
> represented by a per-CPU non-privileged struct domain. To enable these ne=
w
> capabilities to function correctly but in a controlled manner, this commi=
t
> changes the idle system domain to be created as a privileged domain under=
 the
> default policy and demoted before transitioning to running. A new XSM hoo=
k,
> xsm_set_system_active(), is introduced to allow each XSM policy type to d=
emote
> the idle domain appropriately for that policy type. In the case of SILO, =
it
> inherits the default policy's hook for xsm_set_system_active().
>=20
> For flask a stub is added to ensure that flask policy system will functio=
n
> correctly with this patch until flask is extended with support for starti=
ng the
> idle domain privileged and properly demoting it on the call to
> xsm_set_system_active().
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


