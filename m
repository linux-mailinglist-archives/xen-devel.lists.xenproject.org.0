Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F7577ACA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 08:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369255.600575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDJwe-0004tk-0T; Mon, 18 Jul 2022 06:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369255.600575; Mon, 18 Jul 2022 06:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDJwd-0004qj-TU; Mon, 18 Jul 2022 06:09:27 +0000
Received: by outflank-mailman (input) for mailman id 369255;
 Mon, 18 Jul 2022 06:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrJR=XX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oDJwc-0004qZ-SZ
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 06:09:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bfbf3cd-0660-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 08:09:24 +0200 (CEST)
Received: from AM5PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:206:14::14) by VE1PR08MB4671.eurprd08.prod.outlook.com
 (2603:10a6:802:ad::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 06:09:20 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::58) by AM5PR0301CA0001.outlook.office365.com
 (2603:10a6:206:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Mon, 18 Jul 2022 06:09:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 06:09:18 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 18 Jul 2022 06:09:18 +0000
Received: from bbd765527ea1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB02A38C-9D95-4629-967D-C853B9E2DF18.1; 
 Mon, 18 Jul 2022 06:09:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bbd765527ea1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 06:09:08 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 06:09:06 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 06:09:06 +0000
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
X-Inumbo-ID: 2bfbf3cd-0660-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EAO4+/EjOMJCta00dWFrfMTr2C820Ika2ffMzmN8dsKo9LKfbQrg2ijU/OUczpgfGKMWCoV4rniJB8eMZrTImJkJiZwdYcyOPx0t6yBUngLL8p48cs7/7FpQwdIcxEJEbE5qwCYCWRloYBnHNLX5oBK/t6yCvabnhH/SGRQHHyYFXnKpbArVAWAnIPqJ8BsMGD1lJ193jyIQK0PTiiBuC0HWpPgDnRyzhfxCDr71dUZwcWtXErpasr3TctcJl5kZIHHswQcqnhvMEPkr2u3F0gVwEDvQ8GZ6y86Ea8G32+ky6dgb8eW84YYarBavFfJA/Wbg2RgaQP1RzqTqDKwurA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECWi0u5Qd/LatKWNWwU26XIJrdW3oc6HoJjq49c6keA=;
 b=Wx0pqrB0oy7fJmuVx1/9oHHTl4xXMoAUpny6zs+ZdUCa2SbaZJflrRIiMayEzMzxY31zsuclUmeqOdAXy9iGAJrw+LzV2k1565DaTIKdXAE7W60Ve7A2afscx3vappE756wJk7j3HrJQf1fEaptMxqSU9yOmyUtc+0be6LqpbCpF50cNv8hkogpffVPSwRl+lKT4BG+C4mDcV/vIHvNpqMCDe7JDCczDHVCRocRPhODQlJr83kHAkV7Dq9wuf27lGsm7XOSk2uL3i3MlWRfBJUi9pgACzBoqoEK+I43xzlFUeKlL6w2pvlWCazk6NAeKat698Jq0Nska4Tx93fG8Bg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECWi0u5Qd/LatKWNWwU26XIJrdW3oc6HoJjq49c6keA=;
 b=sKcbej+MNa2z/6NbCAKGkgC/99U01XtOZdRUH7Kx8uBxi6p7dZIcNqxHZw/RNIPdQjcqo1Yeivwm+Un05VBQ7qotOXg9ObDhtP4Yz0Cunb0xtiqx3NY/ZcRYejcw04+a0ESYzjn+HCZa0J5qBZTWx0WEXWdencqi9JcX54Yar/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI+WFRQ1AXbMkccqP9gP/wu4W5QSE+1cZLyhH+0iAzRHvOf/oYyX8S3wUr1dCuzv4MdjTzBT9pU0HTg6Kkonq2bz0+OOGFmTxAOjX0WrrcI03SPM1cy7NvUP8QFmauIAXMyXWeXnp55B0/46rYcLAylLIqsXlEhuocafgjVLVRbNKMXwqEHR47d/9M02g1CgQ2dBgnPYJDIsPnQ6ZaCaMSislkJgq2fcglWarEDJzPeyJ4s4MN6PzjswwR5m8SshxE3M5pM/L7EeQ8J6grJp8SQjilAcRo/+3FKug/URsQ8AxZPUrPQbcNL5mmFFy7IEXWK90nTttmnzobNTblWpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECWi0u5Qd/LatKWNWwU26XIJrdW3oc6HoJjq49c6keA=;
 b=WdDpGBKHSHbl2XX7Wc2iOUbyZXdG/GBEALbLTRBQV6jAvJZVcnf1NJPewDklxWnlFNV6x1LTMOAdQlr7VABC/0wzToxDrDBPxSe8SZNQIReDT4A2RTJl8yJq9q3MCmxhjAnleL2GZe8rhTmXFQvvbOfAb/L0fDHBohIDnNrJYxFxqTc17Wu+taJsFUbGn0l6l6dYLME5FWu667+VyWdkBT1eopbZvbceHr7ThP5ESa1ipKPNXGhxATqG2IbjlXIDK47KRdlRXwxkEV8I+1fvMqRVWqDnr8p35p3LkoH79BiRVNMFdMsCBUJ9NJNOfPRAOSDCjBCeh+NsoCBFhcl3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECWi0u5Qd/LatKWNWwU26XIJrdW3oc6HoJjq49c6keA=;
 b=sKcbej+MNa2z/6NbCAKGkgC/99U01XtOZdRUH7Kx8uBxi6p7dZIcNqxHZw/RNIPdQjcqo1Yeivwm+Un05VBQ7qotOXg9ObDhtP4Yz0Cunb0xtiqx3NY/ZcRYejcw04+a0ESYzjn+HCZa0J5qBZTWx0WEXWdencqi9JcX54Yar/o=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 2/9] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v8 2/9] xen: do not free reserved memory into heap
Thread-Index: AQHYkeMzaseZ5YPTu0ykk9py2DMCTK10bf4AgA88QbA=
Date: Mon, 18 Jul 2022 06:09:06 +0000
Message-ID:
 <DU2PR08MB73251BEFE0ECB32A1623FB9FF78C9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-3-Penny.Zheng@arm.com>
 <670588e9-48aa-779c-ec5e-88d6b9d12a76@suse.com>
In-Reply-To: <670588e9-48aa-779c-ec5e-88d6b9d12a76@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3E3E7605B7C7E84493DE4AC0BDD5522E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5d6bde5a-beee-4f93-ba08-08da68840ce8
x-ms-traffictypediagnostic:
	AM6PR08MB3496:EE_|AM5EUR03FT043:EE_|VE1PR08MB4671:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WnYzdTejtlzf9kplBmGed4zTxrMWUKIjUcVrWbyktcnAoVzZCWXxTvf5MFBhyTtsmnbtLNianIdGVVmx9f6QwUMnl0pVz+/MYlurlDEojJDw6PxuEdnd4E1I0xmlnGtU8QMFgRgkKiPJ2j0F7/SaYeXVyigwaZQCyZrSTXkDUTVXS7Mw+DcYL2rAkqKAcfLVNEI1ygbuWmFV7r72SJoAmDs+NSfrKrKLMG5Cloka8RylNJf+U3lX4JIyzczUf/ybiqCBZ4hIYZ2LDqpDtRnE2yTxjMi4Tmd3VEI893QdvyqqSPH/hREvGL1DeNWHsOcryTGGLw62odKpv7ET/s92rFs75QPj9jFAlLet3gGcB90xZ9/hxPfHHciq6bdk/Q6TnHTTN0VZim7kcaL/ep9H7cNQxYQz5IffXUpFOUwFD6FX2yLvuvjUzwmu523nO8mZnHulMAbB0fM6CqZxrrsKWrSZtvBaesP5ac0NbldImIwP4IEyzLGQcqoacriyVyQxasi2It2s4o6aS+wfN6HqLSrb95547p0YcoSO2f4GC8Y4WViE9Q660lykKGukjpLz7flSMXJvSUsst8dAxfwmezDH41bW1gekE0ecFBnCScbSS+k7I5SKpnJteEtHDNlCZxJPPW+DAOIwbFlO8Z6xxljNNTF9LDSQJ5bh5bDeriY4bFTnujc1id2A6ZgtI1T7SXecV/HIKC6fhaqZcTYF+SAjtT5F7Px05imTtPxVGnJW1nvWTGV+6+wLztLepm8UfzU+oIurYf8i5WK4HF/5ImEef8MNtRQJXJ1db/bj/NJmZS9GFMGgzr7Eojd/puIH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(6916009)(316002)(122000001)(38070700005)(38100700002)(66556008)(66946007)(76116006)(4326008)(54906003)(8676002)(64756008)(66446008)(66476007)(71200400001)(55016003)(26005)(33656002)(2906002)(41300700001)(186003)(9686003)(83380400001)(52536014)(5660300002)(8936002)(53546011)(86362001)(7696005)(6506007)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3496
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a268509-8d34-45e4-06b0-08da68840568
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B/wg5y+tgvYUZyX6nie8eb/hat3epZIqoAc/ryosyYNl87dXUGbMAsdy8tls+pvYQimJaey3XNomx4Wrax8CVxgjG7+t6Z/IcOcLsN+OdKpjZFFK/HjEl55cFdDMKRBKBjyPIT9nRFN0noXWKzmhtdQhYjoHlcgfKCwClleZ5+AcVJ1vI4K99fY+24Da8mrPuZn3hTiUW5Z8wgS83sYscvrRgpk4oFIB9vYO/kndWtlu6d2s+hpcxd7GmGf5qx0KSCOtRfJaEOg28JS0BWYxc44ebjp94Oqpp94934/j3N47exWwERbBqR3A+CkT5zneYaZ494lbEm9HEElxw0yIbG6FZh40OcBmtbvnq0yn8EpcGf9uOzg9o8C+D27oNdparwHdCo2LSU5009KCxYSGYA53I33sPsg8RIvpeCIeLrDcKyhiaEmFrlcKpCe269hvJmViahUptsQjvenc2PQ1SosMZ4yTFDHnwlqb2y3H0hW9WdgSebAUb1LBVGq+KOmvIHN6b9zWHKYXCyegDo202gmwAoQSIMFyHbe41cnDMkibnzuDn7ONv6rlsel1Va6moO8MZaSzl557jrJ++9EacHLNTbluek4VtWsxg2Bd3Yw4RjaUiA+LEdPn4MrWmhetPElqw+2wa5Kw8uk0SIthC4dMzhaOi+SCQXIaEmgeFCOq+XNHQyCOUIpgr6oR0N/z9AL9gAxumfiqeZGpQIrTa8VFP8FeHENEZO33hMLu4+6YgbLs83axtVqkT//DHgbtEeuI9sD8+LHu6cFec9iI7bpb+MdNyLjnVwYcPvuJGw0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(136003)(396003)(376002)(36840700001)(46966006)(36860700001)(47076005)(336012)(55016003)(40480700001)(83380400001)(81166007)(186003)(54906003)(70206006)(70586007)(316002)(8676002)(478600001)(41300700001)(6506007)(7696005)(2906002)(6862004)(53546011)(8936002)(5660300002)(9686003)(86362001)(52536014)(356005)(82310400005)(82740400003)(26005)(33656002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 06:09:18.7115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6bde5a-beee-4f93-ba08-08da68840ce8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4671

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgOCwgMjAyMiA4OjQ4
IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdlaSBD
aGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IEJlcnRyYW5kIE1h
cnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMi85XSB4ZW46IGRvIG5vdCBmcmVlIHJlc2Vy
dmVkIG1lbW9yeSBpbnRvIGhlYXANCj4gDQo+IE9uIDA3LjA3LjIwMjIgMTE6MjIsIFBlbm55IFpo
ZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQo+ID4gKysrIGIveGVuL2Fy
Y2gvYXJtL21tLmMNCj4gPiBAQCAtMTYyMiw2ICsxNjIyLDggQEAgdm9pZCBwdXRfcGFnZShzdHJ1
Y3QgcGFnZV9pbmZvICpwYWdlKQ0KPiA+DQo+ID4gICAgICBpZiAoIHVubGlrZWx5KChueCAmIFBH
Q19jb3VudF9tYXNrKSA9PSAwKSApDQo+ID4gICAgICB7DQo+ID4gKyAgICAgICAgaWYgKCB1bmxp
a2VseShueCAmIFBHQ19zdGF0aWMpICkNCj4gPiArICAgICAgICAgICAgZnJlZV9kb21zdGF0aWNf
cGFnZShwYWdlKTsNCj4gPiAgICAgICAgICBmcmVlX2RvbWhlYXBfcGFnZShwYWdlKTsNCj4gDQo+
IERpZG4ndCB5b3UgaGF2ZSAiZWxzZSIgdGhlcmUgaW4gdGhlIHByb3Bvc2FsIHlvdSBtYWRlIHdo
aWxlIGRpc2N1c3Npbmcgdjc/DQo+IFlvdSBhbHNvIGRvbid0IGFsdGVyIGZyZWVfZG9taGVhcF9w
YWdlKCkgdG8gc2tpcCBzdGF0aWMgcGFnZXMuDQo+IA0KDQpZZXMsICJlbHNlIiBpcyBuZWVkZWQN
Cg0KPiA+IEBAIC0yNjUyLDkgKzI2NTAsNDggQEAgdm9pZCBfX2luaXQgZnJlZV9zdGF0aWNtZW1f
cGFnZXMoc3RydWN0DQo+IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4g
PiAgICAgICAgICAgICAgc2NydWJfb25lX3BhZ2UocGcpOw0KPiA+ICAgICAgICAgIH0NCj4gPg0K
PiA+IC0gICAgICAgIC8qIEluIGNhc2UgaW5pdGlhbGl6aW5nIHBhZ2Ugb2Ygc3RhdGljIG1lbW9y
eSwgbWFyayBpdCBQR0Nfc3RhdGljLiAqLw0KPiA+ICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8g
fD0gUEdDX3N0YXRpYzsNCj4gPiAgICAgIH0NCj4gPiArDQo+ID4gKyAgICBzcGluX3VubG9jaygm
aGVhcF9sb2NrKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArdm9pZCBmcmVlX2RvbXN0YXRpY19wYWdl
KHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpIHsNCj4gPiArICAgIHN0cnVjdCBkb21haW4gKmQgPSBw
YWdlX2dldF9vd25lcihwYWdlKTsNCj4gPiArICAgIGJvb2wgZHJvcF9kb21fcmVmLCBuZWVkX3Nj
cnViOw0KPiA+ICsNCj4gPiArICAgIEFTU0VSVF9BTExPQ19DT05URVhUKCk7DQo+ID4gKw0KPiA+
ICsgICAgaWYgKCBsaWtlbHkoZCkgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIC8qIE5CLiBN
YXkgcmVjdXJzaXZlbHkgbG9jayBmcm9tIHJlbGlucXVpc2hfbWVtb3J5KCkuICovDQo+ID4gKyAg
ICAgICAgc3Bpbl9sb2NrX3JlY3Vyc2l2ZSgmZC0+cGFnZV9hbGxvY19sb2NrKTsNCj4gPiArDQo+
ID4gKyAgICAgICAgYXJjaF9mcmVlX2hlYXBfcGFnZShkLCBwYWdlKTsNCj4gPiArDQo+ID4gKyAg
ICAgICAgLyoNCj4gPiArICAgICAgICAgKiBOb3JtYWxseSB3ZSBleHBlY3QgYSBkb21haW4gdG8g
Y2xlYXIgcGFnZXMgYmVmb3JlIGZyZWVpbmcgdGhlbSwNCj4gPiArICAgICAgICAgKiBpZiBpdCBj
YXJlcyBhYm91dCB0aGUgc2VjcmVjeSBvZiB0aGVpciBjb250ZW50cy4gSG93ZXZlciwgYWZ0ZXIN
Cj4gPiArICAgICAgICAgKiBhIGRvbWFpbiBoYXMgZGllZCB3ZSBhc3N1bWUgcmVzcG9uc2liaWxp
dHkgZm9yIGVyYXN1cmUuIFdlIGRvDQo+ID4gKyAgICAgICAgICogc2NydWIgcmVnYXJkbGVzcyBp
ZiBvcHRpb24gc2NydWJfZG9taGVhcCBpcyBzZXQuDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAg
ICAgICAgbmVlZF9zY3J1YiA9IGQtPmlzX2R5aW5nIHx8IHNjcnViX2RlYnVnIHx8IG9wdF9zY3J1
Yl9kb21oZWFwOw0KPiANCj4gTWF5IEkgc3VnZ2VzdCB0aGF0IGluc3RlYWQgb2YgY29weWluZyB0
aGUgY29tbWVudCB5b3Ugc2ltcGx5IGFkZCBvbmUgaGVyZQ0KPiByZWZlcnJpbmcgdG8gdGhlIG90
aGVyIG9uZT8gT3RvaCBJJ20gbm90IHN1cmUgYWJvdXQgdGhlICJkeWluZyIgY2FzZTogV2hhdA0K
PiBoYXBwZW5zIHRvIGEgZG9tYWluJ3Mgc3RhdGljIHBhZ2VzIGFmdGVyIGl0cyBkZWF0aD8gSXNu
J3QgaXQgdGhhdCB0aGV5IGNhbm5vdA0KPiBiZSByZS11c2VkPyBJZiBzbywgc2NydWJiaW5nIGlz
IHBvaW50bGVzcy4gQW5kIHdoZXRoZXIgdGhlIG90aGVyIHJlYXNvbnMgdG8NCj4gc2NydWIgYWN0
dWFsbHkgYXBwbHkgdG8gc3RhdGljIHBhZ2VzIGFsc28gaXNuJ3QgcXVpdGUgY2xlYXIgdG8gbWUu
DQo+IA0KDQpZZXMsIEp1bGllbiBhbHNvIHJhaXNlZCB0aGUgc2FtZSBxdWVzdGlvbiBvbmNlIGJl
Zm9yZSB3aGlsZSB3ZSBoYXZlIGJlZW4gZGlzY3Vzc2luZw0KYWJvdXQgaG93IHRvIG1ha2UgdGhl
IHNjcnViYmluZyBzdGF0aWMgcGFnZXMgYXN5bmNocm9ub3VzbHkuDQoNClJpZ2h0IG5vdywgc3Rh
dGljIG1lbW9yeSBpcyBlaXRoZXIgcmVzZXJ2ZWQgYXMgZ3Vlc3QgbWVtb3J5IG9yIGFzIHNoYXJl
ZCBtZW1vcnksDQp3aGljaCBib3RoIGNhbm5vdCBiZSByZS11c2VkLCBzbyBhcyB5b3Ugc2FpZCwg
c2NydWJiaW5nIGlzIHBvaW50bGVzcyBhdCB0aGUgbW9tZW50Lg0KDQpTbyBoZXJlIEknbGwgb25s
eSBrZWVwIHRoZSBzY3J1Yl9kZWJ1ZyBvcHRpb24sIGFzIHN5bmNocm9ub3VzbHkgc2NydWJiaW5n
IGlzIGFscmVhZHkgaW4NCmZyZWVfc3RhdGljbWVtX3BhZ2VzLg0KDQo+ID4gKyAgICAgICAgZHJv
cF9kb21fcmVmID0gIWRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKGQsIC0xKTsNCj4gPiArDQo+ID4g
KyAgICAgICAgc3Bpbl91bmxvY2tfcmVjdXJzaXZlKCZkLT5wYWdlX2FsbG9jX2xvY2spOw0KPiA+
ICsgICAgfQ0KPiA+ICsgICAgZWxzZQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGRyb3BfZG9t
X3JlZiA9IGZhbHNlOw0KPiA+ICsgICAgICAgIG5lZWRfc2NydWIgPSB0cnVlOw0KPiA+ICsgICAg
fQ0KPiANCj4gV2h5IHRoaXMgImVsc2UiPyBJIGNhbid0IHNlZSBhbnkgd2F5IHVub3duZWQgcGFn
ZWQgd291bGQgbWFrZSBpdCBoZXJlLg0KPiBJbnN0ZWFkIHlvdSBjb3VsZCBlLmcuIGhhdmUgYW5v
dGhlciBBU1NFUlQoKSBhdCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbi4NCj4gDQoNClRydWUsIHRy
dWUuIEFTU0VSVChkKSB3aWxsIGJlIGFkZGVkDQoNCj4gSmFuDQo=

