Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE935A588D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 02:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394751.634275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpVA-0006MZ-06; Tue, 30 Aug 2022 00:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394751.634275; Tue, 30 Aug 2022 00:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpV9-0006KK-TX; Tue, 30 Aug 2022 00:53:11 +0000
Received: by outflank-mailman (input) for mailman id 394751;
 Tue, 30 Aug 2022 00:53:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSpV8-0006KE-Ld
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 00:53:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2081.outbound.protection.outlook.com [40.107.105.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cc1b0bb-27fe-11ed-9250-1f966e50362f;
 Tue, 30 Aug 2022 02:53:08 +0200 (CEST)
Received: from AS9PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:20b:46b::33)
 by DB4PR08MB7935.eurprd08.prod.outlook.com (2603:10a6:10:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 00:53:05 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::d) by AS9PR07CA0031.outlook.office365.com
 (2603:10a6:20b:46b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Tue, 30 Aug 2022 00:53:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 00:53:03 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Tue, 30 Aug 2022 00:53:03 +0000
Received: from d40846f53516.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAFB2BDF-2346-4CCF-99A0-FE49E0EF9738.1; 
 Tue, 30 Aug 2022 00:52:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d40846f53516.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 00:52:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 00:52:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 00:52:56 +0000
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
X-Inumbo-ID: 1cc1b0bb-27fe-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dAowYGBkyPbV9MQC09rsUwqz/Tw/nPCLjTCY5DnLzxPwAeRbhBDV99otG4UEnictQFEGeYR8ZSnmK+6h8QjE4p/VCSWTXs+Fg/AGwwc/S94AyxjE3O8fi88ELTZ360hW6AfhbwyPowIQDzzREypMu3sEK0aVJtNjV3MH15A9VDG/HuQlPSTsSKkSeqjmfMjEt+pxDbgVztnlJe/UdsfWadZPoHkYvLYk2ZsAFz6GSMnlU6J1V1AdaZOyXY/S+DL/IpjtpAhazC3IUkN24GcP9EVzYcBMoeLhN00WRQcl/S3R5SOGDZNne+yeNUUYhNfvzsQvq1cVg1KWGROE99PIsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po+ym3haD4dd013MRDyISNl2D1o494H0wJEy34PqJbs=;
 b=MsrkRlaYpZ0HfYXe5RmV5OWuX2eNNrYnZr7X7kKqHotivajgeJYPD52ja1zJ32THoyeQcB7oxMO+VrJCPqZ0T+LC8Ex3O2vKNzSAnKJsyD8Ol83m5abw4uXVPFtFIyUGOEO68ffxhSXaoK31+J4gnFE3ZPCKTTshTDBtgqvQdXMKGKyXp58c23I8Rxv9XGZUqx6DowwmCb6FumxDx8+nlhPvTvG5KZLxXmNacnv82htqobGDRAqn4uzqrnLMzby3+koR64EWVEnrXPUY6eeAHFZkJVfgWT/NdbJE+5KrRvxM9gwgNb0GaFmGH73xa6bnL00+S+xk4mC1ed78HzrpaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po+ym3haD4dd013MRDyISNl2D1o494H0wJEy34PqJbs=;
 b=peb/usVHcJO8FrWpsK9oY3LT8ZrNm10I/QlpEmAUtOYRx7i4N6pMX6BVM3cX9ufZXLDOhhRyuv98DhuYdD1+xx6aEgJHXMGD204oxhpE4av/DtZVY98OxiGtI2ABQwKLrDGj7soFWmtA5UeBkc9DZYuwu610yrWT5B9YYx8arqo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MT2HxAslqU+TM/mBMScxyAY3jmxk1xamV8BlDHr+sTSg2KaoqIWNpzrpP2sEYLqeNLJueWeVufhTkjyrCWgIjTcfKxBRFgMu98jlg3j2KUCuMbY+rLC5iLawtLUPIbV3uUyAycN66e2ApgZ70HSHCJrIZzvUli2t2Wl1yGu+WZRlVuQAs2EiXgmVO+xKENtRGr6jvGrl/yL7fq/gHkarqDUSeqDDh4BGzFmfF7FkEjLIYXPfK6O994J72S7yVp76eG+Y1DGDeb/GCNzTO2QBC250gh4H4LYFOvwLwbSjvUQQ4SCFHOxkiRYGBYjYvIjOsvRjiWE5PnDpRfurqLToTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po+ym3haD4dd013MRDyISNl2D1o494H0wJEy34PqJbs=;
 b=d7WCqChrfexcREgocgBdCWzgyKAYuDf4kk55Mxw2oUSIjLClAZiCm3xVGDBfEOgd+VyYgvU9EGSRckEdxcKNwz03gdwRnAoZCSjMClP87JkLhAgpRzwAQnfg9WsTiETZPb8acLJ9+oYmdTALOqMQdduTY98eiWTcaVT5jzFjZJzeDZCcZTfkPRxB2PHszpJjSwI1ap/OTkawtS+r4AmE8lS1aK9hTYRSsePgy/MaAu8E/Dql0W4tFwQFg0S8bt5q55w/CN1WzSRQYlmX0oetSxA1dckzUVFT+VaD2wjUoP+cNG5FKUMp9j63cOSJQsyDE3dYAf0ZBnc3VlfnTA1D4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po+ym3haD4dd013MRDyISNl2D1o494H0wJEy34PqJbs=;
 b=peb/usVHcJO8FrWpsK9oY3LT8ZrNm10I/QlpEmAUtOYRx7i4N6pMX6BVM3cX9ufZXLDOhhRyuv98DhuYdD1+xx6aEgJHXMGD204oxhpE4av/DtZVY98OxiGtI2ABQwKLrDGj7soFWmtA5UeBkc9DZYuwu610yrWT5B9YYx8arqo=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] x86/public: move XEN_ACPI_ in a new header
Thread-Topic: [PATCH v2] x86/public: move XEN_ACPI_ in a new header
Thread-Index: AQHYuGftYa+h04RcYEK+Oaks92E1n62/YK6AgAdDISA=
Date: Tue, 30 Aug 2022 00:52:56 +0000
Message-ID:
 <AS8PR08MB7991B63FCB602B85E3E0618C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <c869f79901968de2d71ab56e1bbb5d43048baf5d.1661420219.git.bertrand.marquis@arm.com>
 <7dbef184-7e55-51d7-27e1-93153b5f0bc9@suse.com>
In-Reply-To: <7dbef184-7e55-51d7-27e1-93153b5f0bc9@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DFB939F4D47DEC4182BD6C9A48FF168E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 046f5fd8-f7bf-4384-2a74-08da8a21fed2
x-ms-traffictypediagnostic:
	DU0PR08MB8471:EE_|AM7EUR03FT018:EE_|DB4PR08MB7935:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bL/BHGnkqvODjwxtsVKtUGHiiMcQJa34OABYVBUOaMnkG9V4DQ1duNWEOseyX/Rcxq/X/7n3zk+Meue5eVCWxJgTcILS62Nrp+DTe2RDT+t95Qsc5zH+WEmIl1KePmqgQQZkq7K99bn5Oe9bdU4zRS57YDsfvfH1ppitbiCdx9H+W51zZaIzLS5aiWY8f5hvsoqidpDJe9asIdpgUwL2q347BM+phd3paQYWn1gryQKdUcPsTa+E0q3jWEO5qORlIVfHjsBAXc6Bnw0d3uIPf9gZO4iCcH+4CzK06xex8PPVx75eb9xD4D7wnKBwrKAer12B8kLll9GAAY7ZMU/3jo1r7fi/n01ARCIEvjyYrZy1f7iEKUKdkkpzb+29KyTCWGpQ8qhIybFxwIg78OAo5DuebOPI6F/Xc27pPSEoY2/VYOWseM5J1v+o890EdgNx/NmI9o+LHeAu/0oUU5Ogxe7N6dp24/h5KFmM2nuvYDijKXKGYx6VY/cTbw53j4RFnaKqBZ58ZTM0DwYMuUc7m7wCYgdZdBMSt27BqSWP2NzuoBXuHsEbcaCJ/jUMUI2Un2DzRuuo60A3EZuuvkWZGsZv1nNOVynjNQODHrTiVH6FvNS5n4GsJOz+VDqisLvQvJg50No8ErpncP79ApWzqQZtwUE3CnRxg8wSuCxSXu/iJpW77wuPMloKnG4/VBY/YxLbh50hydr4xg3oRgXsrjYuH4hduURWNQWYwxRCixoeV13E76WEih13A1snZbz+8g+LZfI3rqZel4WVqVuGzQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(66946007)(8676002)(64756008)(4326008)(76116006)(66556008)(66446008)(122000001)(33656002)(38100700002)(86362001)(38070700005)(53546011)(83380400001)(186003)(41300700001)(6506007)(478600001)(26005)(71200400001)(6636002)(9686003)(110136005)(7696005)(54906003)(55016003)(316002)(5660300002)(2906002)(66476007)(8936002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8b9ae7f-aa8b-40d4-f97d-08da8a21fa74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M1cIktZz+bBHgBLRLyfAFB9aK3gHkdPCfDhgxDIygNVoz7I+cfdwsHcsbG8pImurQevEysc5+YYO2kJmCQUP+l8n+bT6IuU4Y5ueEIRMXxMTUYnf2apNMw44wvtzHaYwjq5Y7a2rz7eSEQUon4umxgjAwHitfT8pb5Aeq6tGWn2+AS5QPnIu3HQgoYxlrjuXZHQsjFUmT7e9z+1BEWPhC7pjJY41dYycjooVFqUMUGplgOZ0KTewISlJ8uzK2aNjROXDPH1ggWa55tloW8blPeVacW1W72yfy6jVT7HgInLWpn5k/gMwJm3WpC56ZNr9kV+d4gbDZb7ldbYrZeY5vxWlEqp3rEG7LoavbchQ17aLC1fl2Fig840czyDDS/ts/w2Uhl8bUjb6kr6BuBmuQG9hQwNiN2+KBgM0ZqjXrZklaH7TR1fSyWjzUh7bO/ilLpuwKD0hl16itEeWEHHZc/3xQMmlCZEH8xTPD2ur7MYgabqE7nGSAtUdcuhEgknyfdh+OwbQqVCUJK0ycCRwetj2lXRvsz9sMnkDqX35ZbsHmmlHD3sXysvJvzmLpd89t6MOA8LwEk6N++j1CsKvOTLXG7EAQ9ePQRMq8ezkbPlFnEHoOFIvJJzlGlNq5hShXSQR2Gj099xwX/CVNguCdXZgbcMKqIpwVdJBKBZzP5lfAW7oV4/8Rm7DCcopOV8ck2Cv931JYXzWNlH3MqbY16ODFjANg6zyTw+wiTo7ryBLqeKkKMFdHPui1KtBTplFswTcszgaTcxCfoYpjJ6xKA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(40470700004)(36840700001)(46966006)(6636002)(110136005)(316002)(82740400003)(356005)(186003)(82310400005)(86362001)(81166007)(54906003)(36860700001)(83380400001)(2906002)(40480700001)(53546011)(55016003)(40460700003)(70586007)(8676002)(70206006)(4326008)(336012)(52536014)(478600001)(9686003)(33656002)(41300700001)(7696005)(8936002)(6506007)(47076005)(26005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 00:53:03.9461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 046f5fd8-f7bf-4384-2a74-08da8a21fed2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7935

SGkgSmFuIGFuZCBCZXJ0cmFuZCwNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBJIGhhZCBh
IGNvdXBsZSBvZiBkYXlzIG9mZi4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjJdIHg4Ni9wdWJsaWM6IG1vdmUgWEVOX0FDUElfIGluIGEgbmV3IGhlYWRlcg0KPiANCj4g
T24gMjUuMDguMjAyMiAxMTo0OCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4gPiBXaGVuIFhl
biBpcyBjb21waWxlZCBmb3IgeDg2IG9uIGFuIGFybSBtYWNoaW5lLCBsaWJhY3BpIGJ1aWxkIGlz
IGZhaWxpbmcNCj4gPiBkdWUgdG8gYSB3cm9uZyBpbmNsdWRlIHBhdGg6DQo+ID4gLSBhcmNoLXg4
Ni94ZW4uaCBpbmNsdWRlcyB4ZW4uaA0KPiA+IC0geGVuLmggaW5jbHVkZXMgYXJjaC1hcm0uaCAo
YXMgX19pMzg2X18gYW5kIF9feDg2XzY0X18gYXJlIG5vdCBkZWZpbmVkDQo+ID4gYnV0IGFybSBv
bmVzIGFyZSkuDQo+ID4NCj4gPiBUbyBzb2x2ZSB0aGlzIGlzc3VlIG1vdmUgWEVOX0FDUElfIGRl
ZmluaXRpb25zIGluIGEgbmV3IGhlYWRlcg0KPiA+IGd1ZXN0LWFjcGkuaCB0aGF0IGNhbiBiZSBp
bmNsdWRlZCBjbGVhbmx5IGJ5IG1rX2RzZHQuYy4NCj4gPiBJbnNpZGUgdGhpcyBoZWFkZXIsIG9u
bHkgcHJvdGVjdCB0aGUgZGVmaW5pdGlvbnMgdXNpbmcgaWZkZWYNCj4gPiBfX1hFTl9UT09MU19f
IGFzIHRoZSBkZWZpbmVzIGFyZSBub3QgdXNlZCBhbnl3aGVyZSBpbiB0aGUgaHlwZXJ2aXNvcg0K
PiBhbmQNCj4gPiBhcmUgbm90IGV4cGVjdGVkIHRvIGJlLg0KPiA+DQo+ID4gUHJldmlvdXMgdXNl
cnMgbmVlZGluZyBhbnkgb2YgdGhlIFhFTl9BQ1BJXyBkZWZpbml0aW9ucyB3aWxsIG5vdyBuZWVk
IHRvDQo+ID4gaW5jbHVkZSBhcmNoLXg4Ni9ndWVzdC1hY3BpLmggaW5zdGVhZCBvZiBhcmNoLXg4
Ni94ZW4uaA0KPiA+DQo+ID4gRml4ZXM6IGQ2YWM4ZTIyYzdjNSAoImFjcGkveDg2OiBkZWZpbmUg
QUNQSSBJTyByZWdpc3RlcnMgZm9yIFBWSCBndWVzdHMiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEJl
cnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4gDQo+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiA+IEZvciB0aGUgcmVs
ZWFzZSBtYW5hZ2VyOg0KPiA+IC0gcmlzazogdmVyeSBsb3csIHRoZSBkZWZpbml0aW9ucyBtb3Zl
ZCBhcmUgb25seSB1c2VkIGluIG1rX2RzZHQgYW5kDQo+ID4gZXh0ZXJuYWwgdXNlcnMgd291bGQg
anVzdCBoYXZlIHRvIGluY2x1ZGUgdGhlIG5ldyBoZWFkZXIuDQo+ID4gLSBhZHZhbnRhZ2U6IHdl
IGNhbiBub3cgY29tcGlsZSB4ZW4gZm9yIHg4NiBvbiBhcm0gYnVpbGQgbWFjaGluZXMNCj4gDQo+
IEknbGwgZ2l2ZSBpdCBhIGxpdHRsZSBmb3IgSGVucnkgdG8gcG9zc2libHkgcmVsZWFzZS1hY2sg
dGhpcywgYnV0IHNpbmNlDQo+IHN0cmljdGx5IHNwZWFraW5nIHRoaXMgaXMgYSBidWcgZml4LCBJ
IHRoaW5rIGl0IGNvdWxkIGFsc28gZ28gaW4gd2l0aG91dA0KPiAoYXMgbG9uZyBhcyBub3QgYWN0
dWFsbHkgb2JqZWN0ZWQgdG8sIG9mIGNvdXJzZSkuDQoNClRoYW5rcyBmb3IgaW5mb3JtaW5nLiBZ
ZWFoIGRlZmluaXRlbHkgbm8gcHJvYmxlbSBmcm9tIG15IHNpZGUsIHNvOg0KDQpBY2tlZC1ieTog
SGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPiAjIEZvciB0aGUgNC4xNyByZWxlYXNlDQoN
CktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiANCj4gSmFuDQo=

