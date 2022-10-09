Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C935F88B0
	for <lists+xen-devel@lfdr.de>; Sun,  9 Oct 2022 03:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418877.663594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohKxR-0000Rt-Rv; Sun, 09 Oct 2022 01:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418877.663594; Sun, 09 Oct 2022 01:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohKxR-0000Pj-Oc; Sun, 09 Oct 2022 01:18:21 +0000
Received: by outflank-mailman (input) for mailman id 418877;
 Sun, 09 Oct 2022 01:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjX+=2K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ohKxQ-0000PY-Ea
 for xen-devel@lists.xenproject.org; Sun, 09 Oct 2022 01:18:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 403d5839-4770-11ed-9377-c1cf23e5d27e;
 Sun, 09 Oct 2022 03:18:17 +0200 (CEST)
Received: from AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) by AS8PR08MB6616.eurprd08.prod.outlook.com
 (2603:10a6:20b:319::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sun, 9 Oct
 2022 01:18:07 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::a4) by AM5PR0201CA0022.outlook.office365.com
 (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Sun, 9 Oct 2022 01:18:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Sun, 9 Oct 2022 01:18:06 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128");
 Sun, 09 Oct 2022 01:18:06 +0000
Received: from 0f822583eadc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 483830DC-1096-4343-9FB5-BB312EE722F9.1; 
 Sun, 09 Oct 2022 01:18:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f822583eadc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 09 Oct 2022 01:18:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6060.eurprd08.prod.outlook.com (2603:10a6:10:20a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sun, 9 Oct
 2022 01:17:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Sun, 9 Oct 2022
 01:17:58 +0000
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
X-Inumbo-ID: 403d5839-4770-11ed-9377-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m1DbNEFVfWcALmY64XXQbvmSc9A5+iyYoZlif1PnTjPxtw+LrnJholRuUKZW9qAnCYXcyO8C902Qnt7ZPu3S1K3ehik33DQyoWW4PdeyQWeZw7V7GMsgpQ4CBACmTyXTLt2i2FCiWVqB8HT3p2avkAG4FDtrTLeMaPfvbp2dVGYbZgT7OWcf/oc5iiaKVgAf265UHlKr/ZPT468C4FoW1FOsX66KB+ax8rta/plgZkgIVpzwniTEuPsdJKrGjhkwU10j5qQo9sJM2LepmstJ0lvUErAXg8KfVYotKfDtWvRzekur/sGVxDnqIWlue+pTRs1OWwg9CmYhlldlLovWVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ep38x4U8Qh8AD5F15qbwiIthdByVZrxuVBEAFoGUl18=;
 b=lg8GRhXn1b6WWtcdfa+POT9WAPBtXyPvG7a9+IOaNpHFPZmujLvyyAICUgmiYAPXmcHx1KLhtIKeYEQAL4eFRiRLLA/vlLHUByHmgwpV5fUvNovUrfm8qsEGHB5Lp5V+71pySvH60HsVRqxIhhzFx/E7Fv6YiLtUFUzlgBCu9x3fl43xIdre/4vV6GbpjJO4Y4lPrRGOWqEoDaO23e51y2N/Js20ugOF2EIQp0QJOwK+bk0O+iwEUIVLBW+WB46zaT1c9tEzIyNu98UQw5IYusED/fJsyNWe7cU90osApm2G4C3CBlwSWplHCdbqZQf93XxPv+pQLpRrRE7sPK8Mvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep38x4U8Qh8AD5F15qbwiIthdByVZrxuVBEAFoGUl18=;
 b=CfphZB93woGVtwj9IWqgwK0FdquUlrCEiVWuN1R1bn7vZOM/wKjKRrmyBWnzCIUC3wXkx8EkmZD3Z8WatxI5cmd9ynnR65Gu3OkirvO+m0+p473mZlvtiahwavOg0IROeXOJJTKLRt474113cbm1HNFAA/MqzhfKtQxoiPtoQv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMfhN/rf6g00JLXU8vwDxmW5UrmlTka0HuNKkoxTk2XxHIecv5nH3FVYyu+ZQm3t9Ta+14hf9XDm/kci0WKeK1fPUMQ3OxvMmzu3dQfLRAfyCYbBqlWte1EVH6/XHqFqno0P3fJ6f4y2ZuNwcKaQJOKgLLWY9XzDbTEiFtgD+cxI4yuGny+s+7pmjtfqHlEBF/06tBEQYvjIHM3+li5lm4sQRuRQbIBEsatteNG/dYa4CrZaU2j73It1C385Q98ieKS62iUNiL2gtzKXurKOw1pSjTPBUgbeiMeftlMpFx5cxA25jcY5hiuHWC92t/y5Xvdz28CLVCCa29wHzD7diQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ep38x4U8Qh8AD5F15qbwiIthdByVZrxuVBEAFoGUl18=;
 b=MflVxZlEuka4Fy6TNC9zlohhf0nOatdbwQer8OO1Qs1D/X4lbfWZuuk1Qh5Rx7H3CHs+uQEWqT9qlkBAQ5NQ2L8g9g0/MdeaaCDoom6m6og6Jkzk31lEQgsoKsJtFVPIokeBZX3Q916ju0OzgdmxPbrFtMd3/xDrNi2mx/uyGmDp8USr5B8wLdt3FAoylohL88HAs5V2U86Z/i81YJkF6eIi+uwvEwBA8/JWwy8nR0yMr41gBpXzC126qSPte8ZZLE2erwutf+DbxUfOelz+0Dh7M+zfcA/kCx6d8jgJJVXR8O60hTnzt8+vLcsXxA0P89siuSR5gH2iB9EnCu/ERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep38x4U8Qh8AD5F15qbwiIthdByVZrxuVBEAFoGUl18=;
 b=CfphZB93woGVtwj9IWqgwK0FdquUlrCEiVWuN1R1bn7vZOM/wKjKRrmyBWnzCIUC3wXkx8EkmZD3Z8WatxI5cmd9ynnR65Gu3OkirvO+m0+p473mZlvtiahwavOg0IROeXOJJTKLRt474113cbm1HNFAA/MqzhfKtQxoiPtoQv0=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Subject: Xen 4.17 rc1
Thread-Topic: Xen 4.17 rc1
Thread-Index: AdjbfFOVLfyYUCOOT7KfcRna0kbjEQ==
Date: Sun, 9 Oct 2022 01:17:58 +0000
Message-ID:
 <AS8PR08MB7991A9E825109AEEE4E155C892219@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 206E7502C1898C4CA6935AAEFC823425.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6060:EE_|VE1EUR03FT024:EE_|AS8PR08MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b0eda9-6583-4742-b79c-08daa9941f12
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XzkKDc3VYFLdWdfd7NqwjoQiOSvKwQq13ydzju0wRsbFlj5l6gdc0HuP8zg5Cz05jfcRGFU7yxjqVmIrGFI+99OVrs+iZHL5N1DZMeWPZKiiX/nXUXPXDvjUuLaniS30aDddRPfZzSryYvNZLIhWxZ+kS2JyZB2RgfmhOPevb3LVMGm2y0C+heyRTxNPJtgsWnYjZE55JdPM/h6H4H7TGB14M896f76aN+WVSfx3rYhgebprwbX09gGmJA67KBKgDzJMT4tvjTSAXo0sn5KkKtAoliZrlLrySzvK107Ews4Fm1M+ypFcOha7s19M54d55NbYPhNF25oqXI3WG44Df/VAXsBPy2Q1Syp8CLEplKoX9q16QNviWOHjHGMg0VotQcr3O5o7x1f/YF2VrbkZJPV+uJByfWceBHXDRLrcboiJGZCn9n+bKAiLcVUB1eCsAJOoGyZ6YUhcGsdEKXwywjTKRSXacuarLbwpW1y58DbLkovNdMU/ZCEmZiHC8RPTiWeUGIbzLPIxwBLiypstMrzIcKCErQLgjx23OYNawqvAw+KEuHJsEaHIN0hGJL07cVybjsdl0S5fnGYnfW449xQQFkqR3pz+NlmgIqiL6pv5oIbm1ip8gr9m5+J8EjnJdd4tXrD1HQVJzmqmEAF5fAsT74kFtmWJ3vN5Oq3Z9InPoAiIcjXqoxGkfskZbKCdtgxkCQVXyFIf8kA8ruk6jHezIQq77RNdUu5ZeAGD240qFQmbzUxxUaIdWpgYJrBd7xXEHrOzQKrFTLniQR2pdDZ8fbQqwDnRKIN3uQz+yGs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199015)(6506007)(7696005)(26005)(450100002)(38100700002)(55016003)(122000001)(86362001)(316002)(71200400001)(8676002)(66556008)(66946007)(76116006)(66446008)(64756008)(7116003)(66476007)(966005)(38070700005)(33656002)(186003)(478600001)(9686003)(83380400001)(2906002)(110136005)(5660300002)(52536014)(41300700001)(4744005)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6060
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6aaf2545-65c1-4b45-331a-08daa9941a0d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XARcq1fmWRs3ScodZ5ZL/0+2TVVW7vgM/fRyd9SWkX6ziuV/339xlOD0weHsOFAfr1KFHi0E1G0y4BhQAYC2mv0S8l9OnCKrhzoRm6Sc3eSedcNLsdVTqVtSsEwvpB3hJphXeibnddoR9A8nIjB1zd1mf187uM6QqucPXJ+GApm+bAqipA+E0e2uwa8/QxG11iirgLhV9eDb79ZrljJkVcm4h6CXzb7ILBpA8WmXVRktvahg4ZAZAy6jSLO13SluP7Zd9Ro90Xb6h84VLqxukEserwYkIeZ60yox7LepbCG15yROgLL3HWKi/TKsN4OoqjvV6HWnQ4daYH06Pwb6bkpV8tWJlJq8WcNc2pGoMT5LgvDBf9dRRFwXlfVwxUrm8Zp/jUb+Sr/irMSDxZbVjZek1D/xP21DGzNb5b/EoV0kX9vXVWlDr1x+RLm6cFICC872D0xqDONFaa10LY14pesVXdJgAwJfxpqjiK3wJMZRwE/KocaYXTyPK5YUN82MRLUS8IC+ky7cDbyyLG0b2sUCr3XH+uIY8ATDCmXovqy9YDYEuR0TSaw967l01ct6CcfPO0h4xg3UmrDeAkA4YNN/33J9lptqmY/f061f2b6p0JQWHjri5OokzTG+FbVL05ydwxE4siwn9+RFJXtSnYbtQ27b43rOgTPOeQzcekOdBvPGoVG499qK6IsE55mDy26v4hXo32jbd9Dsnh7B3KHGMIZu4OzBQg/a8jC6WR00npqFLVz+3IZQQ/s52nL7nEkZWiVrjtWlYn9baPcPVw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(9686003)(26005)(186003)(110136005)(316002)(82740400003)(81166007)(356005)(478600001)(966005)(36860700001)(33656002)(86362001)(55016003)(40480700001)(83380400001)(47076005)(336012)(6506007)(7696005)(5660300002)(8676002)(4744005)(52536014)(8936002)(82310400005)(70206006)(70586007)(450100002)(2906002)(7116003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 01:18:06.5889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b0eda9-6583-4742-b79c-08daa9941f12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6616

Hi all,

Xen 4.17 rc1 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.17.0-rc1

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.17.0-rc1/xen-4.17.0-rc1.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.17.0-rc1/xen-4.17.0-rc1.tar.=
gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me
(Henry.Wang@arm.com).

Kind regards,
Henry


