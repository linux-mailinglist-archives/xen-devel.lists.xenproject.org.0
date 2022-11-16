Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B583862B16E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 03:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444133.699007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov8Kw-0003JZ-Ah; Wed, 16 Nov 2022 02:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444133.699007; Wed, 16 Nov 2022 02:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov8Kw-0003Hn-7Y; Wed, 16 Nov 2022 02:39:38 +0000
Received: by outflank-mailman (input) for mailman id 444133;
 Wed, 16 Nov 2022 02:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ov8Ku-0003Hh-JR
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 02:39:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6b363ea-6557-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 03:39:33 +0100 (CET)
Received: from FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::11)
 by DB4PR08MB9262.eurprd08.prod.outlook.com (2603:10a6:10:3f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 02:39:29 +0000
Received: from VI1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::50) by FR0P281CA0091.outlook.office365.com
 (2603:10a6:d10:a9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Wed, 16 Nov 2022 02:39:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT059.mail.protection.outlook.com (100.127.144.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 02:39:28 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Wed, 16 Nov 2022 02:39:28 +0000
Received: from 90ac78ffd114.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B22D9BCC-492A-4779-9598-9DFF38B927C5.1; 
 Wed, 16 Nov 2022 02:39:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 90ac78ffd114.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Nov 2022 02:39:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6483.eurprd08.prod.outlook.com (2603:10a6:20b:315::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 02:39:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%7]) with mapi id 15.20.5834.007; Wed, 16 Nov 2022
 02:39:15 +0000
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
X-Inumbo-ID: e6b363ea-6557-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PQtvfzn0B9EKD8B/cX14eepmMdB3LqMutpgoBx21Q8=;
 b=5Nn8xy9wgEJsxA+xu2xkSAsTGHUcwJ+i5fQku07Dp49oxMX51eHIW6YzV9WdS8LDfzsq/AUXlEUbALu89N58Ph/wWDiG7JhgJVZ31YyOva/RMr8m9TJheaFmQAmMSd6UlXtRABhHV+AYrfE9d/LW3eIcGJ/meiQlIoiGB2BB0LU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G558g/PsINp/YcXbFlu91LBe9QMekH+yUWZPScFeNqQzC51qaG0E6354f+ri7fQ6kLCJJtRyWVyWvwQ6vZmnMiKdUrIs36mLyUWyzs56KIqQdePhQumqqcN6kWscR9qOtGlTu1IjXWzGaaDJzCvgXqyL/bR9ULlGan50bGinnZoHEvAbkt3d7t5YmK274NjUNia1lLCvvmb8Zot+fo/fpWAANR6ftPxZt9icEwjmqRJnNjeXyQNTQQtLgBbmsDPVUmaV43iGs0uGAYXfhwHTK+90jt3AOpHBzvxlro2MpzFXVw9IiTN/zr81BITcebKB24QmCSD8Gl3e+DWEEF+OkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PQtvfzn0B9EKD8B/cX14eepmMdB3LqMutpgoBx21Q8=;
 b=AMb/P0dgKfg4kyV/KwKX/yfdEYuylYfHyaHliwxdORVpO8Ic9rnVo8Z9LEJBguOOjjk6R3a6cAdAUsw5ef4n6KiOOxGP/FeRSPHitjljBKCXXYjCKqUusYZPRiLWu6NG9py+5dTAaASaVeDX/b7obBiRlxt77V+1LUVopkwT9L4OuQLAFnSOQDPzfVIpscAo2lzZJ1QBp2orA3C/btUo8XV7A04fOOvu57wYnHXr2aVnlrw8GeVXCK5AoNzw29sRaXVQvqe8K4rz6HWJ5Eqg9Z6XTW+qCcmci/qtfydC8MgFq7W+BorIrfklDAX54cvKEM2QlMWbW3knnMIbAlwasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PQtvfzn0B9EKD8B/cX14eepmMdB3LqMutpgoBx21Q8=;
 b=5Nn8xy9wgEJsxA+xu2xkSAsTGHUcwJ+i5fQku07Dp49oxMX51eHIW6YzV9WdS8LDfzsq/AUXlEUbALu89N58Ph/wWDiG7JhgJVZ31YyOva/RMr8m9TJheaFmQAmMSd6UlXtRABhHV+AYrfE9d/LW3eIcGJ/meiQlIoiGB2BB0LU=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Xen Security Team
	<security@xen.org>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: RE: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Thread-Topic: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Thread-Index: AQHY6SSq6cLZ8k5bLkuflpP51dz+Ha5A5cGAgAAC9ICAAANygIAACOig
Date: Wed, 16 Nov 2022 02:39:14 +0000
Message-ID:
 <AS8PR08MB7991937E43C28990FADDB53E92079@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2211151724320.4020@ubuntu-linux-20-04-desktop>
 <c0ba7b0f-d91f-74f2-be4a-3cb944392c95@citrix.com>
 <alpine.DEB.2.22.394.2211151759480.4020@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211151759480.4020@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D1AE173D3C35E54BB9319CB9ABDD5AAB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6483:EE_|VI1EUR03FT059:EE_|DB4PR08MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2e371b-12f3-4a0e-0d17-08dac77bc8d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 61XS/uiEbOBP09k2Pv6C7Pg7oZ381zmSjecM/05lgF0VI4/VUbvhW4o5U+I+cqXczsOSKUGKgPh2/JYZtLFM6EGRONNiohv9dofO9G45JZ8YiOoTXpeQjxH6yHhqzti/lnSbbElDmxVAdSd4MNQ4elFboHbuzyoDMSUQQp5KFEuDhkBGuBa6t7yc19c45a7L42RLlbpy7qbWv5NEB/ZF2zVZCjk1Ae/iH5i49nFjzEOVcgWF4APaH2iBgIhAxMGcqMp4awCO7c3K2OcTRs0pGVGsUzl5LrwSke3S/Sn8ArEbiPQ32sH/VF64CRRbMGopK4gznP0a3gxqaIgvDhvx7BWFObqi1Zdjspf/p5qy1FCkcGT90GSAk2OJ64fF3G1OSl0D/PATOlHb8urcPP3XBQ7/LazeT709HIWm3rgO2C2BSMQIDYw7PLFLsLehhFQoC3uztgI4mqSi8S5uvQckjD7uZ3NxKiKq56QKCoJt9bJdJT84bEKO3CmqfcHDvux9hL2H/LcGBAsgVeqrCM5tA7gcxSpaapDe5ZgoFE2wvx+wR95LYSUQnDxspt+T2RjDl4RlnvdT4ZFZeqPtWtkGCh0TKtrH6gqS5e6yS81VjilWz5zc3cw7Tpv+hKzUMg9RGoJ8R6kvO5u5pRZJi7p2IiuQdpmPyoWYBNso9ZAGQkNpWrhkdweG9FEp5sXfiiDqvrn1GAJA01GXmNC9LSZDYqr3SVvWUlgZZhPwMeL4aICSdqKyxQFKTh1Rvj1aaAlxJ28Qx/jvlQwSKBAzW9ZdkA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(2906002)(66899015)(5660300002)(33656002)(66946007)(66556008)(66446008)(64756008)(66476007)(41300700001)(76116006)(55016003)(86362001)(8936002)(53546011)(6506007)(7696005)(110136005)(38100700002)(83380400001)(122000001)(38070700005)(54906003)(7416002)(186003)(52536014)(4326008)(8676002)(26005)(9686003)(316002)(71200400001)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6483
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64678193-b17f-4aad-ffe6-08dac77bc06d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FGzpwW15qA82Da9djOrnBbqDM5o7HgZh3opJztCdQqkMrPdfJOaV6pF/Y3zdCeQYdFfqruQwIyoUxzHaHM59wLDhBKYqnk+YNcjjYeo3aUsgcoSOjqXgXBjTygl90h43b9X3SD2lEo0szdOfdYMYfpLHzjPhK7Lny0JfMagrzYtvg0V+IKiQbFZqcwHUI8d6ztEORGcTMflMOufGi1d+z26lPLK1P02Uu5Zrg9a7NPzReeR0AyZtpK5t+MVVnwiL+IPTSboWaZxZdXEd9AEhyiqnx5j1d06r3F47c61E/UT1i8D/iOPMw9s9j9TM0ZtHhLHV3rQvAtBEiVc34aUAsajqMUX7xJJFYnkRQKV/6qSvvy3PyidUx+OsHQIgzOfR9tLyKUJ8+3wMpv1RQLmd/uBWn6KSZVDlWVthB146yWT7xhuHNR1k9rSIQb7QwGaBWx7i6E4Ey9y3vEZbaAhE+q0mBGooXYJbDfVlbTMqUJcC/Wn7z20ecyHs2IWCkRyfn/uXOnjbuSS6CCk+uAG4XC2ImwBgu41Z/SRj5qhFGGEgh3f9pGkP8sYbLImucTMn+E/BLmt6bqkaIHZlRVyGw+onc6WiSOBk3tbFo8qScQT5NiVR9vGadUEirfhrFIBY7+WeWL4djvpUe7B97eLNTdolR+JvFloRBNkIheEiCPPV/Df1WJ6LGO1L87b1sKWliwcw12KUaDCqFV3/SWfm/CiV4BIWOSxBqfzH0lw8g9QkP69+x7kDpZiHeBSttwUh3gf7wP/JUTG6QpSfE/ANRg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(7696005)(26005)(9686003)(6506007)(81166007)(478600001)(356005)(336012)(36860700001)(82740400003)(53546011)(107886003)(2906002)(41300700001)(54906003)(33656002)(40460700003)(186003)(110136005)(55016003)(40480700001)(316002)(52536014)(4326008)(8676002)(5660300002)(70206006)(70586007)(83380400001)(66899015)(86362001)(8936002)(47076005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 02:39:28.8923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2e371b-12f3-4a0e-0d17-08dac77bc8d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9262

SGkgQW5kcmV3IGFuZCBTdGVmYW5vLA0KDQpUaGFua3MgZm9yIHB1c2hpbmcgdGhpbmdzIGZvcndh
cmQhDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMv
NF0geGVuL2FybSwgbGlieGw6IFJldmVydCBYRU5fRE9NQ1RMX3NoYWRvd19vcDsNCj4gdXNlIHAy
bSBtZW1wb29sIGh5cGVyY2FsbHMNCj4gDQo+IE9uIFdlZCwgMTYgTm92IDIwMjIsIEFuZHJldyBD
b29wZXIgd3JvdGU6DQo+ID4gT24gMTYvMTEvMjAyMiAwMTozNywgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOg0KPiA+ID4gT24gV2VkLCAyNiBPY3QgMjAyMiwgQW5kcmV3IENvb3BlciB3cm90ZToN
Cj4gPiA+PiBUaGlzIHJldmVydHMgbW9zdCBvZiBjb21taXQNCj4gY2YyYTY4ZDJmZmJjM2NlOTVl
MDE0NDlkNDYxODBiZGRiMTBkMjRhMCwgYW5kIGJpdHMNCj4gPiA+PiBvZiBjYmVhNWExMTQ5Y2E3
ZmQ0YjdjZGJmYTNlYzJlNGYxMDliNjAxZmY3Lg0KPiA+ID4+DQo+ID4gPj4gRmlyc3Qgb2YgYWxs
LCB3aXRoIEFSTSBib3Jyb3dpbmcgeDg2J3MgaW1wbGVtZW50YXRpb24sIHRoZSBsb2dpYyB0byBz
ZXQNCj4gdGhlDQo+ID4gPj4gcG9vbCBzaXplIHNob3VsZCBoYXZlIGJlZW4gY29tbW9uLCBub3Qg
ZHVwbGljYXRlZC4gIEludHJvZHVjZQ0KPiA+ID4+IGxpYnhsX19kb21haW5fc2V0X3AybV9wb29s
X3NpemUoKSBhcyBhIHNoYXJlZCBpbXBsZW1lbnRhdGlvbiwgYW5kDQo+IHVzZSBpdCBmcm9tDQo+
ID4gPj4gdGhlIEFSTSBhbmQgeDg2IHBhdGhzLiAgSXQgaXMgbGVmdCBhcyBhbiBleGVyY2lzZSB0
byB0aGUgcmVhZGVyIHRvIGp1ZGdlDQo+IGhvdw0KPiA+ID4+IGxpYnhsL3hsIGNhbiByZWFzb25h
Ymx5IGZ1bmN0aW9uIHdpdGhvdXQgdGhlIGFiaWxpdHkgdG8gcXVlcnkgdGhlIHBvb2wNCj4gc2l6
ZS4uLg0KPiA+ID4+DQo+ID4gPj4gUmVtb3ZlIEFSTSdzIHAybV9kb21jdGwoKSBpbmZyYXN0cnVj
dHVyZSBub3cgdGhlIGZ1bmN0aW9hbmxpdHkgaGFzDQo+IGJlZW4NCj4gPiA+PiByZXBsYWNlZCB3
aXRoIGEgd29ya2luZyBhbmQgdW5pdCB0ZXN0ZWQgaW50ZXJmYWNlLg0KPiA+ID4+DQo+ID4gPj4g
VGhpcyBpcyBwYXJ0IG9mIFhTQS00MDkgLyBDVkUtMjAyMi0zMzc0Ny4NCj4gPiA+IEdlbnVpbmUg
cXVlc3Rpb246IEkgY2FuIHNlZSB0aGlzIHBhdGNoIHJlbW92ZXMgdGhlIGltcGxlbWVudGF0aW9u
IG9mDQo+ID4gPiBYRU5fRE9NQ1RMX1NIQURPV19PUF9TRVRfQUxMT0NBVElPTiBvbiBBUk0uIEl0
IGFsc28gc3dpdGNoZXMNCj4gbGlieGwgKGJvdGgNCj4gPiA+IEFSTSBhbmQgeDg2KSB0byB0aGUg
bmV3IGh5cGVyY2FsbC4NCj4gPiA+DQo+ID4gPiBXaHkga2VlcCB0aGUgb2xkIGh5cGVyY2FsbCAo
WEVOX0RPTUNUTF9zaGFkb3dfb3AgYW5kDQo+ID4gPiBYRU5fRE9NQ1RMX1NIQURPV19PUF9TRVRf
QUxMT0NBVElPTikgaW1wbGVtZW50YXRpb24gb24geDg2DQo+IChub3Qgb24gQVJNKT8NCj4gPiA+
DQo+ID4gPiBJcyB0aGF0IGJlY2F1c2UgaXQgd2FzIG9ubHkgcmVjZW50bHkgaW1wbGVtZW50ZWQ/
IEFuZCBub3QgYWN0dWFsbHkNCj4gPiA+IHByZXNlbnQgaW4gYW55IHBhc3QgWGVuIHJlbGVhc2U/
DQo+ID4gPg0KPiA+ID4gSWYgc28sIHBsZWFzZSBhZGQgYSBub3RlIGFib3V0IHRoaXMgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLiBBbHNvLCBpZiB0aGF0DQo+ID4gPiBpcyB0aGUgY2FzZSwgSSB0aGlu
ayB0aGlzIHBhdGNoIHNlcmllcyBzaG91bGQgZ28gaW4gNC4xNy4gSWYgaXQgaXMgdG9vDQo+ID4g
PiBsYXRlIHRvIGdldCBpdCBpbiBiZWZvcmUgdGhlIHJlbGVhc2UsIHRoZW4gd2Ugc2hvdWxkIGJh
Y2twb3J0IGl0IHRvIDQuMTcNCj4gPiA+IGFzIHNvb24gYXMgcG9zc2libGUuIFRoYXQncyBiZWNh
dXNlIGlkZWFsbHkgd2Ugd2FudCB0byBrZWVwIHRoZQ0KPiA+ID4gaHlwZXJjYWxsIGludGVyZmFj
ZSBjaGFuZ2VzIGRvd24gdG8gYSBtaW5pbXVtLg0KPiA+DQo+ID4gT24gQVJNLCB0aGUgaHlwZXJj
YWxsIGhhcyBleGlzdGVkIGZvciBhIGxpdHRsZSBvdmVyIDQgd2Vla3MsIGFuZCBpc24ndA0KPiA+
IGluIGFueSByZWxlYXNlZCB2ZXJzaW9uIG9mIFhlbiAoeWV0KS4NCj4gPg0KPiA+IE9uIHg4Niwg
dGhlIGh5cGVyY2FsbCBoYXMgZXhpc3RlZCBmb3IgbW9yZSB0aGFuIGEgZGVjYWRlLCBhbmQgaGFz
IGtub3duDQo+ID4gb3V0LW9mLXRyZWUgdXNlcnMuwqAgSXQgbmVlZHMgdG8gYmUgZGVwcmVjYXRl
ZCBwcm9wZXJseSwgd2hpY2ggaW4gdGhpcw0KPiA+IGNhc2UgbWVhbnMgInBoYXNlZCBvdXQgaW4g
dGhlIDQuMTggY3ljbGUgb25jZSBrbm93biBjYWxsZXJzIGhhdmUgYmVlbg0KPiA+IGFkYXB0ZWQg
dG8gdGhlIG5ldyBoeXBlcmNhbGwiLg0KPiANCj4gVW5kZXJzdG9vbi4gVGhlbiBJIGFtIGluIGZh
dm9yIG9mIGdldHRpbmcgYWxsIDQgcGF0Y2hlcyBpbiA0LjE3LCBlaXRoZXINCj4gYmVmb3JlIHRo
ZSByZWxlYXNlIG9yIHZpYSBiYWNrcG9ydHMuDQoNClNvcnJ5IC0gdG9kYXkgaXQgdG9vayBtZSBh
IGxpdHRsZSBiaXQgbG9uZ2VyIHRvIGdldCB0aGUgb2ZmaWNlLCBzbyBob3BlZnVsbHkNCkkgc3Rp
bGwganVtcGVkIGludG8gZGlzY3Vzc2lvbiBvbiB0aW1lLg0KDQpBYm91dCB0aGlzIHNlcmllcywg
SSBkb24ndCBoYXZlIHN0cm9uZyBvYmplY3Rpb24gdG8gdGFraW5nIGFsbCA0IHBhdGNoZXMsIHNv
DQppZiB0aGlzIHNlcmllcyBjYW4gaGF2ZSBwcm9wZXIgcmV2aWV3L2FncmVlbWVudHMgYnkgdGhp
cyB3ZWVrZW5kLCBmZWVsIGZyZWUNCnRvIGFkZCBteSByZWxlYXNlLWFjayBmb3IgdGhlIHBhdGNo
ZXMuDQoNCkhvd2V2ZXIsIGlmIHdlIGNhbm5vdCBzb3J0IG91dCBhbGwgNCBwYXRjaGVzLCBJIHRo
aW5rIGF0IGxlYXN0IHBhdGNoICM0IHNob3VsZA0KZ28gaW50byA0LjE3ICh3aXRoIGEgY29tbWl0
IG1lc3NhZ2UgYWRqdXN0bWVudCkuIFRoZSBwYXRjaCAjNCBhbHJlYWR5IGhhcw0KcHJvcGVyIHRh
Z3MgZnJvbSBBcm0gbWFpbnRhaW5lciBhbmQgbWUuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

