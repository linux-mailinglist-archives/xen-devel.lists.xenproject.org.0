Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F325FB0CA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 12:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419559.664341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiCsF-0000k1-Ck; Tue, 11 Oct 2022 10:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419559.664341; Tue, 11 Oct 2022 10:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiCsF-0000gT-8H; Tue, 11 Oct 2022 10:52:35 +0000
Received: by outflank-mailman (input) for mailman id 419559;
 Tue, 11 Oct 2022 10:52:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHvS=2M=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oiCsE-0000gN-2z
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 10:52:34 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00047.outbound.protection.outlook.com [40.107.0.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce6d8d6f-4952-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 12:52:32 +0200 (CEST)
Received: from DB7PR03CA0099.eurprd03.prod.outlook.com (2603:10a6:10:72::40)
 by PA4PR08MB5997.eurprd08.prod.outlook.com (2603:10a6:102:f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 10:52:29 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::ba) by DB7PR03CA0099.outlook.office365.com
 (2603:10a6:10:72::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Tue, 11 Oct 2022 10:52:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 10:52:29 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128");
 Tue, 11 Oct 2022 10:52:29 +0000
Received: from da331d3eb171.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8C31D6CF-A310-458E-98FF-8C2913AA1E76.1; 
 Tue, 11 Oct 2022 10:52:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da331d3eb171.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 10:52:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB5378.eurprd08.prod.outlook.com (2603:10a6:208:18a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 10:52:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 10:52:21 +0000
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
X-Inumbo-ID: ce6d8d6f-4952-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f3AUoKePr8HP4nTThWehX+lyRYgctNu7TzSfJP/Rlj7ncRlDuGX2wrXV9p7C+a59ZurWjohgjaaCPHkLolMc8jZER5T2Zlqu1tgyuFK4ntMnq4kytagIS043c4VS5SsOAKCqSn7dRb//uQ4I3dDd+4sBz1bP8QIouKHfLSiu11aBre51GPCJOQk/j5hHokJx9axzDbBIT4818YTKkHhdKDSSomTakJuC1F5OxPOuByjJ+bciIXMqKv76OeDdGpwHLWA0/xLazlJBHoAq9JPXi1U/4gOgrgxqvH1/ZNIcqspSBqWVUNFHh0gZlPLibBBMEjDZqOzqTvWpIBElo6tY6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/cdhmkn5SLFEzarDHl5c+nSjvJbxMYydiKVlDOEM4M=;
 b=b+xsW5evJmxlzkuQmrlWWjDHs3zu5Hd7kVE9UKEYaEJp4J4n6NNFqTm9Bdtvc5PWcEbcsa8dzJtBNPK+YpHBlIY+bYf3t3VYqdvR1CduV8tkqS9sJypes9LL1HmGFuc/CqDvIuijppXFdDJWesOjq4EceOWPLakjUCgB7NPoARh30wm+DREqD+btOxxrT1vdbQeduWJC/TxD3Gh1N6Cj5MaXxkdpwjjvJ38IxPPf72bGxeL6Wg6qwH8+a+uOa//xbnPmEiwgjwK4ozo3egHZHAZES3iuM4wpmIqkDZYtXfNYD/HWEJekRHAW1WGPZJVmDQ/lyGPpZHe1l271/hjuuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/cdhmkn5SLFEzarDHl5c+nSjvJbxMYydiKVlDOEM4M=;
 b=z28xEegyxNgUV+boROJWRG3oGiN5JfHxPCon4QIBDr4/RBlt1yNUYbal3P2Feoxcjn2MOmVw5U7UZNuIJI40jAkI+21HpwiZqxx+27IApv9ZjKvxqr+mSezh+P5ZF1Vk+jfLGd9NugB1dCJFNsVklaDm4JDCupjEcmd5xzSMwoA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHXqLbEsHiTA0F//2vY4b6XrkQBQEj893UXCuuzg+MuWf6LRAp9akVy11aSOFqc2On7J+V7qsmmaRKG3T2RoAPoEzwxU7MNCwLdhQXL+GuaRLNbenHatIWIiBUL5rkIUOzpZc72T25ZJkJBC8wyeOwdafTgneGMf0moMaPV2MZLA56zHyys2GpAyodFu1P3LKM+JE9e3b9+hfugCANRKzQioITo1YJh9Apct2ctMrikByesaNXwzitVFHQtYNI3xTdEzYaHzotuh82BTranHMX4nDPm8+HjNiJWL03S8yyilwjz3ng16x0m4LP9lwiM3Eg0ggaBYOnLaKPVwaLlHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/cdhmkn5SLFEzarDHl5c+nSjvJbxMYydiKVlDOEM4M=;
 b=acGtO5TzWHcMGr09kehMKlWUBfTgmOv05xOsIRv7bwasDM72CfG0gxbzlHmxvl8ezWDNwEXm4BXC/8yfr/6BBj/rXEPvU4WOz9efDJWVVAK9bK3EpX6BJaRhC5iseCxKD6VdxtelF6KETIaxBu/V0fm7Nw+dujdM9fDHVBLvt2S10HOJ2kfl5tHQFjTyc1po2k2WXbKNojK47SLS7tJ2bX7RBDZHTbHK33GVs1gp9yd15IqUIiQJzXDgYQBxnUJtwQiE9VwSSd2EXnNcZEJRzfea1Bp48k45S3PMJv6Czh4Ihj2r5ZMIQ3mSEseSuC68wVEEsL1JsE5FeAN4nIRq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/cdhmkn5SLFEzarDHl5c+nSjvJbxMYydiKVlDOEM4M=;
 b=z28xEegyxNgUV+boROJWRG3oGiN5JfHxPCon4QIBDr4/RBlt1yNUYbal3P2Feoxcjn2MOmVw5U7UZNuIJI40jAkI+21HpwiZqxx+27IApv9ZjKvxqr+mSezh+P5ZF1Vk+jfLGd9NugB1dCJFNsVklaDm4JDCupjEcmd5xzSMwoA=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>
Subject: RE: [PATCH 2/2][4.17] x86emul: pull permission check ahead for REP
 INS/OUTS
Thread-Topic: [PATCH 2/2][4.17] x86emul: pull permission check ahead for REP
 INS/OUTS
Thread-Index: AQHY2YU/ul6th/D86kebfP+n1ma7Bq4H83eAgAEPrYCAAAbpgA==
Date: Tue, 11 Oct 2022 10:52:21 +0000
Message-ID:
 <AS8PR08MB7991A463587075CA084E9E1792239@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
 <4d01771c-fd02-b607-c480-04bcb11fa7b3@suse.com>
 <2dc898c0-b42a-28d7-7126-9379f03119f3@citrix.com>
 <0fe3af83-a743-5edd-1c83-921f5e666039@suse.com>
In-Reply-To: <0fe3af83-a743-5edd-1c83-921f5e666039@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BEEBC16C2362A1418D2C88D9CEBDA092.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM0PR08MB5378:EE_|DBAEUR03FT009:EE_|PA4PR08MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7c0c4f-e938-41e9-8645-08daab76b117
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OYmSxqIsuJjCVlrczKi91aT19FUFQvWO7ia1i6Fyg3yh/tPzaJRduHw3cHR/WiO/YKB0Nt2dGNOqCRKLFEiN7JNOCwEmHzWCz+O8K1Fjev6d3iTAg+yOevyMInO4JvAKmpvgqcKEu30gkeHD3gZbvzpKHdWtyAqgytJAjwj+B9qSjnLXSo/LNGBCdC5pOhqT54qnT51HaUqMebKYSOAN6LmxIzc0lvVpnrYBikLgpbNkQDr/D6CvgeUIVghnWRSE6uhXwT9Kj4XFMDnsSu1CMMznqs/1XGKa7Y2VRxT9P0w9MJyt6M9pouX5Kr2FvvG2jNQhWR2Wf74UTIqd0F36OknUXDM+LtZZnZiFnokysJEH6TgxwEqJ6X/FDHSo/3CYUkDRbuYVPULFqCENWmDv2rgISbzXwq9ePpPGeviTLl3+gA6XowPbfNt6Di7FBs+Mv+mtxS8ZQzK6/YlJi5agZfTz3a0QOYJ9z2L8tqWjwKp8uQM1EJwjhjMYS6I3VC0stG9h5HZjiH6FrmM+lhn75IGQXT9zIGiQKn/jM7/0kJL81MmNVerr8waksPAWeHnW5jJcgMdgaZN8NvUiJ1JHQMvTb65rYbMCpcZoKtazeDh67XnK2yuPo4+VqoY7xSjEwV2+JW7lREM/nMXDsVJSpU0/ULptGb/W5i6+p6i+IyfGt1FGVkh5kEdT81R9bI5VAtCsW2/qUa1uqSELP8NDouTiC2P9sOEz1uMTY0v100suYc2wrvWJ3Zj9l1dmFzWCbYEMHoR1WSYjyknNH75bWQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199015)(7696005)(86362001)(38070700005)(33656002)(122000001)(38100700002)(52536014)(316002)(6916009)(478600001)(54906003)(64756008)(8936002)(5660300002)(76116006)(71200400001)(66476007)(66946007)(66556008)(4326008)(2906002)(41300700001)(66446008)(8676002)(83380400001)(53546011)(55016003)(6506007)(9686003)(26005)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5378
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c57cdf70-43dd-49db-9df8-08daab76ac40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t9oc9RdV8liC8TxeIcyt/I61tTE+p9vCK+ijdQtBHBn5BC4ZRjIEz/e1uIuIxb89UsgrLGKxrd8ZtxqXE7LPjqrI+FHikQXVsYQcNM522MTRjtwYJNX4HHBOY3Z6qzfVSGSbn7/YM+lT1Ksg2Opc8TPJSTVklqbCxnMCdg8whw7YpDEccHBOJIDxsimMP86nCR7jBjiDUoo69rXVh5cAqFR8CgNAr3SpETO5WAdidCfAzcuzuWNAKEWVrm2YwBedXQ4A7rVQ8hwkaTgDbStICEynB/f8aan3JxW2VfzQUYhrGvrWSODH6sLnbbL0gSPmvAEhj5vRE4IIqERWJ6IyyfDC6Wi1EnSI5Hqi9N7SkTDwVaOmMVXki3tXXmsopJUxB9+txCDTisr8CecOVelLTDl78c3jH8uvSeFqFLlFymqC7m97dqDzhBbOInwCQocCN2bYrqO3F3QbTFRaxDgedmYRPC8e5JTR+fSGwNFvR0mejJbu+mv2F1r3NyCGiyy4ODfzLFLaKRNjcK62bD6y1qKW+J1SprF0BwxflEzohQM5Emc+TB4aMTdnlt+lhA20aa8nta09y+kx8RYxl8qcSRx7FqruGZBQFodIolfjPqKdBWVP3hLKxV+wI7b469sZx2nWA6BDoRI2SXTGIBTvC+JuM+5HEtHOfVBDcWYsSsRbhrdQDYJkpTBg3N6u3sGgKebZpde2H/i6oseJpVbRMRjruTyQWFTfCl2S0mo7N2+WzzbE+5r2bTzrC4xFtd/d7p4qxFyC28qvjJIa/vRfWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(52536014)(8936002)(6862004)(70586007)(70206006)(4326008)(316002)(54906003)(7696005)(53546011)(356005)(81166007)(6506007)(33656002)(82740400003)(336012)(26005)(186003)(9686003)(478600001)(107886003)(86362001)(8676002)(36860700001)(2906002)(41300700001)(83380400001)(40480700001)(55016003)(40460700003)(47076005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 10:52:29.1789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7c0c4f-e938-41e9-8645-08daab76b117
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5997

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdWzQuMTdd
IHg4NmVtdWw6IHB1bGwgcGVybWlzc2lvbiBjaGVjayBhaGVhZCBmb3IgUkVQDQo+IElOUy9PVVRT
DQo+IA0KPiBPbiAxMC4xMC4yMDIyIDIwOjA4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+IE9u
IDA2LzEwLzIwMjIgMTQ6MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+PiBCYXNlZCBvbiBvYnNl
cnZhdGlvbnMgb24gYSBmYWlyIHJhbmdlIG9mIGhhcmR3YXJlIGZyb20gYm90aCBwcmltYXJ5DQo+
ID4+IHZlbmRvcnMgZXZlbiB6ZXJvLWl0ZXJhdGlvbi1jb3VudCBpbnN0YW5jZXMgb2YgdGhlc2Ug
aW5zbnMgcGVyZm9ybSB0aGUNCj4gPj4gcG9ydCByZWxhdGVkIHBlcm1pc3Npb24gY2hlY2tpbmcg
Zmlyc3QuDQo+ID4+DQo+ID4+IEZpeGVzOiBmZTMwMDYwMDQ2NGMgKCJ4ODY6IEZpeCBlbXVsYXRp
b24gb2YgUkVQIHByZWZpeCIpDQo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4sIHByZWZlcmFibHkNCj4gd2l0aA0KPiA+IHNvbWUgb2YgXiBkaXNj
dXNzZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiANCj4gVGhhbmtzLCBJJ2xsIGFwcGx5IHRo
aXMgcHJvdmlzaW9uYWxseSBhcyBJJ2xsIG5lZWQgdG8gd2FpdCBmb3IgYW4gYWNrDQo+IGZyb20g
SGVucnkgYW55d2F5Lg0KDQpTb3JyeSBJIHdhcyBhY3R1YWxseSB3YWl0aW5nIGZvciB0aGUgcmV2
aWV3L2FjayBpbiB0aGUgUGF0Y2gjMSBvZiB0aGlzIHNlcmllcw0Kc28gdGhhdCBJIGNhbiBhY2sg
dGhlbSB0b2dldGhlciBhZnRlciB0aGV5IGFyZSBwcm9wZXJseSByZXZpZXdlZC4uLg0KDQo+IElu
IHRoZSBtZWFudGltZSB5b3UgbWlnaHQgY2xhcmlmeSB3aGV0aGVyIG15DQo+IHJlc3BvbnNlcyBh
Ym92ZSAod2hpY2ggbWVhbiBubyBmdXJ0aGVyIGRpc2N1c3Npb24gaW4gdGhlIGRlc2NyaXB0aW9u
DQo+IGZvciB0aGVyZSBiZWluZyBub3RoaW5nIHRvIHJlZmVyIHRvKSBkb24ndCBmaW5kIHlvdXIg
YWdyZWVtZW50Lg0KDQouLi5TaW5jZSBJSVVDIHRoaXMgcGF0Y2ggaXMgYWxzbyB0cnlpbmcgdG8g
aGFyZGVuIHRoZSBjb2RlLCBzbyBhcyBsb25nIGFzIHlvdQ0KYW5kIEFuZHJldyByZWFjaCB0aGUg
YWdyZWVtZW50IG9mIHRoaXMgcGF0Y2gsIHlvdSBjYW4gaGF2ZSBteToNCg0KUmVsZWFzZS1hY2tl
ZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpI
ZW5yeQ0K

