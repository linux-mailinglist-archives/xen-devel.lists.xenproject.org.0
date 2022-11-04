Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F53618E50
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 03:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437230.691450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqmXU-00075z-Mi; Fri, 04 Nov 2022 02:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437230.691450; Fri, 04 Nov 2022 02:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqmXU-00073f-J7; Fri, 04 Nov 2022 02:34:36 +0000
Received: by outflank-mailman (input) for mailman id 437230;
 Fri, 04 Nov 2022 02:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKjc=3E=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqmXS-00073Z-N0
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 02:34:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60051.outbound.protection.outlook.com [40.107.6.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 368f90b6-5be9-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 03:34:32 +0100 (CET)
Received: from AS9PR06CA0749.eurprd06.prod.outlook.com (2603:10a6:20b:487::35)
 by DU0PR08MB7737.eurprd08.prod.outlook.com (2603:10a6:10:3bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 02:34:26 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::f6) by AS9PR06CA0749.outlook.office365.com
 (2603:10a6:20b:487::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 02:34:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 02:34:25 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 04 Nov 2022 02:34:25 +0000
Received: from 203ee45efe32.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 630CE2A2-FC6C-41CB-9835-76201F7C5587.1; 
 Fri, 04 Nov 2022 02:34:19 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 203ee45efe32.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 02:34:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6332.eurprd08.prod.outlook.com (2603:10a6:10:258::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 02:34:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 4 Nov 2022
 02:34:16 +0000
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
X-Inumbo-ID: 368f90b6-5be9-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Wbo0WZMES99eWhGddc52bNu59go2GkSyaPEvGmFGkRYq/slp0drhXt8LaVhHqaMS8p5Ym+dgAKJRuXypUCV8m9mWU6MlOpzDmnSnroR9lJ7lQo+pvgUKawmTyLwss/IneZP85+jZt7aQfwlMwzcZvlYBBqqiocAqFq0XyHXEvJUsNF93FwWDkB9OwD/mJaCDNWeD5pTeUsN2IOaRC8Of6ywzWZ6ToaqFGzhS8gaEFCiEhvz0GmeGXkaf0nUgLZ/FZq9rNJGAuKea8P6erKLJMgOYSRlKLpCNNxYNM73Oa443q+o3Ah1eso6O4+AMQoe8mbbLHedQkw4OlUaDb2X34A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23qKp8ButlWL4cXYmnm1YOIdtG+G16PRwEGbMk8Vgmg=;
 b=IwJdtFjtm6wD4GuwpdcAtriwOYOicDUf0Ob6qBWWb7pyju3twrAPfQTDL9OvfV320Wg0Uo+4cltlnwwNfU8dFAXJ21hJTZ+4lhNYpQPeceLC09zfYDeAFitl/XexSgb0gB67RaXv3Tt6EGw0IPHRS+FHwU8MR9FL8XfME840gPi5+LB0AWu4LtihZQ31nrM07fkdZPABX7/16tne4BsEJrY46/DDP1tGSjO8x3uxVXMTuUZxxYuVNwP5v5w/x74VVVwfq/FIONUufoc58zSqOdATXEu5fMB3WFpHcnk90u3HlmCvECvpnSotXe8hWh2EnVI8Am6w5HEvvRciTukIpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23qKp8ButlWL4cXYmnm1YOIdtG+G16PRwEGbMk8Vgmg=;
 b=LgCUvHVt+flEzztU08kTMVUMGS1VuBM4FdL26dnweyk9p5D7xsg7o0dtLTpJrXlooRRbgJzkX88ji1OhKiP18BjqBFieLQZ49/1yEqsaSG8d9Q6n8C3sLg9TLcMK+xv3Rhny8DECksNIFc0ApWhTI147tc4gT0Fmah/JpLF45Lk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MruC0lOsSv3abyAPShdVLDD5FGQ8S7ltajoPpG+1FgxAJI2pH0S/PQTITh+NzQ4AcxbUFUBGnz7pPoDcFz7rAt9TYfaob+rmlwrqigY/QoMhLwYFBEzdOsbDuovN6/SfzWq8NBHw3av10B1pnMk1wGGIjprnri9uxbI2oENTHsch2vLpyqM9SlvGmF0C60sNNF0TWc8aGQ8ljCru1ExhKL9M2o67Bqqj54g2mHPOrU/6JrBCHme0zgebvvFeWGHt2pfFSGrEqcIX97DR6/LbR90LXxeBhFIYm9MS2AMlOxt6st2291IwaEUeVEA5nA2KebgoYlkah8goGt7CFuF22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23qKp8ButlWL4cXYmnm1YOIdtG+G16PRwEGbMk8Vgmg=;
 b=SOZ3W4KSdy3nufyDxgmEUImHiUFSS97yln5YqUEqccYyV2o+LkHDXq1oooKmrCVMmpx2e9S7NkRWtwqskYL83yyU+rvgTI3Fgi5fYeAwcF0YtDd7mRWZEem2PxubZbaCNTVI/1s8ZqiIMAsRuS1SoF0KHuBY19HHH+5dJb0seVrBfXtin/dbFg12aazbnnUscyVmwRQ8ms/6BqSodScZznB1o81wK9VrEp3xMx+GfAoBDv3ke44sr6wN3ZGv0hnCBxTOpFI4MU76/1Tw0ify9WYyyVCBwZ0frPYyKUpRXStnP7WEPQPOx3NajF2dbwItY4KDJ/pnl/OjIY/p8LorLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23qKp8ButlWL4cXYmnm1YOIdtG+G16PRwEGbMk8Vgmg=;
 b=LgCUvHVt+flEzztU08kTMVUMGS1VuBM4FdL26dnweyk9p5D7xsg7o0dtLTpJrXlooRRbgJzkX88ji1OhKiP18BjqBFieLQZ49/1yEqsaSG8d9Q6n8C3sLg9TLcMK+xv3Rhny8DECksNIFc0ApWhTI147tc4gT0Fmah/JpLF45Lk=
From: Henry Wang <Henry.Wang@arm.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API
Thread-Topic: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory
 API
Thread-Index:
 AQHY1AgeJwq4WhKefkGyVS1JhkdRo64QKSwAgAG7SUCAAH/pgIAZrF0AgAClVGCAAR6tgIAAbuMg
Date: Fri, 4 Nov 2022 02:34:16 +0000
Message-ID:
 <AS8PR08MB7991FE8EC5F0208A45FD5F21923B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
 <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>
 <Y0s5Xvr5PBQq5pVB@mail-itl>
 <AS8PR08MB7991A2F3DE5A5B55ED3D09F492299@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2214fd86-0cfa-58ef-39db-6f913a9de75e@suse.com>
 <2ee2c1f9-a6bf-7641-16fa-ce2ea90f377b@suse.com>
 <AS8PR08MB7991EAAF194842E14F28F62092389@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <Y2Qc/j8WYETDHjr8@mail-itl>
In-Reply-To: <Y2Qc/j8WYETDHjr8@mail-itl>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 947DB807AF30744E98408F7E2B3B5F5D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6332:EE_|AM7EUR03FT046:EE_|DU0PR08MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: ef430195-1947-4b2d-851c-08dabe0d1709
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JO5FV/4n1tYoPzpaNDLFThN7ubvybOS5B4bgTPP0/qljMLRdO89LLFI9xkLMcX+JYhUXLcL0XXQX4GZLMkrxDDGfUhGe0WFB7d01zj3vjyRjizbQfGS6IXzuLk/gev01PYdIaL4Dl81aRgbc+CSdJrH1Cxo0flE04BvPh6/3Z0XNo0ptjMq0XXQUJJYauiv/Vi3NVzXoS87QQnR2Y63ZQk4fo8MVUp/gC2xtSf5tBGlsg40iSI4AsZpbpexiwFyuwyeM30LmKQki2V5mngEyBaxrX4aZEpVJuVLQq/Vmxh4FaQbrGk/1LZqrpVyy/yDiUq3Oc6H0H/3AIdcFDPMPywIm4LnendcSX7teJyXYSvZy1uQTdcakzKRmTg027BNPoeSSMwTZzH8gbUZ0K53qCaWX/kilHRvyu5xtXYe0t6Jen+lkFDFepCyt0U0J/G/RSteSMnAW3N8uxsJx3NcBm+Fk10pf65TdZUxnNmx2buUxUBokEXtf7p+rvgR0FAwEMo2V3fqKZMsxmaAPXtIOOfh86ZF5aQLKir0WOo9oUK9ETemCSmPXGRvGO7SNH+UQCVmJOo+woi1fH8UHvlB70JHc8N+V9MGVotfqDviSolFEXQoNCJAetzKm7Hwb61qL6tR5wryjrVIqi7uwJvj6riKIwqvTCY3uajgh+28VJX/QYHUZS1ZHPOYbzEST/gzyYS/lcRCCDOmCZxUI21pxsGzP8Ekz+DKUTsW4e0GCjtzdq65FVJ6c/rFyNCob7rpbB/kutrui0CIViSKgZwDShA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(38070700005)(55016003)(33656002)(86362001)(41300700001)(66446008)(9686003)(64756008)(66476007)(66556008)(4326008)(8676002)(76116006)(66946007)(26005)(4744005)(71200400001)(5660300002)(8936002)(52536014)(478600001)(7696005)(6506007)(122000001)(54906003)(6916009)(316002)(186003)(38100700002)(2906002)(66574015)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6332
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4f16303-5446-4d1b-9651-08dabe0d11ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IQAof5Idf/jG9PV7ejbcjLVI8bytknEDP6kXiffcNRZbt99+ZZusv6xJx4I1NUewjlDVZkeuzGdYH4CC7rr2fR1ztIobmQ7ZTaT7pACQKarirdSZQk1sXlKxHhIE30oO4hzo+T9K3PtWEMPeO37R6AD2hG63eF4elCkzUc7/FdD80waFtzBHkHosnuOrbDpraTDglhTgO82XaCQzD85K7LCQuQUU8vFplMKHen81TLrGzBueedmON2Xqkf+8zemAx7Gv5cIqWd8NRGRcKEDhokDTP9eSrEb1JknahQn9SwUWsCTSM1DUNnd47itPYhzi0XqHdXOg+eLwPsQZkbx/89pMI+VOAAlbh6GUnMahNHWJb/GCdESjvi+aAEMm4IghYBMQDCv0xpMkYtWfrYCd14HcKlfZqXaQXiEYxAeF8hIWg1pF+7lrzssORUvCNhEwfZXlUO7eMhSNky8b6BGBQqz1QwSQV0da7yv7c9746dSsFTS43QI8N1hbD+i8iGgiBjR9hiOnzoNAmny8msA2DHCyZZmsLyBNheo86H5+Ojj0Qkcjm2JsO7lR002Xwp6GlP0PT7C9+p2BGxtoKV4oNjWcN+/rKV/HUxLtV38R0AkXpmYiLtPVUptTvbqwydD2rmJOnonnjxAqJXTn8uoPzhKmiN4NlFlHix5rVO4kAjVlSXwgynO1/FwUJBJ8Gx8gUXX3ggdjPtXIzxORD64ortOipn57Pcq//kmUgUSlPlaW3z9KWxx1wxVRV7cUTfBU+/srMRINfqCmeLth87M7DA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(52536014)(40480700001)(8936002)(41300700001)(6862004)(478600001)(55016003)(33656002)(5660300002)(70586007)(70206006)(316002)(36860700001)(8676002)(4744005)(356005)(83380400001)(54906003)(6506007)(4326008)(86362001)(81166007)(26005)(82740400003)(186003)(47076005)(40460700003)(336012)(7696005)(9686003)(66574015)(82310400005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 02:34:25.5604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef430195-1947-4b2d-851c-08dabe0d1709
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7737

SGkgTWFyZWssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gDQo+IEZXSVcsIG1v
c3Qgb2YgdGhlIGRpZmYgaXMganVzdCBleHRyYWN0aW5nIGxvb3AgYm9keSBpbnRvIGEgZnVuY3Rp
b24sIHRoZQ0KPiBvbmx5IGZ1bmN0aW9uYWwgZGlmZmVyZW5jZSBpcyBhIG5ldyBjYWxsZWQgZm9y
IHRoaXMgZnVuY3Rpb24sIGFuZCBtb3ZpbmcNCj4gb25lIG9mIHRoZSBjaGVja3MgKE1BWF9VU0VS
X1JNUlJfUEFHRVMgZW5mb3JjZW1lbnQpIG91dHNpZGUgb2YgaXQuIFNvLA0KPiBteSAoYmlhc2Vk
KSBvcGluaW9uIGlzLCBpdCdzIHJhdGhlciBsb3cgcmlzay4NCg0KSSB0aGluayB5ZXN0ZXJkYXkg
SmFuIGhhcyBjb21taXR0ZWQgdGhpcyBwYXRjaCA6KQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0K
DQo+IA0KPiAtLQ0KPiBCZXN0IFJlZ2FyZHMsDQo+IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aQ0KPiBJbnZpc2libGUgVGhpbmdzIExhYg0K

