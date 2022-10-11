Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8B5FB276
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 14:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420153.664713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiEQu-00088l-JO; Tue, 11 Oct 2022 12:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420153.664713; Tue, 11 Oct 2022 12:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiEQu-00085u-Gc; Tue, 11 Oct 2022 12:32:28 +0000
Received: by outflank-mailman (input) for mailman id 420153;
 Tue, 11 Oct 2022 12:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHvS=2M=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oiEQs-00085o-He
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 12:32:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2785284-4960-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 14:32:24 +0200 (CEST)
Received: from AM5PR0701CA0021.eurprd07.prod.outlook.com
 (2603:10a6:203:51::31) by AM7PR08MB5493.eurprd08.prod.outlook.com
 (2603:10a6:20b:102::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 12:32:23 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::ce) by AM5PR0701CA0021.outlook.office365.com
 (2603:10a6:203:51::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.14 via Frontend
 Transport; Tue, 11 Oct 2022 12:32:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 12:32:22 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Tue, 11 Oct 2022 12:32:22 +0000
Received: from 77a78fb4f2a3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAD49120-7C84-4D12-AA89-71AB4C748BAA.1; 
 Tue, 11 Oct 2022 12:32:15 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77a78fb4f2a3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 12:32:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9743.eurprd08.prod.outlook.com (2603:10a6:20b:615::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 12:32:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 12:32:06 +0000
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
X-Inumbo-ID: c2785284-4960-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bovRSMQALX2r+Ts2sHAQqPNxF5ulfu7oWHofW+PFFRi/GLQFqBCs7tF96Kx6zRgbOSu5F/47Emr6HgOFPJPqGWG/RUR5N438HQzM6dqaB5NfZ0UW4QsVffmcOU2MLy2GzrWxaUqV1QSaVUITcM+/GXb55D5cLHtS5+N4uzLprq2+TzR/KEzi2Dozf48XqR80NzKSf/AFhVMV2Lqc0q8YDOMGicfFfxaqrOI+pnDbgOeC2Dx60tqxlotoAKS92mG/t+PfDazIgC7AJDl+Cabujh8K8LGiZVAytskNlJD3RrOiGjYLrlc0Hil0jaXmGlmaQLRSX0yBAg8s7LFlsI3tBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZo+0/jmC8tf0qBn/Jl7wbtEWwCnGQKx+gcTW/4eJTk=;
 b=C3RXerq7mXlaaBtEr321uW8QyS1qLVC7W0BRSwyPiuAxQ3itazmbGWJAzp0J1JnQjNApDoIZlmTZoIR7SfGKQEFqPw2efNr3lYcNS/hljZwfzpE82HrZ38YSP1EfI4w42RLQNfjkbSefr2474SB8xNbjIdsgelD6D8Ks5651SlZWF40LjKLeMUO0Uu6zI1OZ+G1FUz9UtivL/GDBtvqKsCk6PkPcFYeQN8phMhaf30LSyXT689CF8cxqqsAO4G7dnTWaf5iCSCCQ0XqgxOQ0/bVJGWvxyR7/RqHAnEx6+SL18eyZj5ygaD5dTXSk7rZEjRtS0kIL0+4VRn0KBHOmxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZo+0/jmC8tf0qBn/Jl7wbtEWwCnGQKx+gcTW/4eJTk=;
 b=k44X7J9cLgSIHaJuJEN8ZIMOZGMHQWP7szHLUKhgUYTDo/aZUZ8NjIhfM9MuadrqAqDUBD4kvkKZEiOHOeLUn7svrvr00nwCwMWlLsnoadcds2AlymqCV4WsevnT56dr1LHA2q10KKhfiKSslLNNBx5gxguyZoV4QbFxFxJBawY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+/7Yx2Cyw2dDnsfx+TMMhaKIs+8XIP0D+9FAhfVFFXuB3Uku+ro+U/S4HvM0q79sYsP8ngMd1btPbEG4fqK6PqN0wKhz3ORq/itXbhUmIXNL6nTJ7dGOYvPNwaBjTBxEfc295keti7f7sSkX1b8I7j0dqkor5/uP1PWzdQw8ioHeD1bmNf41v1Huejkoc0ZQvIPp3Fp9TAvfFYel/qXSxuvv8y71k2tagzmhLT3ey5p/Qwtk4zOOWpvqBNn2oH1Sdt0rh0oy7FabFdDVJ/t9M77E7ne85OMW4ntiHpjC9ZUZC2S3tqu8ZhGv51oEqiZ1qrMmWPf8yOzLALDuE1rHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZo+0/jmC8tf0qBn/Jl7wbtEWwCnGQKx+gcTW/4eJTk=;
 b=C1+ahuKroxbAtn1TzuCwHP2Qqmwh8pkEUX+5xu2W9VVqjWdMBqVhriQK3HImwyJoCSK+ukPhS3WS04uCDR45XsHLNxpUIOI1BD2Dms14zmLBb3mqhPYZRzDZ5vy+DXULxhKhn8wSe/uTwRexjTekL5M60VNNQJJ2/lD+AskJWTCR6FBmJfjEbldYHDxrgGljbv6Tw+WIMyKw1b7oaJIvo+5BPs2qPU23vu2UJKnQ/bkK/8AedJiwRPyrQUQriy6SLiOAJ+BQayKm135GK+9V7ircCWdndl2tUPofSUE4dMzM1tALmYnJPmaVqIlQ3jEs/d7WSpCVkuBT3DWTLt9UHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZo+0/jmC8tf0qBn/Jl7wbtEWwCnGQKx+gcTW/4eJTk=;
 b=k44X7J9cLgSIHaJuJEN8ZIMOZGMHQWP7szHLUKhgUYTDo/aZUZ8NjIhfM9MuadrqAqDUBD4kvkKZEiOHOeLUn7svrvr00nwCwMWlLsnoadcds2AlymqCV4WsevnT56dr1LHA2q10KKhfiKSslLNNBx5gxguyZoV4QbFxFxJBawY=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [4.17?] Re: [PATCH] x86emul: respect NSCB
Thread-Topic: [4.17?] Re: [PATCH] x86emul: respect NSCB
Thread-Index: AQHYyNQExUU6HB2zzUWbaDsrkt18Oq4H/XmAgAEhrYCAAAmScIAACn8AgAAV25A=
Date: Tue, 11 Oct 2022 12:32:06 +0000
Message-ID:
 <AS8PR08MB7991EB68457560FB835E978192239@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <b0103a30-22b7-c010-3e8b-6eab1c25ee47@suse.com>
 <f5851974-86ab-8da7-3b5f-4196faae7969@citrix.com>
 <1fc32039-5a3e-5f74-d6ab-059ab8037338@suse.com>
 <AS8PR08MB79917F69AA9899C2A86C3C1092239@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6be3288e-7d08-1e07-1283-c68a2acad88e@citrix.com>
In-Reply-To: <6be3288e-7d08-1e07-1283-c68a2acad88e@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B9D7BA4B197AEC49933DB347229AA6D6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9743:EE_|AM7EUR03FT021:EE_|AM7PR08MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c79e9fb-e93c-4271-7a5e-08daab84a592
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nYI9/XQ73jP2THS2QcpvGbx5PhFYfbVGwcmmL6hlghCALG6NV/Y/lwQhe28lt5rgxUyt2woSoGXFH6Cu0RbzP+Hn1Ltc0fMJ1rfRLzpV79R/y185NClHRktSJrBRHjR6OmhueyUXnEYMLeeR1AyQtDlCWN7JZqpencleKZ2XzaxboOvWJvj8h94va17iTtPIXvQuXdTPln+EKYGzraJZCw7gQG7mw30KjXX0MNTNRkLZrM/F2IQCAt6JW0vjWVIIx8CJOxM97qhP7twEOl5tSst6MwfGc1o/ym9YDq0ZMdP3lWtLUnyUhBQHWi5dDdsSxXkp3tpJlTS05nfXIXV/u5f3KiG4QNV7ohAUrHRs5xgRUFmuEx7dpkHzEZ6ZLxt2ADc8e+uQbaqyGfxW5Z/HEHX3Q32+UYAp0xIPdUZDOtuNk7hn1YLGEV7cHE8ilJP7n4X4GjstyHWPMrTbTB0pzbDLuIHvIe1P9K6mWyuJkgryw4Pq8j/i89DacqGWvttJpXFFhHlrcCNTUpUfyFrLCeO08OIwnrUt5sJEToQJVXTnkXtBx6eVlteyRqcy12w7/1mDYw1TF1W2QR6dwBLZjmHhOFhYMklHLLEE0XR5Fgz4vlcekelWhvURutb0apK/GAeg1VbU/cXb4ZHjUDbtfhA1hnNQA5ODN60ZZ80FEgFFSAhw20NHG/7tKYFJUbYKjA7pNmd7SUTSyhHzGF2i404TrAuoCPgAmUFr9EkeSwNHFQGlXwLcxuP9F7OqX3q8soM9nOIYvq94dDaUtjZ8qQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(5660300002)(52536014)(8936002)(76116006)(4326008)(66946007)(4744005)(71200400001)(316002)(54906003)(110136005)(38070700005)(7696005)(6506007)(33656002)(38100700002)(122000001)(26005)(186003)(9686003)(478600001)(66556008)(86362001)(66476007)(66446008)(64756008)(8676002)(2906002)(41300700001)(83380400001)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9743
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	534841d1-f5c2-453a-eb61-08daab849c11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WVmPoJcKBwxTYkgLQBL513Ic9MRJyVQvgrQGJvtk/SdWASBE8bEdqE7yu+i2T2tzxPiMAPHKHW0QccePqwWk5nbhduPfQCd5ONRD6F8l01HvgHlZGjbF9yB8nysAG0eLEMaBTU1dCG2u20RYRSRrTCqGY9jtyFlP6YGqXE/xF5GXKg1QnCqsgpQl1+9Q88hIGealMqqysk5EIMOlUKT25z2V5gIW5EhF1GNPq4zqraJ8aTu4WbgNM2PWEk9Koer5AhBu/PgMES/+1lJJz4Aon4ceIfjT1+H1nqYcdsAguYSDZipJzo/P7J5sw7UEzSR6e4LFy22/MzkyDeo9MOsnNOpbLxbpdWsf1qy1MA1sZ2jffpjNKvQOgG9MmWXapxYcaOsDmBo65NXRaB9qamsZ3hnjkQKm1EUoQROdIPkv5+QtSUse0xiocN8sGHmp3Xt50EVgpIyFr7VbUau3fYA8VC838cMIPlFdYfRPxuvtE5pum7p9wMbWtcMZFdnQQ0RD7mQ/z+S2N6J51amJQy6RN8ZehStvikfN+KB7y1pQLL62mp+7QT4E2UEkvHCqyD9FNTtRTsnkZiXTAeVXy1XTgaXJj38lEjDKP07CL+9gaJFU7qf4BulBJFuwGHSvT2vUg+/ggdkS+AeuzTg5VjbJSPKTgyNILKJnUe+KZlYLQxYPBg6Rfe0KSYr5bEgY1S7Lj6r41Ca8bYDYH6KlcP1AzwBdfVFxF+Oi1ukhZ69S+r+clcs2RSyW7cBtcSxynXsfzttJZxaMTHG9iq1J26ULCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39850400004)(396003)(451199015)(40470700004)(46966006)(36840700001)(2906002)(4326008)(33656002)(4744005)(316002)(5660300002)(86362001)(70206006)(8676002)(70586007)(36860700001)(82310400005)(54906003)(52536014)(82740400003)(41300700001)(8936002)(478600001)(47076005)(336012)(7696005)(356005)(83380400001)(6506007)(110136005)(9686003)(40480700001)(26005)(40460700003)(81166007)(186003)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 12:32:22.7594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c79e9fb-e93c-4271-7a5e-08daab84a592
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+ID4gKElmIGl0IHdpbGwgbm90
IGNhdXNlIHRvbyBtdWNoIHRpbWUgb2YgZGlnZ2luZywgd291bGQgeW91IG1pbmQgYWRkaW5nIGEN
Cj4gPiAiRml4ZXM6IiB0YWcgcG9pbnRpbmcgdG8gdGhlIG9yaWdpbmFsIGNvbW1pdCB0aGF0IG1p
c3NpbmcgdGhpcw0KPiA+IGAgdmNwdV9oYXNfbnNjYigpYCBjaGVjayB3aGVuIHlvdSBkbyB0aGUg
Y29tbWl0dGluZz8gSSB0aGluayB0aGlzIHdvdWxkDQo+ID4gaGVscCB0byBpZGVudGlmeSB0aGlz
IHBhdGNoIGFzIGEgYnVnZml4IHNvIGl0IGlzIG1vcmUgcmVhc29uYWJsZSB0byBjb21taXQNCj4g
PiB0aGlzIHBhdGNoIGluIGN1cnJlbnQgcGhhc2UuIEJ1dCBpZiB0b28gbXVjaCB0cm91YmxlIG9y
IHlvdSB0aGluayB0aGlzIGlzDQo+ID4gbm90IHJlYWxseSBhIGZpeCB0aGVuIGp1c3QgaWdub3Jl
IG15IGNvbW1lbnQuLi4pDQo+IA0KPiBUaGVyZSBpc24ndCByZWFsbHkgYW4gYXBwcm9wcmlhdGUg
Rml4ZXMgdGFnLg0KPiANCj4gVGhpcyBDUFVJRCBiaXQgaXMgb25lIEkgbWFuYWdlZCB0byBnZXQg
QU1EIHRvIHJldHJvYWN0aXZlbHkgYWRkIHRvIGZpeA0KPiBhbiBlbnVtZXJhdGlvbiBwcm9ibGVt
IHRoZXkgaGFkIG5vIGFudGljaXBhdGVkIHdoZW4gbWFraW5nIGEgY2hhbmdlIGluDQo+IFplbjIu
DQo+IA0KPiBpLmUuIHRoZSBDUFVJRCBiaXQgZGlkIG5vdCBleGlzdCBhdCB0aGUgcG9pbnQgYXQg
d2hpY2ggdGhlIGNvZGUsDQo+IG1vZGlmaWVkIGluIHRoaXMgcGF0Y2gsIHdhcyB3cml0dGVuLg0K
DQpPaCwgdGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiEgVGhlbiBwbGVhc2UganVzdCBpZ25v
cmUgbXkgY29tbWVudHMsIHNvcnJ5DQpmb3IgdGhlIG5vaXNlLg0KDQpLaW5kIHJlZ2FyZHMsDQpI
ZW5yeQ0KDQo+IA0KPiB+QW5kcmV3DQo=

