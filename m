Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735FB5B0296
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401308.643147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsz2-0002oV-R7; Wed, 07 Sep 2022 11:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401308.643147; Wed, 07 Sep 2022 11:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsz2-0002ln-Nf; Wed, 07 Sep 2022 11:12:40 +0000
Received: by outflank-mailman (input) for mailman id 401308;
 Wed, 07 Sep 2022 11:12:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVsz0-0002lc-C3
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:12:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faefcd50-2e9d-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 13:12:37 +0200 (CEST)
Received: from AM5PR0601CA0074.eurprd06.prod.outlook.com (2603:10a6:206::39)
 by GV2PR08MB8318.eurprd08.prod.outlook.com (2603:10a6:150:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 11:12:35 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::f2) by AM5PR0601CA0074.outlook.office365.com
 (2603:10a6:206::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 11:12:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 11:12:34 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 07 Sep 2022 11:12:34 +0000
Received: from 23270e56d60b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D039955D-99BC-4BDA-9025-AD8400FCE720.1; 
 Wed, 07 Sep 2022 11:12:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 23270e56d60b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 11:12:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8155.eurprd08.prod.outlook.com (2603:10a6:150:91::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 11:12:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 11:12:24 +0000
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
X-Inumbo-ID: faefcd50-2e9d-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RmdHr0mozKoDr1W74jdEzUJ/QRdBC/ecHDMtOA55YnHDIC7vMarmuHNBWq63DwDfnZ11J6+GkiI263L57SDRUiWg9sArcYLKIgE97lNf6vHnxDjDoVf2hoacPG5JtA/szn09zCHFFmxo1ymjVj0udEhsyc29US7hmngf46YECqjwrbS87PruOP81QzYJ9JX6raDGVmX0Y6t2F5RxXACBmECaa4pCKygTEb8GzCtSm6YnmEPu43eO1+5g2IPbLecDbNs9ld86sKIbY3wSwcuTudROP7O/N2THLh51+vdnfE3wQnjd6O4z2ZIOWSjdXksKgmIEHF758TQzyjRGzl4WIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/ImRGUKclv4L01W4gnUgTQ2PXKpJkMORfZP2Q730zQ=;
 b=adNfckj6dOoIMaWnAkZOjubdLlBbV1tH/ApHSe27z0vmAZXLkJtiyboj/uZTs5xxIdPHbw0VIYBwuI5+bC2RSSaVcQNc20LMZOl6l1Fv7V19otGHuXpiDmpQqg4YEw1PcvUo3AYUzuIEvDZRLUXwxwMaEVnF9O1Lw/CvP80aDgnkFnjLnQum8hPU4Mn42mXy+AG4IphEv/MpZUKBoar9UstSxnHLAEOpKWdzR9wfB3S2PkkSwkqXsTobmebY2Fkuz7uvdTWDrKC5o7hoxLqCvyJ49UHkRNATANVph40y/siCW1AyYXGaF1Jt3gDXqVOHMmuwVHVCURQQo4GF7xDSmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/ImRGUKclv4L01W4gnUgTQ2PXKpJkMORfZP2Q730zQ=;
 b=W/wig3skAjx7hXuMJKrKpzYwNkp63TZYPshVeebFFSUoPBTXAv/tM0oAdZGEeJ40gXLjjKWS9krSPQNobUDV/5Lcl65Ai41vsqw5fEpkqLS2S14HKQ/NConB1huL7HN+xq0wjmJLAY0OOkTdawS8UGZFrr1ZdHjVfrARC9MN4ss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a5b8a48b78c9707
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co1MfP+smSvjLv49ZvGCblkPWSy54CVM/x5VGeGoDYl0+SpPnePhTeyhvPM20IjVBdgD3KTmM+kcy4a2cVWI03t8pxYPp87XzcuiKrNi9CLcgPnv87GgeGLSQBgsYhllsmeUcFr4WjYke9lXBpOTcBPvE5ByDazdRUKRL+qwUqL8NJNbvnZeGnEVDRiB5OZ43KJ9NjyjYkhuiRZYDOJUwM3wzTiCFbvboztN2OjORd2lBjo4OgqyoSIq6lTpxDwPZ8s04IR63h+n7TXX4ontiIrhrfA40OTz1XVpAuRMRAmBoTe3NYW3MX/mukoUdUreOmvHUj3wDB/lKesrDaDfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/ImRGUKclv4L01W4gnUgTQ2PXKpJkMORfZP2Q730zQ=;
 b=M3/RFEObSrr18r8LkR15KV2HvQeC7t20/jtuOBBtvLLxjDaBxV5WCqDc6XeJ0Nrvb1m9VNFzcwe1e1DOqeI4tSoWARG6e4b+U7uqE5Sbs62DNhntq1krfbLG8MA7QGeC1BiGpBlwQ5ZkP7QMGmUDVsV3wvtz5IoNjErxHA9o/FlpN8r5SG/XloAvi89jtfCGkYApLOvOsXvMELcYb7jVT+h/USaOriNabwsOlR6Fx/7vpiicl67dAIP3j5NXUET3Oe885DicN+pXlRjK9DhP72V4owPwzgAHzwJB8/Ie779nEg9kbniMvAsnq6FNjQsWp2hbwUHplzpwu6mltmsbeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/ImRGUKclv4L01W4gnUgTQ2PXKpJkMORfZP2Q730zQ=;
 b=W/wig3skAjx7hXuMJKrKpzYwNkp63TZYPshVeebFFSUoPBTXAv/tM0oAdZGEeJ40gXLjjKWS9krSPQNobUDV/5Lcl65Ai41vsqw5fEpkqLS2S14HKQ/NConB1huL7HN+xq0wjmJLAY0OOkTdawS8UGZFrr1ZdHjVfrARC9MN4ss=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Topic: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Index:
 AQHYweQzyVikzADCFE2Bfo+zYT5rgq3ToyoAgAABNgCAAAHYAIAABH8AgAAAyoCAAAC7AIAABHeAgAAOWQCAABGIgIAAAQ0A
Date: Wed, 7 Sep 2022 11:12:24 +0000
Message-ID: <C61236ED-5F5A-44C3-AED9-867CF80F078F@arm.com>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
 <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
 <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
 <57d2eb45-bdbe-02b3-4ada-10ff278d699b@xen.org>
 <10E7EFB2-65A4-4092-9DC5-71825BC9595B@arm.com>
 <5ce7f63c-5ba5-f2cb-8e3e-f6dd2d9d76f7@suse.com>
 <524F3B92-5298-4BE3-864D-A076A8873800@arm.com>
 <Yxh7tycPrb8YXXXK@leoy-huanghe.lan>
In-Reply-To: <Yxh7tycPrb8YXXXK@leoy-huanghe.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 66079fd9-7f47-4499-cfb9-08da90c1dd8e
x-ms-traffictypediagnostic:
	GV1PR08MB8155:EE_|VE1EUR03FT026:EE_|GV2PR08MB8318:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6+gWzG4ahjH9fMG9QBa2/rtoxzxkXxaRNS01tTIHyEmhPW9CB+oBJmk1ShSQZoYq6Uzk7qw3Jf0lklYHaY9IYRoscKIO0GhqNOmz9iq1aZX7KWtnVQv4dcuMOH67vOpHL3AZ0n0GCCWynWEmIG+UQmgHvBrHexgmR7DtcZq37PzbJ6XzoR9NmFXifLeYp7ix9Hnzq90mKCJUUlJk19R4nTiRwmfJ2Pke5PP4f8kQh4/nMAsNrsPsAznJjH2MwxhqkYzkE77CBboOzlnIsHDkbOibqiUqx1rou57Ltxon54vT0KPmOLuGbnhP8q9ct6EjN6urT2LqWpekJPesCsA8nHACD/YtwRcmWdKAGnYCt5UEEAMFjkdIMDSeyVfOcSinDeMLvietMFY7OQ4g/RoT6RWGb8LwqhWPEUZ6WakGE02Fqhh8KbgBh/sQ4Hbc43Ywi29uJ2yB5cXH9RbuXoX5DdnS2ZHV4HQUFxk/9xp+rhvVlOHNj6C+he2F6dsqZXZ8y6CGoscea2co/JK45x/1+o66jJ569lNVgOnVglutZunRl29oG4lCiYpwvGvuJHZLacokKDezXaC/P0a0MqB92PpAwa7mc86N2rC8p97hVA9nOJMsnf2vGaT+UCr9IRndQCwvwUOWLj7YrsbaLDk10R87c8W1aJBqbQGQoiWkp7d0xj1KF9uV3U51XbZGWbpPr+iIKEUkdC+ZP0lKRgqo7UyF1UKPLi1PsZDHcrvu/FmbBkVFl0hGtD1tBUXoq74Fa+v95Gofak8/7xB9gkxQhgOndrs32DJL2ptsjLtgvuA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(478600001)(53546011)(71200400001)(38100700002)(26005)(6506007)(6486002)(6512007)(41300700001)(8936002)(2616005)(2906002)(6916009)(36756003)(33656002)(54906003)(86362001)(186003)(8676002)(4326008)(64756008)(5660300002)(66476007)(76116006)(66446008)(66556008)(66946007)(91956017)(38070700005)(122000001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AC2FEB69B0682428DF8ABA20453FAF6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8155
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4425b620-9dae-4a28-84c0-08da90c1d794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QYzRME0eGQPmCIldv2IrYwws3jo02eHgjJ0OU4eY8wvcvEv1NDpGWh6d3r1pIKi1L5j8rp7MQZITUcpPGrKDvjQ6KHnoIbvTprIHchZmAPQ1/9z/xij6YN6VVa7/JFUWyUJPLFBolF398pPpoWE1UPWddg/JNS1039Nfl62wyjxG6wI3n0Hg34BTBaG6yLT+VP9vEXzpVK3bBAe/zheGGWGOUz1DBSnzX+VLHlHBgEW/MtUQ0N/G+oLqhnksDQTCANwZVUv+xARpqSXTYIC/4WO410cheLhaI8zojaEfzBL2hkVAgwq6ctOv5deG+Db3GqkhHlikLJLM788yrxtFb3t3UL9XPvYYEVEleyjTPPZx7jrs0vwTnPWUsE2NXtAtzzTcZvnE2acbLqByf/VLIIpJ6Axfj1weo5kV92PhMV7D4QYMTAfeQNfBjQzB2gpT7ZantoumXaY1F5+lsTWWAcgab8BPTvCY/5+2XkezEkgFj2Cmr7YXFH9+FauumdEWb5f6IYozEUOiVxVIZbDY6uu+i5ukCM3HOEi2NtMPsYtjK2UqrIAnTI+EjK01pSdYwhI9ihPN5m/3nQ5Z02KOXvG/1frM+s5PANRHv7HVtZB3qzDg47j9sO/DWv04tavuKR5R76oeXunm90tmBbtwUBhxJLu/S0LTMHqe5nfWV36w9zbjiws7+MGq4cvAll9VqlsO7KX1dcDwBLQLk0MCt68ivxA4nGj12MvGxZfarbv3kaMQcVvYi4SFZQ7lLODR6CRRZMh5Of8/RQG+bUXxug==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(40470700004)(46966006)(316002)(36860700001)(8676002)(356005)(70586007)(4326008)(70206006)(82740400003)(6486002)(2616005)(81166007)(186003)(336012)(41300700001)(47076005)(40460700003)(6512007)(6506007)(54906003)(53546011)(26005)(8936002)(478600001)(33656002)(86362001)(2906002)(6862004)(5660300002)(40480700001)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 11:12:34.5308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66079fd9-7f47-4499-cfb9-08da90c1dd8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8318

SGkgTGVvLA0KDQo+IE9uIDcgU2VwIDIwMjIsIGF0IDEyOjA4LCBMZW8gWWFuIDxsZW8ueWFuQGxp
bmFyby5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBTZXAgMDcsIDIwMjIgYXQgMTA6MDU6NTRB
TSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4gDQo+IFsuLi5dDQo+IA0KPj4+Pj4+
IEkgdGhpbmsgYSBkZWZpbmUgaW4gY29tcGlsZS5oIHVzaW5nIHN0cmluZ2lmeSBpcyB0aGUgZWFz
aWVzdCBzb2x1dGlvbjoNCj4+Pj4+IA0KPj4+Pj4gQWghIEkgdGhvdWdodCB5b3Ugd2VyZSBzdWdn
ZXN0aW5nIHRvIHR3ZWFrIF9fc3RyaW5naWZ5LiBUaGlzIGlzIC4uLg0KPj4+PiANCj4+Pj4gQWxz
byBwb3NzaWJsZSBidXQgYSBiaXQgbW9yZSB0cmlja3kNCj4+Pj4gDQo+Pj4+Pj4gI2RlZmluZSBY
RU5fU1RSX1ZFUlNJT04gIl9fc3RyaW5naWZ5KFhFTl9WRVJTSU9OKSIuIl9fc3RyaW5naWZ5KFhF
Tl9TVUJWRVJTSU9OKeKAnQ0KPiANCj4gSnVzdCByZW1pbmQsIFdlIG5lZWQgdG8gZGVmaW5lIFhF
Tl9WRVJTSU9OX1NUUklORyBpbiBjb21waWxlLmguaW4gcmF0aGVyDQo+IHRoYW4gaW4gY29tcGls
ZS5oLCBzb21ldGhpbmcgbGlrZToNCj4gDQo+ICAjZGVmaW5lIFhFTl9WRVJTSU9OX1NUUklORyBA
QHZlcnNpb25AQC5AQHN1YnZlcnNpb25AQA0KDQpWZXJ5IHRydWUgYnV0IHlvdSB3aWxsIG5lZWQg
dGhlIHF1b3RlcyBoZXJlDQoNCj4gDQo+Pj4+IFF1b3RlcyBhdCBiZWdpbm5pbmcgYW5kIGVuZCBz
aG91bGQgbm90IGJlIHRoZXJlLg0KPj4+IA0KPj4+IEkgaGF2ZSB0byBhZG1pdCB0aGF0IEkgZGlz
bGlrZSB0aGUgU1RSIGluZml4LiBJJ2QgcHJlZmVyIGEgc3VmZml4ZWQgdmFyaWFudA0KPj4+IChl
LmcuIFhFTl9WRVJTSU9OX1NUUklORykgb3Igb25lIG9taXR0aW5nICJzdHJpbmciIGFsdG9nZXRo
ZXIsIGUuZy4NCj4+PiBYRU5fRlVMTF9WRVJTSU9OIChhbGJlaXQgSSBzZWUgImZ1bGwiIGFzIGJl
aW5nIHBvdGVudGlhbGx5IGFtYmlndW91cyBoZXJlLA0KPj4+IHNpbmNlIG9uZSBtaWdodCBleHBl
Y3QgdGhhdCB0byBpbmNsdWRlIFhFTl9FWFRSQVZFUlNJT04gYXMgd2VsbCB0aGVuKS4NCj4+IA0K
Pj4gDQo+PiBWZXJzaW9uIGlzIGEgdmFsdWUgc28gaGVyZSBJIHRob3VnaCBpdCBtYWRlIHNlbnNl
IHRvIGRpc3Rpbmd1aXNoIHRoYXQgb25lIGFzIGl0IGlzIGEgc3RyaW5nIHJlcHJlc2VudGF0aW9u
IG9mIGl0Lg0KPj4gDQo+PiBYRU5fVkVSU0lPTl9TVFJJTkcgaXMgb2sgSSB0aGluay4NCj4+IA0K
Pj4gSSBnZW5lcmFsbHkgZGlzbGlrZSBhbnl0aGluZyBuYW1lZCBGVUxMLCBFWFRSQSwgQkFTRSBv
ciBvdGhlciB3aGljaCBhcmUganVzdCB1bmNsZWFyLg0KPiANCj4gWEVOX1ZFUlNJT05fU1RSSU5H
IGlzIGdvb2QgZm9yIG1lLg0KPiANCj4gSGkgQmVydHJhbmQsIGp1c3QgbGV0IG1lIGtub3cgaWYg
eW91IHByZWZlciB0byBjb29rIHlvdXIgb3duIHBhdGNoIGZvcg0KPiB0aGlzIChlc3NlbnRpYWxs
eSB0aGlzIGlkZWEgaXMgY29taW5nIGZyb20geW91KSBvciB5b3Ugd2FudCBtZSB0bw0KPiBmb2xs
b3cgdXAgZm9yIGEgbmV3IHBhdGNoPyAgRWl0aGVyIHdheSBpcyBmaW5lIGZvciBtZS4NCg0KUGxl
YXNlIHB1c2ggYSBuZXcgcGF0Y2ggYW5kIGFkZDoNClN1Z2dlc3RlZC1ieTogQmVydHJhbmQgTWFy
cXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4g
DQo+IFRoYW5rcywNCj4gTGVvDQoNCg==

