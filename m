Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BB615E1D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435631.689251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Mx-0004aV-EM; Wed, 02 Nov 2022 08:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435631.689251; Wed, 02 Nov 2022 08:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Mx-0004YA-B1; Wed, 02 Nov 2022 08:45:07 +0000
Received: by outflank-mailman (input) for mailman id 435631;
 Wed, 02 Nov 2022 08:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unuU=3C=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oq9Mv-0004Gr-KD
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:45:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a535d61f-5a8a-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 09:45:04 +0100 (CET)
Received: from AS8PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::28)
 by PA4PR08MB6191.eurprd08.prod.outlook.com (2603:10a6:102:f3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 08:45:02 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::2e) by AS8PR04CA0203.outlook.office365.com
 (2603:10a6:20b:2f3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Wed, 2 Nov 2022 08:45:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 08:45:02 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Wed, 02 Nov 2022 08:45:01 +0000
Received: from 948600757415.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD4DF0AC-0A94-4486-8B2D-9F048D943312.1; 
 Wed, 02 Nov 2022 08:44:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 948600757415.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Nov 2022 08:44:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7884.eurprd08.prod.outlook.com (2603:10a6:10:3b0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 08:44:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 08:44:52 +0000
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
X-Inumbo-ID: a535d61f-5a8a-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ch47SOG89eC4UWI44ZqDtpRTTtHVWJ74elZBBfI+m0vTWBI9IwIxEdCHDrlDhZqX5aL6oW/1e9QsDE0kUe7cBaoUrcMpOhcdzVe28hliK02Nbeht84HCfLMEKFePiqShn+odv2Ff1Y736BohVDGCimJ/4RIFKD2VdjLnrjV0IaRr/CDKTRlBhfMMTRZvwYYYovKlH8ceYuLuhaWwe8SrqIR5Y+dXLIMZnSxa0yFjGvRnXufXeYlsBtrN05Qvi1A9V0/l8/fmOV669B1yzVpgB2LeVx7+nvMCFiVjfGRU71m8fKlo/lfbq+0Ypg7RYJJxBreqoy3UB6k3i5RjYD5+xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK4jbHfGL94GP7JAH7C2CgduJanU8YTRpFQRxy7Cm04=;
 b=OSFJ9i+uEQtAkHO09G9SxJLsOD3pgMOdodVorllPbDVVkeaClT3AOy0sBvdYfPaxfn9faky2chIw8yG/oXrmLq2XBHIvUViJQYV+6zq7U8ZfnqZxOKsncntczJhpnXL6lq9jNnRRAV8l3gF1YAyuAI/l4p/m+UPvVvg366ctF2QWQMEvB5vq2uuOIvrFBLskuluHQn2n6KRkoAvBcqVX5mY07inP7QBu2RjD8HMAXLYhOnosazr+wBIa4fEPtsAcpYht6MiCoQ2xFVbBB2OurNobLbE1TWXxS4/6H78ZWpR+pra0/So7oObMtVbKuyItquc69Dk2grHEBFIqaRmlDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK4jbHfGL94GP7JAH7C2CgduJanU8YTRpFQRxy7Cm04=;
 b=NPbYcHCSykTwTBgU/Pv5qcv/sE1ipf+gke6IPkC68C1RdT14JYgPdBDnO7CTwKgDAWh9DIgybo2MTyRZ0/67FOvwgwAyMhbZgZ322n8t5hyQWp2xPaYNVTLOfvS2mL+fMiuOofGCFM2g52tvqUuO+M9Xdg71gevzZxDQRsOqJ30=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKPt+DA0pJS5DGVHa/6/kslw4mAR9ZPYPp4YIkf0TCsjOV56ufZMROH1An3ng8wIMABFTHGZZvBXhdc+mgYI/cyvpOlChmLkJIgF2kKruwtGZ3uYh6PBVqLkxR550IO4oTkS8LwkMe6ZwLWukT5DbxzOLka9wV7M4Y0lfwJRGgeTTZVfB5IghLqKdQG/YBZ/7UTfCeN9FDVGLR9pVhLnp253ZKxTzaY3Eu7plThdYJtoZJEZ2143SCDjaT5HxUKKhU4Qo7aVRTyclYX9W5Lj6vMsRBx+pXEuxckLG/qVIkJCmgIs38rfUNeYqIOHynyYldJz45f0FYuC0yMP2HwUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK4jbHfGL94GP7JAH7C2CgduJanU8YTRpFQRxy7Cm04=;
 b=lZS08AD312nF8wUuqAk83ATYTgOgPUXtU8Yh+Ty6VZgWjPFExg3D8e0BNQCXpeOOW+fa5e4Vrked11WtsK8qDtVfWAegHCtKC1pE6HZi/5Cb5npvPAYIJLvRx2txifYOnwK/oXMe9gjIGgJECGmNyUP+LmqwsvD1Aylh63oBf+5mo7BAAktKr86PSWtDV/B30nywGrC6/W+z6ye1Y/mWn7dURcLXOnstv6v1hkB+bt7RyJ6Toxe71ZR+lo+Sv8TYUJ8BGPxmY8I/42EAuw81KFcPBVIsDNuGNKYDY7kRj0hG2psa2/HGpN1bGhc3LvXWm6A1MaQHY8jJOa/JgePqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK4jbHfGL94GP7JAH7C2CgduJanU8YTRpFQRxy7Cm04=;
 b=NPbYcHCSykTwTBgU/Pv5qcv/sE1ipf+gke6IPkC68C1RdT14JYgPdBDnO7CTwKgDAWh9DIgybo2MTyRZ0/67FOvwgwAyMhbZgZ322n8t5hyQWp2xPaYNVTLOfvS2mL+fMiuOofGCFM2g52tvqUuO+M9Xdg71gevzZxDQRsOqJ30=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Julien Grall <jgrall@amazon.com>
Subject: RE: [PATCH 02/20] tools/xenstore: call remove_domid_from_perm() for
 special nodes
Thread-Topic: [PATCH 02/20] tools/xenstore: call remove_domid_from_perm() for
 special nodes
Thread-Index: AQHY7ga8TbV3UfvVg06BXOIqShILHK4rUcKAgAAAoDA=
Date: Wed, 2 Nov 2022 08:44:52 +0000
Message-ID:
 <AS8PR08MB7991761B3FC6675E6209C4F592399@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-3-jgross@suse.com>
 <0a0d2d20-bba7-e802-a1aa-476390cf38a8@citrix.com>
In-Reply-To: <0a0d2d20-bba7-e802-a1aa-476390cf38a8@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9EB0839AE561CD41B93F1E656E51B0BE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7884:EE_|AM7EUR03FT006:EE_|PA4PR08MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 481b7c6f-dd8b-451e-8606-08dabcae8837
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6KxubFG7NjbmsvjZgag8oiJRkRtSsXKYS4hVFBu5/QsDoIOAySR0Ql9GV9ohl/XTuriJ49AHdisrKPpI0O3lMhVaOquHU7YK5pIdZ+fYs5k1VuInRbXgaIE0n+2ozEUgv+gX8W5i4DtipPMoXjo78cBtttn1O/JJ602H5UslU80oUn/D5/YD5KY1HVK1YcYig6aVp3WiUBvB/wFtAqRcqmi8POX2jcsTrV43n9AxPoWSNL+yFmjzHddMNKB6izBy4WeOc+lsiHo1DiprBoh9AESnjVl/zkQVnsg0YX0v17HqaYh5b/oBK2GCILqkidqJ+n6FsFWC7uQ2pixep66nseTeWoFSR5pch9nEhwqI9hgSSM1RmT4VTmGj+/lmJDyqgJLlj84E48bcqa9dtK6+NHVpSt4kpmW/RZz8d2YPYuayOnEXi2T/Y8N21YVU4c9kGBOxmVi8pNASrMfeB1udZZUnPczUDXP9dHi++WIh4eH7D1Xv9hjNYZrI6tFHL74KiTpbL7tVYf0n53e3BpFCRMON/pcVox824kpj0maPuSXvRCNv313vJIlz0EWJj19vKRpOJyZ0afQRn0Ixr5WOfR1AFvlzUBDQcZoNpeCwonOtPZHEWlulh6r9wdSiobapPFNR/CJlGtug8/mzrTXwC2Nx/s/lCIgLkxBbDg1RHnou044BAVuEDl/jQAQguXYgJezU6j+XtuMhwNn6CJz5wnFiFgFij0uTfOEPhlIvI2FZ1K7371HCfhu/Vd/TpoPY6A9u8/HZRAMB//YOkh+fxQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199015)(55016003)(186003)(478600001)(4744005)(9686003)(26005)(86362001)(38070700005)(33656002)(52536014)(122000001)(8936002)(2906002)(38100700002)(7696005)(53546011)(5660300002)(6506007)(71200400001)(41300700001)(83380400001)(316002)(66476007)(64756008)(66556008)(66946007)(54906003)(66446008)(4326008)(8676002)(110136005)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7884
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	414c2e9b-fe73-40a1-d8b8-08dabcae827e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aWJp3wa+ExTJC7STc02sHY6wJ0noQI94nLbhhv2rGLGR9MM7XHnSg/Y7ElsEPrV/k2Oq2mrMcJaum1yHCTfqa7cPnZy+rEsq2NbNssSNC7nopfTlXEdvGBfFSTzXfIwc+YaaGss63iIj+xX+5B0OJtxqCJYH0EgUPCtiNa2UxA3p8toPkK2o2ILjbz8QfwjzGAWfzgFp49BGsYiWYsyGSQMI0kFGYfHA9oks2ob/KgnRQHZ5uj6SeJ8qfwgYKAgR5CtviXsT04RaWAy0o+9Kdiwk8W5EpSkMJQpe2AOq4lJCg4ofAX299Oc/D8L4s6IUOarkx4YUvOCDL0Ywi6ko85+RZsAaZAqkjcgADjJXGxKAXy2f+4uGKNgFudswabfl62DeWRR7BIQV+qaMHD6ELbh10/H1ijqiimND6JSZppcdpq+NGAZRfeBM1EY2Z+nnrbkqmvT63Z2bH4RD78HjMi3R+dtbVeyIIPXyLkczfrprzmlcKa8BSTnhVg7rFMPmzZHf23OuLv6DEXXqkRh00ffxgsDm7aRb7GzcEU4Rj+EjTDRqM4PmRXwWDbbjIugwJ+EBgW30OuAHRZlw6BH1iE+0dybCvpDktiD67ZW4MOsP4Y9+CMWey48Tx9kfrT1Gc+d+l4FMLSyru66jiRKLOmT66v8eEMAFUv6Y2CnRdcYGdirDx+ak/34/nDQZJfmYY4I9uOTv7Ieyi8HrIZYUfMH7SzNAoLT4Y1qK2IqHzPoYhCAohXwsStbkcjbvaXOfQPvGWz3vM8AFzpSvZkVF/w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(8936002)(2906002)(4326008)(110136005)(54906003)(33656002)(41300700001)(70586007)(8676002)(70206006)(83380400001)(52536014)(478600001)(316002)(55016003)(40480700001)(356005)(81166007)(36860700001)(82740400003)(107886003)(6506007)(7696005)(86362001)(53546011)(336012)(186003)(47076005)(40460700003)(26005)(9686003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 08:45:02.1549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 481b7c6f-dd8b-451e-8606-08dabcae8837
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6191

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMDIvMjBdIHRvb2xzL3hlbnN0b3JlOiBjYWxsIHJlbW92ZV9kb21pZF9mcm9tX3Blcm0oKQ0K
PiBmb3Igc3BlY2lhbCBub2Rlcw0KPiANCj4gT24gMDEvMTEvMjAyMiAxNToyOCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4gPiBXaGVuIGRlc3Ryb3lpbmcgYSBkb21haW4sIGFueSBzdGFsZSBwZXJt
aXNzaW9ucyBvZiB0aGUgZG9tYWluIG11c3QgYmUNCj4gPiByZW1vdmVkIGZyb20gdGhlIHNwZWNp
YWwgbm9kZXMgIkAuLi4iLCB0b28uIFRoaXMgd2FzIG5vdCBkb25lIGluIHRoZQ0KPiA+IGZpeCBm
b3IgWFNBLTMyMi4NCj4gPg0KPiA+IEZpeGVzOiA0OTYzMDYzMjRkOGQgKCJ0b29scy94ZW5zdG9y
ZTogcmV2b2tlIGFjY2VzcyByaWdodHMgZm9yIHJlbW92ZWQNCj4gZG9tYWlucyIpDQo+ID4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiA+IFJldmlld2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4gSGVucnksIHRoaXMg
b25lIGFsc28gb3VnaHQgdG8gYmUgY29uc2lkZXJlZCBmb3IgNC4xNyBhdCB0aGlzIHBvaW50LCBh
cw0KPiBpdCdzIGEgYnVnZml4IHRvIHNlY3VyaXR5IGZpeC4NCg0KWWVzLCBJIHdhcyB3b25kZXJp
bmcgd2h5IEkgZGlkbid0IGhhdmUgYW4gZW1haWwgaW4gbXkgaW5ib3ggYWJvdXQgdGhpcw0KcGF0
Y2ggOikNCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29t
Pg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBBcyBub3RlZCBpbiB0aGUgY292ZXIg
bGV0dGVyLCBpdCBpcyBSLWJ5IGFscmVhZHkgYXMgaXQgY2FtZSB1cCBpbg0KPiBwcml2YXRlLCBi
dXQgd2FzIHVsdGltYXRlbHkgbm90IGluY2x1ZGVkIGluIHRoZSBzZWN1cml0eSBjb250ZW50Lg0K
PiANCj4gVGhhbmtzLA0KPiANCj4gfkFuZHJldw0K

