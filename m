Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75D620722
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 04:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439702.693744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osEtT-00035h-Dr; Tue, 08 Nov 2022 03:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439702.693744; Tue, 08 Nov 2022 03:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osEtT-00032u-Af; Tue, 08 Nov 2022 03:03:19 +0000
Received: by outflank-mailman (input) for mailman id 439702;
 Tue, 08 Nov 2022 03:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cq9g=3I=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1osEtS-0002pA-6T
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 03:03:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20062.outbound.protection.outlook.com [40.107.2.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e41b59d1-5f11-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 04:03:16 +0100 (CET)
Received: from FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::10)
 by PAVPR08MB9436.eurprd08.prod.outlook.com (2603:10a6:102:316::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 03:03:12 +0000
Received: from VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::71) by FR0P281CA0128.outlook.office365.com
 (2603:10a6:d10:97::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Tue, 8 Nov 2022 03:03:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT005.mail.protection.outlook.com (100.127.144.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 03:03:12 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Tue, 08 Nov 2022 03:03:12 +0000
Received: from c0939d50d670.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B81613AF-A060-4089-9D11-875BD7790A3D.1; 
 Tue, 08 Nov 2022 03:03:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0939d50d670.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 03:03:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS2PR08MB8645.eurprd08.prod.outlook.com (2603:10a6:20b:55c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 03:02:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 03:02:59 +0000
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
X-Inumbo-ID: e41b59d1-5f11-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZRnlx7fKLE+ISrKjV2v5gI7fuee0byriiohCpNoaPgJbh4kpRYlTnFcMvwAqX0jHgkojCtzOsEPLZ+51OgB6YyNQ7fUEINiTEtHbstGtDUffOS0e3fmm79zWzTCag6j0Zv89Qu+y1MdrhStOshs+TQvl4fnj8/8PzNvRN/QKpTP4J48K5bDHpYTkLsQGK8UxuQJ0EYo76C7QziMOPDrperpG8xjXSoqh5fR7+zGIxIhoFsNKHFQXf9pAI3C8Gixamjj4OWyuklOGGcANn9RTG2yzw6wyejpc4l8d51j/jtu9Ivm+UBGUGN6FImSbXVS0yRZPqgyJWGY+ojw75CZW5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STeUKApHJS6WR6W/DZRdXQ90R5pmFtOSHxb0g5mnbDA=;
 b=Iq70/eqtcc/kMtuTldkUH/59cJSY/RMvSA/xglPhQi0G3D8XKEDMvUiw3ORFTt5VakEuv46oAVWk5qvjTokcEqzBHysZKQ/UpKB3tP8+Oxr1xbI0jaDTG2M7UKVaiVnB55Gxs7kVNXOHrfZDm9oY49A+Z6eMgj4HF7cspTjR/DLpflw4nhDKrkh009cW+CFh63BpgJuH91rSq/lYtusvlFYh8K4egr95TXKothOdvT16TJ25ckL1Mi0ZS89O7FETMsUeyFVWJko3ttXjAHZaRJYaWUhg1ccsj1NgARfGO/PpD249AYGV1bK3Ja3zeTJtGfZ1w3BRiTKQI/jMCdfDMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STeUKApHJS6WR6W/DZRdXQ90R5pmFtOSHxb0g5mnbDA=;
 b=VlRnbK6yzlj3V1jz6bl2huwniWg5xTLW/Bt8zS4e3bsxNaBL/WLgnlBc6Z2ico1eRlzotP8CgNdN1v7a4EdFfQ89RRD5XK0tdmqTQEvhGstYKUZWybe4tcIOgQ6dtFBhZ2xPo1jhEATta8sAGVHdmBar1k9gWwLEEAeK0KvMlCA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9/uACBT/aCt8rZNXyQylrdIZ81ckOhKZmKL86scQFE3ewU2hMg6QtrIPfySX+HvreBhF125PXtYXRdyjiPWvUmF2DF5he92/OZnddzmZ+eUGn30LelazhzzeCri54POGHD0rjGTtf2HkYu+rvh3mwHFUAnrtjaKzrQf4vOqA+3bOVb0IeK0PfFa03RVmuHjDN30TJb//OTYjgDUER8ia0hRV47vufr7xKLsx7vvyTWJ3KKGhqj6TcTJ1sfX/NG/iNAYo+JrolRVBwTPd/5vja6GclAO4nEELvZCOgByHumNZJV9q38akWXh4fiJkGxqs/Z9D9cMxDFAC7ylVT7Kow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STeUKApHJS6WR6W/DZRdXQ90R5pmFtOSHxb0g5mnbDA=;
 b=LcQ9QkBP2/LXhq7RT/t0AqihrmimNuB9XY8rUGgconyxRhB7fiMY5vHjWDAki8+eeVtIq0aPNSbgi6P+tsdEqQeqe2jOCKDi6hosnjTeoUfAu9PlA6ann36kbfHWtnoj0yp3gEyBBjpO2EHCKii1PJcWm9e6XVPC59jH2g1BLRCS2LBjKdJ/T6QX0lthMtFe10Mhm+kz0ncXJkZVu/1E2sAN1X1X5/tvlNTmipRzMa5t6e6IFSQdPBli75B9VOT6+Y7KBuKkzSiTlXJE//mwaaepc3CSwWZuUKTTd1PITOvAm7crZWmZYCjB+nn+Ax5SG8dR462vAOX5GpCiTv/RAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STeUKApHJS6WR6W/DZRdXQ90R5pmFtOSHxb0g5mnbDA=;
 b=VlRnbK6yzlj3V1jz6bl2huwniWg5xTLW/Bt8zS4e3bsxNaBL/WLgnlBc6Z2ico1eRlzotP8CgNdN1v7a4EdFfQ89RRD5XK0tdmqTQEvhGstYKUZWybe4tcIOgQ6dtFBhZ2xPo1jhEATta8sAGVHdmBar1k9gWwLEEAeK0KvMlCA=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 03/11] xen/arm: disable EFI boot services for MPU
 systems
Thread-Topic: [PATCH v6 03/11] xen/arm: disable EFI boot services for MPU
 systems
Thread-Index: AQHY8DVhHYvazJgosk2Tv3EbzhgfNq4yRv2AgAIMODA=
Date: Tue, 8 Nov 2022 03:02:59 +0000
Message-ID:
 <PAXPR08MB74207EA36536AADD2675387A9E3F9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-4-wei.chen@arm.com>
 <a85280bd-de4c-a6e5-c0c3-a4272b6f6af7@xen.org>
In-Reply-To: <a85280bd-de4c-a6e5-c0c3-a4272b6f6af7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 81F0F9946AEC4D45B07241E7D410921D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS2PR08MB8645:EE_|VI1EUR03FT005:EE_|PAVPR08MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: d16d2151-5884-4cce-a208-08dac135c605
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gWfSXY/QGeQgYhb+wWDoLR8kiI+MwuWNANCWUfkHSlEmncOvi6hagRj38BKOLaJ98QOg1DoH/r3cjONK7BYlcUBn9p0RXMD7ibLYDtQC3lEvXOue7VYZ1pp5XfXPXN/8wP25JrMQa4XkPa62DPx1SnQr9cbpghVmF/w095VcGFiwZjZWGnhdjKANJt+zD7PInGB1OvM39/+0OGi4ChHRUPiaYZz09M8ULM1BYgGc46UNeiD0mte0K0y0unkuvxXzTijS8ttKQ+LBXKtqHD+NiLQ5odUNbUpVTgtZaEvN/yXH1nSGJvVXmH1G9iKM6TqJacGCTfzy96jeSzr8flOF+F9p2H/goHMIoXtEpy4Kyer7y/iirkWl7yv51nuO32j0PLxYwKPaUpRp03hBwgX0DZztYd8pRssvQhget0k7xazL9cLfuwae49n1Mlx/BpAaegl1cVJIjOtyP10+We+CSURdC4C5xKoc8oGUFRamGbmLSrrv/TVBwoxziYX7xPnz9Z1M1NqnJNPvweqRSMKFzNP/s+xnBErEhypWlKRSmUkX7SJRLDiT1aUawOYUXGDxiQFC4Nr+9oqqVO2sEYVFPzs/gtkIGHYaumX4S8K21zI6QBlrU5Y8kKpLjum76MSoR82T0ctQLmEw7rh8emczqctvTGqSZV/qve1ZmX/b9D+s0THEEWJStB4AzkVMvirqRZ0oaKIGXr4kFeuJhbTx3krZmxkLCaEkvB7es6MXtLUolETqUKUxK7ZDTRJoUOSPsN6a6Vb8uUPwurPI9NQuBg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(38070700005)(54906003)(38100700002)(86362001)(33656002)(2906002)(478600001)(71200400001)(53546011)(4326008)(66556008)(66946007)(316002)(8676002)(66446008)(76116006)(41300700001)(110136005)(52536014)(5660300002)(8936002)(66476007)(55016003)(6506007)(9686003)(122000001)(64756008)(83380400001)(186003)(7696005)(26005)(66899015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8645
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fddad65b-c6b0-4367-d55f-08dac135be24
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c5QOXk7SHZ5ouENGd7XY3sb5tsrrXwok74wt0tsHgU/3iYyPCQ5v73ElzHwozwGqpLwW8aBpPFsv/ymAxUVODrrCx2VhGuATzcHsW3rtyYFSoPXQae6T63CtPUZBOFYA/UEBQy896wNrf75MmEDNoXIn+mUBwJSNWhla6EQ6AN/Pk1QKk0P4WhwQaNPktEmBK0kU8zmDXVB2P+OsF6XonGxFRvoPCIv4LTm5hNPxyGiN3cmwxDn5jmEC81VkQ4uoJbx+a3+yJoGSI+DuV5POr+XwJweGnrkPqE4wlvqXIH9l25QvTrg1kpsQ7S9lXSyJbVJI9g7rwp5xdh81f2BvqUhIbVJGZ9Z8yeOUW+rD/h/DtlRAfNyEfI7zz6TWPL1oXcoeA4+aM3xuB3TFyROGdWwJdB9aEkA4f42m9SITXfbhKKwQjRugue8a1XigEmzib6f/lYEKEyGrNc2wuaPfIcLE/+hm7wK1H3DLGvzbkrapmpslOU1fK0phRh9mWGTr9xjb6wEjENC1+R0d9loXvr3azca+JXo/pHXgZDieSqoE6eVUiCG096Lmrm9AT+FEq9nky7KC1rLLl+kKjedU9lKaowMady7HojqxTouyYFDFdy1J7IDBDOxX+mRNtbfEOyFMHL74/RE+wx3S24YjxBVWh92C5bYjQ9z+Iu9F3NAmLHbxpGkGXP3cOvst7suRqHB7+EJDs3KCWWa6KomV44f/GGdBHhRDtcKK9PD1aXR1s/K9yblyl4rp/JlzUq1Ui99kLZW72/aak/mrUrRuHw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(66899015)(33656002)(81166007)(86362001)(82740400003)(356005)(40460700003)(55016003)(40480700001)(2906002)(7696005)(47076005)(26005)(6506007)(107886003)(186003)(53546011)(336012)(83380400001)(36860700001)(70206006)(70586007)(8676002)(316002)(9686003)(478600001)(82310400005)(54906003)(110136005)(4326008)(8936002)(5660300002)(41300700001)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 03:03:12.5094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d16d2151-5884-4cce-a208-08dac135c605
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9436

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMeaciDfml6UgMzoxMg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQNCj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAzLzExXSB4ZW4vYXJtOiBkaXNhYmxlIEVG
SSBib290IHNlcnZpY2VzIGZvciBNUFUNCj4gc3lzdGVtcw0KPiANCj4gSGkgV2VpLA0KPiANCj4g
T24gMDQvMTEvMjAyMiAxMDowNywgV2VpIENoZW4gd3JvdGU6DQo+ID4gQ3VycmVudCBFRkkgYm9v
dCBzZXJ2aWNlcyBzdXBwb3J0IG9mIEFybTY0IGNvdWxkIG5vdA0KPiA+IHdvcmsgd2VsbCBmb3Ig
QXJtdjgtUjY0IHN5c3RlbSB0aGF0IG9ubHkgaGFzIE1QVSBpbg0KPiA+IEVMMi4gVGhhdCBpcyBi
ZWNhdXNlIEVGSSBib290IHNlcnZpY2VzIG1heSBuZWVkIHNvbWUNCj4gPiByZWxvY2F0aW9uIHN1
cHBvcnQgb3IgcGFydGlhbCBQSUUvUElDIHN1cHBvcnQuDQo+IA0KPiBJIGFtIGEgYml0IGNvbmZ1
c2VkIHdpdGggYXJndW1lbnQuIFdlIGhhdmUgbm90aGluZyBpbiBYZW4gdG9kYXkgdG8gZGVhbA0K
PiB3aXRoIHJlbG9jYXRpb24vcGFydGlhbCBQSUUvUElDIHN1cHBvcnQuIFNvIHdoYXQgaXMgdGhl
IGV4YWN0IHByb2JsZW0/DQo+IElzIGl0IGJlY2F1c2UgVUVGSSBjYW4gbG9hZCBYZW4gYW55d3do
ZXJlPw0KPiANCj4gPiBCdXQgdGhlc2Ugd2lsbCBub3QgYmUgc3VwcG9ydGVkIGluIHRoZSBpbml0
aWFsIHN0YWdlIG9mDQo+ID4gcG9ydGluZyBYZW4gdG8gTVBVIHN5c3RlbXMuIFNvIGluIHRoaXMg
cGF0Y2gsIHdlDQo+ID4gZGlzYWJsZSBFRkkgYm9vdCBzZXJ2aWNlcyBzdXBwb3J0IGZvciBBcm0g
TVBVIHN5c3RlbXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5A
YXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgfCAyICst
DQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgOCArKysrKystLQ0KPiA+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0K
PiA+IGluZGV4IDFmZTVmYWY4NDcuLmFkNTkyMzY3YmQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2Fy
Y2gvYXJtL0tjb25maWcNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+IEBAIC03
LDcgKzcsNyBAQCBjb25maWcgQVJNXzY0DQo+ID4gICAJZGVmX2Jvb2wgeQ0KPiA+ICAgCWRlcGVu
ZHMgb24gIUFSTV8zMg0KPiA+ICAgCXNlbGVjdCA2NEJJVA0KPiA+IC0Jc2VsZWN0IEFSTV9FRkkN
Cj4gPiArCXNlbGVjdCBBUk1fRUZJIGlmICFIQVNfTVBVDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxk
IG1ha2Ugc2Vuc2UgdG8gYWxsb3cgQVJNX0VGSSB0byBiZSBkaXNhYmxlZCBldmVuIHdpdGhvdXQN
Cj4gdGhlIE1QVSBzdXBwb3J0LiBTbyB0aGlzIHdvdWxkIHJlbW92ZSBuZWFybHkgM0sgbGluZXMg
KGp1c3QgdXNpbmcgd2MgLWwNCj4gKi5jIGluIHRoZSBlZmkgZGlyZWN0b3JpZXMpIGZvciBzb21l
b25lIHRoYXQgZG9uJ3QgbmVlZCB0byBib290IHVzaW5nIEVGSS4NCj4gDQoNCk9rLCBob3cgYWJv
dXQgYWRkcmVzcyB0aGlzIGNvbW1lbnQgaW4gTlVNQSBwYXRjaCBzZXQjMyAoQXJtIGltcGxlbWVu
dGF0aW9uKSwNCmJlY2F1c2UgYWJvdXQgbWFraW5nIEFSTV9FRkkgaW52aXNpYmxlIHRvIHVzZXJz
LCB3ZSBoYWQgc29tZSBkaXNjdXNzaW9ucw0KZm9yIE5VTUEgUkZDIGFuZCBWMS4NCg0KPiA+ICAg
CXNlbGVjdCBIQVNfRkFTVF9NVUxUSVBMWQ0KPiA+DQo+ID4gICBjb25maWcgQVJNDQo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TDQo+ID4gaW5kZXggYWQwMTQ3MTZkYi4uY2NlZGYyMGRjNyAxMDA2NDQNCj4gPiAtLS0g
YS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUw0KPiA+IEBAIC0xNzIsOCArMTcyLDEwIEBAIGVmaV9oZWFkOg0KPiA+ICAgICAgICAg
ICAuYnl0ZSAgIDB4NTINCj4gPiAgICAgICAgICAgLmJ5dGUgICAweDRkDQo+ID4gICAgICAgICAg
IC5ieXRlICAgMHg2NA0KPiA+IC0gICAgICAgIC5sb25nICAgcGVfaGVhZGVyIC0gZWZpX2hlYWQg
ICAgICAgIC8qIE9mZnNldCB0byB0aGUgUEUgaGVhZGVyLg0KPiAqLw0KPiA+IC0NCj4gPiArI2lm
bmRlZiBDT05GSUdfQVJNX0VGSQ0KPiA+ICsgICAgICAgIC5sb25nICAgMCAgICAgICAgICAgICAg
ICAgICAgLyogMCBtZWFucyBubyBQRSBoZWFkZXIuICovDQo+ID4gKyNlbHNlDQo+ID4gKyAgICAg
ICAgLmxvbmcgICBwZV9oZWFkZXIgLSBlZmlfaGVhZCAvKiBPZmZzZXQgdG8gdGhlIFBFIGhlYWRl
ci4gKi8NCj4gPiAgICAgICAgICAgLyoNCj4gPiAgICAgICAgICAgICogQWRkIHRoZSBQRS9DT0ZG
IGhlYWRlciB0byB0aGUgZmlsZS4gIFRoZSBhZGRyZXNzIG9mIHRoaXMNCj4gaGVhZGVyDQo+ID4g
ICAgICAgICAgICAqIGlzIGF0IG9mZnNldCAweDNjIGluIHRoZSBmaWxlLCBhbmQgaXMgcGFydCBv
ZiBMaW51eCAiSW1hZ2UiDQo+ID4gQEAgLTI3OSw2ICsyODEsOCBAQCBzZWN0aW9uX3RhYmxlOg0K
PiA+ICAgICAgICAgICAuc2hvcnQgIDAgICAgICAgICAgICAgICAgLyogTnVtYmVyT2ZMaW5lTnVt
YmVycyAgKDAgZm9yDQo+IGV4ZWN1dGFibGVzKSAqLw0KPiA+ICAgICAgICAgICAubG9uZyAgIDB4
ZTA1MDAwMjAgICAgICAgLyogQ2hhcmFjdGVyaXN0aWNzIChzZWN0aW9uIGZsYWdzKSAqLw0KPiA+
ICAgICAgICAgICAuYWxpZ24gIDUNCj4gPiArI2VuZGlmIC8qIENPTkZJR19BUk1fRUZJICovDQo+
ID4gKw0KPiA+ICAgcmVhbF9zdGFydDoNCj4gPiAgICAgICAgICAgLyogQlNTIHNob3VsZCBiZSB6
ZXJvZWQgd2hlbiBib290aW5nIHdpdGhvdXQgRUZJICovDQo+ID4gICAgICAgICAgIG1vdiAgIHgy
NiwgIzAgICAgICAgICAgICAgICAgLyogeDI2IDo9IHNraXBfemVyb19ic3MgKi8NCj4gDQo+IFNo
b3VsZG4ndCB0aGUgZnVuY3Rpb24gZWZpX3hlbl9zdGFydCBiZSBzdHViYmVkIGFzIHdlbGw/DQo+
IA0KDQpSZXBseSBmb3IgeW91ciBuZXh0IGVtYWlsOg0KWWVzLCB0aGlzIGlzIGEgZ29vZCBwb2lu
dCwgZWZpX3hlbl9zdGFydCBzaG91bGQgYmUgcHJvdGVjdGVkLiBJIHdpbGwgZml4IGl0Lg0KDQpD
aGVlcnMsDQpXZWkgQ2hlbg0KDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxs
DQo=

