Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558962B020
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 01:37:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444101.698941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov6Qf-0004Ue-DJ; Wed, 16 Nov 2022 00:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444101.698941; Wed, 16 Nov 2022 00:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov6Qf-0004Rg-AA; Wed, 16 Nov 2022 00:37:25 +0000
Received: by outflank-mailman (input) for mailman id 444101;
 Wed, 16 Nov 2022 00:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ov6Qd-0004RW-Nb
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 00:37:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5321d95-6546-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 01:37:22 +0100 (CET)
Received: from AM6PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:6e::36)
 by PA4PR08MB6192.eurprd08.prod.outlook.com (2603:10a6:102:ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 00:37:19 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::f6) by AM6PR02CA0023.outlook.office365.com
 (2603:10a6:20b:6e::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Wed, 16 Nov 2022 00:37:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 00:37:18 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 16 Nov 2022 00:37:18 +0000
Received: from 21cec118e862.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93439BDA-318D-47BB-B8CC-C65575B17556.1; 
 Wed, 16 Nov 2022 00:37:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21cec118e862.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Nov 2022 00:37:07 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by AS8PR08MB8350.eurprd08.prod.outlook.com (2603:10a6:20b:56c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Wed, 16 Nov
 2022 00:37:05 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::ac6e:a062:a5a3:8a3d]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::ac6e:a062:a5a3:8a3d%5]) with mapi id 15.20.5813.013; Wed, 16 Nov 2022
 00:37:05 +0000
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
X-Inumbo-ID: d5321d95-6546-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y279gVXYpbJhNdMIIHzzVr/GAnGXY2OL9jCSn5hJi8k=;
 b=rWO98TYO7nhCe629+VsmLjLP7tfFITHTQTwqrzCEFlhd/5OPdheRRFx88OY5AVE2tincLf3UR2lQqBl0itpdDOp5t5qVTKFPRrOMYvEFfGxbFdZg6Mt6S73DPCF9/l++7QW+DtdgZs8ewBmh7uPzIatAFsErQxCA8M+WlSphciw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlAxG7MZQ/9p1M4raDezew64ue2VVJegc2JjCyvTWuphWRSOX1ETVtZSgfflo43XNR7tK1ldpSmOxQ/7w8uf17tE3NAV87k7kCxN7Hgbntg0YrNxt9yMvP/vjNv2LVlQeaB2yDKyhW9zXvG6FR5fc8I9BJzUEM4LC159rFX56nzQLM6PXz3yJfq6NCPzC6fQ/6FQZ7L7BLlgx/IJWywmI6mpIatcETf1q9/RahYBauawrMAN/8eJ+wy5010eGp07AEhyxgZltyk98N3dUBrt8YOszoNJsbgMl+RuTLbhOL9X1D3LT1IVbc+Dkk9gPF5Hz6TCmpfrtPtoBsIkOTUHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y279gVXYpbJhNdMIIHzzVr/GAnGXY2OL9jCSn5hJi8k=;
 b=N3BxKX+grB1O8nOFvdcjnbNIrX5Q/twiL8d0N5B/uszR2pQBU+ZmHNUZzDHdUFR7yN7pPzeRAo7x1E0x1RrHxtr6/K8hYEbPHiOf6H3ljs10fA8az/oC4upcdM3dkto2YsioO7rrC69u9debDyZFveb/cACB1FTJhX/hsGrFMB3dUvJR7YGJ/tJNi6r+Se/WuOQ2gfBL3Xt1FWjYrkC8pJu/WxqgY4aTfo89O5f6v/uJ27y9rVpy0b1Jl8jMC2er59CieoJ1dTP7mnPR6jTDWSabkUICbC40JCHEIvC5A0Zx4ZuIxNxO3V+ovUuSbQppIYy/jjF1vsOEY8h243H90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y279gVXYpbJhNdMIIHzzVr/GAnGXY2OL9jCSn5hJi8k=;
 b=rWO98TYO7nhCe629+VsmLjLP7tfFITHTQTwqrzCEFlhd/5OPdheRRFx88OY5AVE2tincLf3UR2lQqBl0itpdDOp5t5qVTKFPRrOMYvEFfGxbFdZg6Mt6S73DPCF9/l++7QW+DtdgZs8ewBmh7uPzIatAFsErQxCA8M+WlSphciw=
From: Henry Wang <Henry.Wang@arm.com>
To: "grant.likely@linaro.org" <grant.likely@linaro.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Andrew Wafaa <Andrew.Wafaa@arm.com>, Robert Booth
	<rob.booth@linaro.org>
Subject: RE: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Thread-Topic: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Thread-Index: AQHY7q5jhtRTV6uBfEqHQYoiBmmuwK45zBSAgAZvVACAAI3xIA==
Date: Wed, 16 Nov 2022 00:37:05 +0000
Message-ID:
 <GV2PR08MB800156DB2EA68819D1BF632392079@GV2PR08MB8001.eurprd08.prod.outlook.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-4-anthony.perard@citrix.com>
 <D374491A-0C9B-4A99-9276-44831EB4BCB2@arm.com>
 <D04DC85F-A139-4A5A-A8DB-298F80E0C6E7@linaro.org>
In-Reply-To: <D04DC85F-A139-4A5A-A8DB-298F80E0C6E7@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CEA7F980A210F449B3AC2BCE0CB511A4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|AS8PR08MB8350:EE_|AM7EUR03FT022:EE_|PA4PR08MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3baa36-a35e-4a0a-7af1-08dac76ab78a
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B8KVI8eB+qKCb03QyB1fCjeuCuLoZGtRibqe0cpJ/zPGOIb9Kbnsd1TTPTBY95eX9VG2hYRhzo6udanHNxF7TjRRymrdCO58QAphJaHOkffgyvEZRfhSwx4eYFaIddAXci2Wzy0EURLbFeIdPZjwVh4ySkdG6JQxwU9uk07lUmiu4NlaXZXOcndMCNhixO3LmEXi6Xu7zffSYL4UElccVSwSDD/jqgKX5Fd2L9IGqNeYA8LSFrpucbA7U+0rANZBhRx/klwJ6UcF3ZQiQ0BkUPOoTOKgm6yxRsAi3VqK1ndxuLChD7TFIRMaLcL8Y3Gdq0ahmLF2fmTLNsDpfeXu21SQON13oRUnp3m81R27fXjpv76zLifWq7qe+ID3I2gPGcDoI5yrrQkYmeTvHJ2X4iVLX8AkZ2T9sUcqIHWPQrP5P5yMV0D3NbVy/krujhvCcJJFBcQhN0opvNGD7b1/4lMNfvMzqgJGYFvqZI5bpf5wEA3M4QapTho14Xo5zGg4BEL3Zyh1Jrz3PdhlNDETcuAuB8ksIsqsk4t9G7nthce+n+olPntuzeq6ti0x57fcinbYpfieBIEGCdLaTU5/nP0NJ2UGsNorHgoVf7NREj1Gts1RZmlfDxIsujs01MM1W7OUs3546rcMjqykHH1YUzG85ByzGUGm1M/OQduWMAdn5uYdl1hsz3pOPAdP1it/40NXU8tmy/KE3iCgOD+7hf8TH4K2342z2F1mBTgMTzQ1s2CkmkI+Hv0dSsyWJ72llmA4XjL+ksASi99cEdyLsA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(122000001)(33656002)(38100700002)(6506007)(38070700005)(53546011)(86362001)(7696005)(26005)(8676002)(7416002)(4326008)(478600001)(6636002)(186003)(9686003)(54906003)(66476007)(66446008)(110136005)(66556008)(64756008)(76116006)(316002)(9326002)(55016003)(71200400001)(2906002)(5660300002)(41300700001)(66946007)(83380400001)(8936002)(52536014);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_GV2PR08MB800156DB2EA68819D1BF632392079GV2PR08MB8001eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8350
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e84c7f1e-04c9-4611-5dad-08dac76aaf83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hOtSTKHN0NK4vfQhkMy/tdduLxfiP3u/R+4Eg+QEorXaFCbxvCx8sYM2iPWL7k+FoqX3Dg3FDkf2/Y8IZ2uS0JWkoGMMbK3DMFHEFSCykErMnlE/leBbX4D4D9WF31e9O33q6St7FxS8WhMkBPV/luGh5Vcb7nI5L+1vw7sH0gzTZrz8BpHY3Chbu0VPYUr0zbQZO+4dSvIDykSMbs9NxcJ+rwN9Tpd0X5QDPYoNfwNdqm6fEf75RYgoq4uj7lw+6+9T0OY6AuM5a66THC2gJIxB7+ZgmD0lPTY0u19Ed6j58Hn9yzdcC4tC9MrzBSyC92ubeURIIx+ORCNChVVEs/m3QRc3sgaXmpeRHbBGbSZy9MxpSfL+D/6lXy3U+pxKdmfNLmqiBDgJrqa6HlJNqBCn/0Ss0zw7JABH/Kc+gnkVAPGTLFhVf7riu7GXuRWqUzsm0dQpaI2u1nhCxKPUW48FEdYOmlCAnc6JEnr8zg+iSfnOuin/HD6rvWUhUERhq3Mjt9ZTOEp+BJotpzSstDzh2O/tEUfWwORKKZHKQtekYr9hgxDhjPSXME7lxgv8ipZrH6ZrEVdbGBFvhCgGxqrCe2BgnmmM5gVuvSyC275CIVmzSFXq21Z+sBo+584wgP70OGrxldGuBAIHbda25ORXqx6kFIFFt+VtzVmU2Qg+ny5klqK56Dm6YeB5Bir4ri8Y18BJVbmNlt+mhAJRA90T5t13X718DCRNcw/0IqtbH2A1TWa6PLu8mq/pHBAhzZV/H+wLKK8V90kMUkMa3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(478600001)(40480700001)(2906002)(9686003)(107886003)(26005)(7696005)(53546011)(6506007)(336012)(186003)(47076005)(8676002)(70206006)(54906003)(70586007)(4326008)(110136005)(5660300002)(40460700003)(356005)(316002)(82310400005)(6636002)(52536014)(41300700001)(9326002)(8936002)(83380400001)(86362001)(33656002)(55016003)(36860700001)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 00:37:18.5332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3baa36-a35e-4a0a-7af1-08dac76ab78a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6192

--_000_GV2PR08MB800156DB2EA68819D1BF632392079GV2PR08MB8001eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Great thanks for the confirmation! This would timely resolve one of the rel=
ease blocker for the Xen 4.17 release :)

Kind regards,
Henry

From: Grant Likely <grant.likely@linaro.org>
Sent: Wednesday, November 16, 2022 12:08 AM
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>; Xen developer discussion <x=
en-devel@lists.xenproject.org>; Henry Wang <Henry.Wang@arm.com>; Andrew Coo=
per <Andrew.Cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; =
Jan Beulich <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Sta=
bellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Andrew Wafaa <Andre=
w.Wafaa@arm.com>; Robert Booth <rob.booth@linaro.org>
Subject: Re: [XEN PATCH for-4.17 3/4] xen: Add licence header to device_tre=
e_defs.h

Linaro approves the license change

Acked-by: Grant Likely <grant.likely@linaro.org<mailto:grant.likely@linaro.=
org>>

On 11 Nov 2022, at 13:51, Bertrand Marquis <Bertrand.Marquis@arm.com<mailto=
:Bertrand.Marquis@arm.com>> wrote:

Hi,

+Grant Likely from Linaro.

In the following change, we need to change the license to MIT (from GPL) of=
 one of Xen public headers which has a Linaro copyright.

@Grant Likely: could you confirm that Linaro is agreeing for Xen Project to=
 do such a change ?

Kind regards
Bertrand Marquis


On 2 Nov 2022, at 11:28, Anthony PERARD <anthony.perard@citrix.com<mailto:a=
nthony.perard@citrix.com>> wrote:

This header have been created by moving code from other part of the
project and miss a licence header. The original source code was some
version of GPL or LGPL but we intend to have the public header to be
MIT so they can be included easily in other projects.

Part of device_tree_defs.h were moved from libxl_arm.c which is
LGPL-2.1-only. And part were moved from device_tree.h that is
GPL-2.0-only.

Part of the original code were added by Julien Grall @ Citrix with a
Linaro "hat" in commits c3ba52a84dd8 and 405c167f0ec9 and
886f34045bf0. The other part were added by Ian Campbell @ Citrix, with
commit 0c64527e7fc9.

Resolves: xen-project/xen#35
Fixes: 1c898a9fec7e ("xen/arm: move a few DT related defines to public/devi=
ce_tree_defs.h")
Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com<mailto:Andrew.Cooper3=
@citrix.com>>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com<mailto:anthony.per=
ard@citrix.com>>
---

Notes:
  Julian was working @citrix until 2015.

xen/include/public/device_tree_defs.h | 6 ++++++
1 file changed, 6 insertions(+)

diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/dev=
ice_tree_defs.h
index 228daafe81..9e80d0499d 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -1,3 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2013 Linaro Limited
+ * Copyright (c) 2015 Citrix Systems, Inc
+ */
+
#ifndef __XEN_DEVICE_TREE_DEFS_H__
#define __XEN_DEVICE_TREE_DEFS_H__

--
Anthony PERARD




--_000_GV2PR08MB800156DB2EA68819D1BF632392079GV2PR08MB8001eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Grant, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Great thanks for the confirmation! This would timely=
 resolve one of the release blocker for the Xen 4.17 release :)<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kind regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Henry<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Grant Likely &lt;grant.likely@linaro.or=
g&gt; <br>
<b>Sent:</b> Wednesday, November 16, 2022 12:08 AM<br>
<b>To:</b> Bertrand Marquis &lt;Bertrand.Marquis@arm.com&gt;<br>
<b>Cc:</b> Anthony PERARD &lt;anthony.perard@citrix.com&gt;; Xen developer =
discussion &lt;xen-devel@lists.xenproject.org&gt;; Henry Wang &lt;Henry.Wan=
g@arm.com&gt;; Andrew Cooper &lt;Andrew.Cooper3@citrix.com&gt;; George Dunl=
ap &lt;george.dunlap@citrix.com&gt;; Jan Beulich &lt;jbeulich@suse.com&gt;;
 Julien Grall &lt;julien@xen.org&gt;; Stefano Stabellini &lt;sstabellini@ke=
rnel.org&gt;; Wei Liu &lt;wl@xen.org&gt;; Andrew Wafaa &lt;Andrew.Wafaa@arm=
.com&gt;; Robert Booth &lt;rob.booth@linaro.org&gt;<br>
<b>Subject:</b> Re: [XEN PATCH for-4.17 3/4] xen: Add licence header to dev=
ice_tree_defs.h<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Linaro approves the license change<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Acked-by: Grant Likely &lt;<a href=3D"mailto:grant.l=
ikely@linaro.org">grant.likely@linaro.org</a>&gt;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">On 11 Nov 2022, at 13:51, Bertrand Marquis &lt;<a hr=
ef=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&gt; wro=
te:<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Hi,<br>
<br>
+Grant Likely from Linaro.<br>
<br>
In the following change, we need to change the license to MIT (from GPL) of=
 one of Xen public headers which has a Linaro copyright.<br>
<br>
@Grant Likely: could you confirm that Linaro is agreeing for Xen Project to=
 do such a change ?<br>
<br>
Kind regards<br>
Bertrand Marquis<br>
<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On 2 Nov 2022, at 11:=
28, Anthony PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.com">anthony=
.perard@citrix.com</a>&gt; wrote:<br>
<br>
This header have been created by moving code from other part of the<br>
project and miss a licence header. The original source code was some<br>
version of GPL or LGPL but we intend to have the public header to be<br>
MIT so they can be included easily in other projects.<br>
<br>
Part of device_tree_defs.h were moved from libxl_arm.c which is<br>
LGPL-2.1-only. And part were moved from device_tree.h that is<br>
GPL-2.0-only.<br>
<br>
Part of the original code were added by Julien Grall @ Citrix with a<br>
Linaro &quot;hat&quot; in commits c3ba52a84dd8 and 405c167f0ec9 and<br>
886f34045bf0. The other part were added by Ian Campbell @ Citrix, with<br>
commit 0c64527e7fc9.<br>
<br>
Resolves: xen-project/xen#35<br>
Fixes: 1c898a9fec7e (&quot;xen/arm: move a few DT related defines to public=
/device_tree_defs.h&quot;)<br>
Reported-by: Andrew Cooper &lt;<a href=3D"mailto:Andrew.Cooper3@citrix.com"=
>Andrew.Cooper3@citrix.com</a>&gt;<br>
Signed-off-by: Anthony PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.c=
om">anthony.perard@citrix.com</a>&gt;<br>
---<br>
<br>
Notes:<br>
&nbsp;&nbsp;Julian was working @citrix until 2015.<br>
<br>
xen/include/public/device_tree_defs.h | 6 ++++++<br>
1 file changed, 6 insertions(+)<br>
<br>
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/dev=
ice_tree_defs.h<br>
index 228daafe81..9e80d0499d 100644<br>
--- a/xen/include/public/device_tree_defs.h<br>
+++ b/xen/include/public/device_tree_defs.h<br>
@@ -1,3 +1,9 @@<br>
+/* SPDX-License-Identifier: MIT */<br>
+/*<br>
+ * Copyright (c) 2013 Linaro Limited<br>
+ * Copyright (c) 2015 Citrix Systems, Inc<br>
+ */<br>
+<br>
#ifndef __XEN_DEVICE_TREE_DEFS_H__<br>
#define __XEN_DEVICE_TREE_DEFS_H__<br>
<br>
-- <br>
Anthony PERARD<br>
<br>
<o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_GV2PR08MB800156DB2EA68819D1BF632392079GV2PR08MB8001eurp_--

