Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41585FE8DE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 08:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422474.668518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojE9L-0002wv-VJ; Fri, 14 Oct 2022 06:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422474.668518; Fri, 14 Oct 2022 06:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojE9L-0002uf-Sa; Fri, 14 Oct 2022 06:26:27 +0000
Received: by outflank-mailman (input) for mailman id 422474;
 Fri, 14 Oct 2022 06:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojE9K-0002uP-Ii
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 06:26:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2045.outbound.protection.outlook.com [40.107.104.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fa34d14-4b89-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 08:26:23 +0200 (CEST)
Received: from AM5PR0701CA0020.eurprd07.prod.outlook.com
 (2603:10a6:203:51::30) by PAXPR08MB7624.eurprd08.prod.outlook.com
 (2603:10a6:102:242::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 14 Oct
 2022 06:26:20 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::19) by AM5PR0701CA0020.outlook.office365.com
 (2603:10a6:203:51::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6 via Frontend
 Transport; Fri, 14 Oct 2022 06:26:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 06:26:20 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Fri, 14 Oct 2022 06:26:19 +0000
Received: from cdc5913d47ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 42E7E598-853B-4FA2-BE53-0E545B0430BD.1; 
 Fri, 14 Oct 2022 06:26:13 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cdc5913d47ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 06:26:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9361.eurprd08.prod.outlook.com (2603:10a6:20b:5a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 06:26:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 06:26:10 +0000
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
X-Inumbo-ID: 1fa34d14-4b89-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OB+dzMXWRRpbwp5G4a6RT67JpPhTSwVdAnoe6PPefBU4y0SPxtbqwM9MYsEFqIEs2wDbGjW5etwYHv4tGs7V9qomnbcmOQZYZhD2xi5/KYLK1KeIDbjiymXR3syVS3ggKdvADfl64bPjLNbxFWdxijSvn2qSdi499BCsxXddaoBq25oH4wKUdoL7fO/PF3zOUkBOO1UTVMFE5C5WPZ2Mi6IfPL6vQcVEnbIjyuG2rirxNSB2xM0pQluBi6SxIo7gvgXdOLTCCXHQdVEF1qy6MhwuEdoq5KkvgRlGLRkRDu19cXsDrWGUDkLC7gsLpDcurpOQjVpYY9FSuJGbVjN9rA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8miSsCz/DfV7aiM14+M93ez+u0Y6bItyhsWaxgylbw=;
 b=McbhBtzrsHy7eiu4hT4uUyBs2VPXSPs37ZPpGQ+0rZWRRjkawFFVuaME2M1ugZ7KhU6Wa9HWDpp4D0Wpr8lGmq+ODp87xnSRnoC/3fp9iQl2uLm5ZUHXlg/BrmbrGCJ9yun00QofCMp/R/MS8ZCaTTfIbXVnYxzfVM9m2zwyiiaBTi/GP2RGeQVcu6inaCItIWpBU0u6UC5nEpih8UZQa4LjuEOFeZcA6IYLbA7VsUbEyKx2R1Kh/5ZHbdijWRH3GferfQaG/Cnv4yXX5WaRd7YLToAMqwbi7Omqsik1AanCuH3mWGuJyLCmsQwwKMVIu+PXND7sn+6caxfIBGUqxg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8miSsCz/DfV7aiM14+M93ez+u0Y6bItyhsWaxgylbw=;
 b=rjBW9t6Ky3X6+6GmrTJ34Zi+/YbDNb8a8rrFRMKMghcPIVRzecVVOxmJ+ANrMTiTgNAvAiziq7V14hOV7ykCiZMuvULRsmYPpH2x5ybNWj1QFSQdhtFY/uGGsldOtF8Fg635O1MzY02aXuRge/F+KmCbFCjhH7Er2t8cvqycflU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9YhB1PS0ADlT8uX6dRLMQw2CYZnEx5RwycYsgSNhySdHry0t1PddFnghWc8+49hBAihK15EYWK2fw0NL0NTnGfv9D3EsxyDxB4Z9L5TDEf09DHZPztvKdo4tTn+8C79roXeadbGosB3tYxjLKoq21D0hBGo3CmbB1UozPzpEQiYZBHikR5ogzqvQ9XcPNaah0kx/yicxEHG3dDB0AWU41xR9tCQelPTfo1xmBdKQEDfpeUWiHud1oiWeQcC9Wy8RpAieuI4jUnmpMMQNuOxm7kQvkKA32dL2EVil7fTlRaEko9ciN5ABrtx6zLu6L42NkZUyrluc0adjn5r/yL+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8miSsCz/DfV7aiM14+M93ez+u0Y6bItyhsWaxgylbw=;
 b=TZq76SRm4D874Y6soAHWpERiXBl96RtBH1ghOxq2wBJnQo695fcKHluuCUmwuSWGvZgXCtcgeFbMzvVi9WOwBqyjuURdHQKUj6ZNd8ItWK589rsRtgevM/pytBoQdbL0ZEUEBw7DS0dIfqHkDCyPKfoVxJrwTnjSZxYK6L7kc8PsACtUS4VgqarbxF+3cF8SQn+lN8eRULET38kZbXYCUX8bGNx3KZKTp5f86NdPSA53kT8PueQOy53E4qdjrJKRKH0z83R8b3bxRiNcpdqTAeVLHsa8hkFNaRaACeLo2TGdkQ1lSsClWGHYlviAkwVvj4nuu/3J0veEmzgS2lmQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8miSsCz/DfV7aiM14+M93ez+u0Y6bItyhsWaxgylbw=;
 b=rjBW9t6Ky3X6+6GmrTJ34Zi+/YbDNb8a8rrFRMKMghcPIVRzecVVOxmJ+ANrMTiTgNAvAiziq7V14hOV7ykCiZMuvULRsmYPpH2x5ybNWj1QFSQdhtFY/uGGsldOtF8Fg635O1MzY02aXuRge/F+KmCbFCjhH7Er2t8cvqycflU=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Anthony Perard
	<anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [XEN PATCH for-4.17 v5 00/17] Toolstack build system improvement,
 toward non-recursive makefiles
Thread-Topic: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
 improvement, toward non-recursive makefiles
Thread-Index: AQHY3wSf1tDccsob1U2UzC8OPggTyq4MneqAgADO4WA=
Date: Fri, 14 Oct 2022 06:26:09 +0000
Message-ID:
 <AS8PR08MB79916265D28F1533ECC538F992249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <381f1ae6-d539-ad52-79da-e44e9dfd5066@citrix.com>
In-Reply-To: <381f1ae6-d539-ad52-79da-e44e9dfd5066@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3E1B684AC6B68B489FA3EB189D90FF05.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9361:EE_|VE1EUR03FT034:EE_|PAXPR08MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: a056d62c-6a83-44de-3ed7-08daadad0214
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5W9QviUvFTwnYuBm31i2a6FWoPG8OwW00n3ovPWldf6nLIBlGo1wBgfP5uzhKH3kqRtJqrYC0QGNbDlEIZK+fX5WrxNBQEp/u7R8YVo98ANbUlHQmLwU81cQHcSp6KLKLhftKOG6BPAUm2qns56eK9VAU/53qj7iKUS2EXXaNB9Dqth2fqwcl5vQVprrB2R9GqBA2N5hrf2rgzusorgppytJGwWX2NZP4mXIb8rJHIw0WLqMTErNcRr72GDYMX13j/73LMKTct0unhp0SE8uubKqj1wjEobkIRLA84CymDx+YE/K2f/chVWyb4jXA4hH6x9w7Qs63fd0v9AApMgHVR8tAE+xyOg3xhtTeTbJ8Xb3EXcfMCO8sdeMaXEi2wpfaFtB2JDQSp9HMf/lwWAm8LwvhWFVRCseXrSxSpOYWvbgXtuRJ5zyO2aLmkGEHp3HTWoT1XiLY+viJZwvUkKGkKG5Uo5iAHE/f5GkcYOMvKE4sLDzqc43YiE2z4mBTxilcZSi3EmobQwTtyZ1pyEVprNS39eOoF73F5bfVTIK5+93IOB5qhj35rY9LUX5OISA3d2rAJssi7AzRYGzkjtLvNG3AzO/o4/jfNvojU6lPS3VtiAhcJ8FXBATzK021MuHEnkXvDdzCee34Cy6jidmrSanKsUjKG0dd/9VkAiJ3/H+RJAf71Ms4SAXQH77C4jyLUUTRjpNfNT6/e8Web567bhR7yfTlffxxsxajbbHsNVxt0tq1q4t2yGTXpUA3vW1Rr7+w9t/TqE2gmWV3pT/Q1n2rbLOUUzSiQP07fOV7k0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199015)(86362001)(38100700002)(38070700005)(966005)(53546011)(71200400001)(26005)(66446008)(41300700001)(76116006)(66946007)(9686003)(66556008)(8676002)(478600001)(64756008)(66476007)(122000001)(186003)(2906002)(5660300002)(316002)(8936002)(52536014)(110136005)(4744005)(83380400001)(55016003)(6506007)(33656002)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9361
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	07835307-3b59-4656-ed8a-08daadacfbf9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XzCEDAhjO8+W6I3lRfMvQ9ZA2RPXi2ZXCRL08kQnCsBERPJym6z5sB3ni0XDlMmgsjn33ItCg7CAmOuVbHKKAfGf95T/aaKXXQQHRSEShorlaDhfWdBb591kTx3Vu6hn3MiI+hn3+8JO1BHXeJt6CThYmLvg16qyK9CTqSc6Ljug0aebj1ZUe/9wJ7mftoxOxftSV+Jn35EWfrW35fLZ3wECqZRJNPxvDOpUH9BUbas6bTtv8/ubfFHmhes+XNZ+Iam2W7v0C3oXBn6t84JQvRYeEhx+ZviOumSKDuXRFToSGMBSciSyJWYL4Du29zqALv10uwq1nzxLDCBxfIwLEt1k5/dJ85PJSUCJzAQrAI91HBDW7JjlKYGXFS5qsJAk0fYNl5NFEPereJN+QayvrIXNL56BBxpwZsSd535TnbkexQawz+As2ciAV+PYc5q5nqoTM9DDyb83CWwcgv5Iptk2fG6tG2JBaaBCrCH291KT15biq04+bMTsFRfnqC8IgWgMf+p5yTnZNzymj8jYc5Osds9XsiNTHKepSJKOZfAPb1pdUu8KGxBMULziMghQK84bJg4KeLdC0MMT09V2heu/6Nx1jZV4I5eA9jQhWXc2qy4ru9vOLMd0+TpkAqYSt0xWK4mIXVg09Ld8yRFfnG1NYzqsIcpM4OsEdzXVfvUSnlUFIEjUjGv0NepiPnQTbcosVhdLMGabVJy8H21JbCoT6iGl+5sR2cwhCq62/bvKz/5fkVHk91vkcr6MzY6avy0+XgUhIODyuhsYTBynVsMtCTEYfZvWYHFpspVkNYU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(70206006)(82310400005)(83380400001)(82740400003)(356005)(70586007)(110136005)(40460700003)(8676002)(53546011)(40480700001)(6506007)(47076005)(7696005)(9686003)(55016003)(26005)(33656002)(2906002)(336012)(8936002)(186003)(478600001)(86362001)(316002)(966005)(41300700001)(52536014)(36860700001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 06:26:20.1087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a056d62c-6a83-44de-3ed7-08daadad0214
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7624

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVO
IFBBVENIIGZvci00LjE3IHY1IDAwLzE3XSBUb29sc3RhY2sgYnVpbGQgc3lzdGVtDQo+IGltcHJv
dmVtZW50LCB0b3dhcmQgbm9uLXJlY3Vyc2l2ZSBtYWtlZmlsZXMNCj4gDQo+IE9uIDEzLzEwLzIw
MjIgMTQ6MDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiA+IFBhdGNoIHNlcmllcyBhdmFpbGFi
bGUgaW4gdGhpcyBnaXQgYnJhbmNoOg0KPiA+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1o
dHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQNCj4gYnIudG9vbHN0YWNrLWJ1aWxk
LXN5c3RlbS12NQ0KPiANCj4gSSd2ZSBkb25lIGEgZnVsbCByZWJ1aWxkIG9mIHRoaXMgKHdpdGgg
dGhlIDIgbm90ZWQgZml4ZXMpIHdpdGggWGFwaSwgYW5kDQo+IGl0IGRvZXMgcmVzb2x2ZSB0aGUg
T2NhbWwgbGlicmFyeSBsaW5raW5nIGlzc3Vlcy7CoCBUaGFua3MuDQo+IA0KPiBTbyBULWJ5LsKg
IElmIGFuIGFsbG93YW5jZSBmb3IgNC4xNyBhcHBlYXJzLCBJIGNhbiBzZWUgYWJvdXQgZ2V0dGlu
ZyBzb21lDQo+IG9mIHRoZSBtb3JlIG9idmlvdXNseS10cml2aWFsIGFyZWFzIHJldmlld2VkIGFu
ZCBjb21taXR0ZWQuDQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdA
YXJtLmNvbT4NCg0KU2luY2UgdGhpcyBzZXJpZXMgaXMgcXVpdGUgbGFyZ2UgYW5kIGp1c3Qgb3V0
IG9mIGN1cmlvc2l0eSwgZG8gd2UgaGF2ZSBhDQpwaXBlbGluZSBvciBDSSBqb2JzIHRvIHRlc3Qg
YWxsIHRoZSBtb2R1bGVzIHRoYXQgYWZmZWN0ZWQgYnkgdGhlIG1ha2VmaWxlDQp0b3VjaGVkIGJ5
IHRoaXMgc2VyaWVzPyBXb3VsZCBiZSBnb29kIHRvIGhhdmUgc29tZSB0ZXN0IHJlc3VsdHMgdG8N
CmJvb3N0IG91ciBjb25maWRlbmNlIG9mIGNvbW1pdHRpbmcgdGhlIHNlcmllcy4NCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gfkFuZHJldw0K

