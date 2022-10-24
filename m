Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043B60A996
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 15:22:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429129.679979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxPb-0007go-O6; Mon, 24 Oct 2022 13:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429129.679979; Mon, 24 Oct 2022 13:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxPb-0007dp-L5; Mon, 24 Oct 2022 13:22:39 +0000
Received: by outflank-mailman (input) for mailman id 429129;
 Mon, 24 Oct 2022 13:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=smss=2Z=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1omxPZ-0007cK-G6
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:22:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec7e2137-539e-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 15:22:36 +0200 (CEST)
Received: from AM7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:20b:100::31)
 by AS2PR08MB10111.eurprd08.prod.outlook.com (2603:10a6:20b:62d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 13:22:33 +0000
Received: from VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::e9) by AM7PR02CA0021.outlook.office365.com
 (2603:10a6:20b:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 24 Oct 2022 13:22:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT065.mail.protection.outlook.com (100.127.144.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Mon, 24 Oct 2022 13:22:33 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Mon, 24 Oct 2022 13:22:33 +0000
Received: from 64c6b23c766a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 244069C2-0C5B-4BD5-81E6-71B0328FE2FE.1; 
 Mon, 24 Oct 2022 13:22:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64c6b23c766a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Oct 2022 13:22:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9814.eurprd08.prod.outlook.com (2603:10a6:20b:615::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 13:22:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 13:22:23 +0000
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
X-Inumbo-ID: ec7e2137-539e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h4LZgxv71UrXwWljPSOkwR0b+N4yXFgcj0Puz7nRwlbrJQP5OloAoCYPoi5HwYSen7tuOZJamHSOuk59KGIhfALHSBJDa/wHpvIckfL/0iT5gfl29EShtfx+oufP2xECRzP70wHLylIBNGI8ugDdWtbdkMY4DWhXCb4yhZ0Ky5yNLiYxE6REbUAxrRNOthlUaTpg6EAuiTDcABAJcHsmtvf8GavS19yQusFHpbSgBuaDpiC1bp81cwonR3+vXgOfhW1i/cSfAZA0O6lP1/D4ZI/vLRG+Q9g3OWR+i0ZNM/Or7dsWUK9n/GdcFEfMvup4MBLER3HJ0CkSiHea+7PEEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV+l8s9ynY6OCdNQaZuRBc1JZ1B0WK839huWElfwNYQ=;
 b=Eiv6ccP9V5K2vtJUwqoRJVe55LhKd1RFNTAbc95UieSshpGY6dcapXp5boKQdhK0+YaX3bpjQwA2V+v8TnUOpjooMD/kowmbbnWjU0pw7nVR7HSD6HlCHKssK85xhCGLgn+pF5/97rv60faqAFbVKvZxNoiGkhflgbgYVvsyt0De4MzJlfNN6YZl9lKVRfhoSgCHsZelTqQ490Cg2W+x+XdQ+Fnv5Gn4fTAShzlaYmwthiwlEbkckNtAnfocJqDDLvcIKYSyyQiNuoKt5dNFblyzuKuiEgFsapwuXWwXtrVgP7nkt1YWPvfXhQz/ArRN6LdMDEVSxqiWk+/ikKEvQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV+l8s9ynY6OCdNQaZuRBc1JZ1B0WK839huWElfwNYQ=;
 b=uaGnY8wcoan5a8/RXYYkIJLcNVuouQ4Em/0tNxN8FsI6nGXuaWDwJCwOXv00GHYLxAma+RpGaOPZo/4+4byV701+00ozPcp7DJGK302TNnSWaMIuW2H3zBowkfve7s8fP5HjbjIQ548MjWrw74JBL3QlrzWz46yYSso5llbXNsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3df7fe4210ca75bd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irPyM3Mv5Hrut2cURwc2g9HhPzXup/N0kLfo31TpfsnPcCGDkB+GPCMMGxJ2jlazlEpu0kQncQF+mtp6hRwtLYeAjbPd37bVclWXWA7CJnnTHgV4V4YYHmt+u1oakaEr6ehImJzUrQURTGErl0Wtk5DPY5FYUxh4NStaS2CloRL9Dbe3PGrZXEJJ5TbCszUbxeAkjOobRz4pFzz41SHBSiAWVsKsg9LoanXhW+j92f2ANkRihYc+zhNBteIDL5mg37s/pywCYpr4nM26J1LhZ55Dyz/Fvm2R20z+uNPsFHaFjWLmVPO6BacDaTugXNfAxWRG9zaxXH9iSzuNjtmRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV+l8s9ynY6OCdNQaZuRBc1JZ1B0WK839huWElfwNYQ=;
 b=njkl8qLzLcveo+8YrJiPceXGdVbZKjjpdfEIHWwNKQdl8nwdCV9cU/Eeg+PRWv6UsM5DLcXeNp052Zbx8XMLA67GxPNt0q9e7ZsJ7jdz+nfgMgb2Wb7GmaTLUmzdPvW2wba9VCNjvqP8VZFBe3+D5UmWGom0+CwnKA4mAhpFZiEJ+I4HKi3FKyJp56PdpDa9qb/4gLfKudQGj6J71wue/f/m8gI1foiCG+iisn6HQwxJ3kSpl/M5pOdlNA3resbGII1heb/6m/0rSskTvuJUFEMkvzvlOTFUqbZnKVJsKYamZ0YkJzz6xmelW87i+24JP6Tn7tSxL1bjDQGP2x5Qug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV+l8s9ynY6OCdNQaZuRBc1JZ1B0WK839huWElfwNYQ=;
 b=uaGnY8wcoan5a8/RXYYkIJLcNVuouQ4Em/0tNxN8FsI6nGXuaWDwJCwOXv00GHYLxAma+RpGaOPZo/4+4byV701+00ozPcp7DJGK302TNnSWaMIuW2H3zBowkfve7s8fP5HjbjIQ548MjWrw74JBL3QlrzWz46yYSso5llbXNsQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN v2] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Thread-Topic: [XEN v2] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
Thread-Index: AQHY5HCY/1GJrkxfi0yPJz1IUtcgr64dV76AgAAzqYCAAAMFgA==
Date: Mon, 24 Oct 2022 13:22:23 +0000
Message-ID: <F8CD5734-B62A-403E-B888-AA24053A9F03@arm.com>
References: <20221020104146.29841-1-ayankuma@amd.com>
 <AE2C68A9-4276-444C-B227-F079D330EB8A@arm.com>
 <ba43677f-903b-f30c-76e4-1668cdab2cc2@amd.com>
In-Reply-To: <ba43677f-903b-f30c-76e4-1668cdab2cc2@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9814:EE_|VI1EUR03FT065:EE_|AS2PR08MB10111:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ce3ca2-fd8b-4cd5-ae72-08dab5c2cf72
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LUsNuRwFZvvDfEsRZWDukfvb25htyfYF5dHHjH0gFWjR7hbk/HxgOlmckQGYt2vVj+YuV2F/YSoqV3RroImL9Y0NxvLCFbfKSu2V36H6WtQEfddJZCrNbi6khYx+oTR/bk6O7hy8dNF+3vDppXMChqbght5mTtm8pVdEnaGc17cNxTVCTY0xK8k8gpCrvaxX1mT16zY+XByOYcg+8A3ni01J08MPKVZJ5v4A1DqmjfS5RNdbouU7QZbh0misCCd7j7vvC1nmjWmQAmiMyRCp4oMcSr0W8TpsS4ZGmLWAaC392xX4i9Q02e1L5sXySaAx61QSAupzsIrozt+vXz4fU5d8BkPWvQYikCAQlRO7yue6Du33ExXIQ31F5TZGlO8UAmTY0pasqi08dbvcRbUU38A3cduiqDiOKJhRZWb+iOTJ0tAp/iO2pGZZsbvtOtgG87HCjLW0NfUnbusEo2VfT0ZM14tTQz4qsD4E+Gy3Qba1D7/s+2ZjjFNYBOMfKwd8NAvKt+RYEeOI1HTiH6Ialgqnde4M8gqJTvjIFRugrliZ6tFuZnyxezOo1vHKAdiORk303K12+osGNSD098DqUYpDJ3eWI7KOnn8OswXzhzNlBbP16RWdqMaoXnBEgIWVm63P5n2Kkm4NcIsgk91zj7HOEUZvsQHgBswXmdFuu7t2jSH8+2ELxEmmqmJWBCH2dsXJE+W0KOlEiPowxtbiSo4ndyNQZBSR1H/QMtuUk8VEaTtefI0a6JQahSP13/tT7K1k0ZEqH/cyAlaKULoD7b4X7yl0N3xLYCS/D4TvreWI31O/lhV9hqPb+8BB93VEBkBH/xHqmO8xoltK4TfNfg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(36756003)(33656002)(186003)(38100700002)(122000001)(83380400001)(8936002)(4326008)(91956017)(76116006)(2906002)(66556008)(66476007)(66446008)(8676002)(66946007)(64756008)(54906003)(6916009)(5660300002)(41300700001)(86362001)(316002)(2616005)(53546011)(6506007)(71200400001)(26005)(6512007)(38070700005)(478600001)(966005)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <83810C997712CB428EC919FE0D17448B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9814
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5daa0fa4-7e54-42d1-642f-08dab5c2c96d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lCMU9bv6o+floiZirMkkPp5wojQCIq2zXSCXsddwUVl1FpZaH2UIRPKVKvfSbOkwR+3r5azv//ui8AVDMu3JUMK4NnuSJURjaIHMXEbeMZFm2H2O2+SNdWVR8uWpfdlVC7e2zbloy7ezdroVTDb7xKCFV7IR4KqUd1R4733y4oko3pY8ZgIloAFwTcqNRY8Rvgag+/6ABRuBsgrHK8nOeu0qhThSY4p+jOYpRuAupZf9i/vj0DUPQije+3PdK50txRsN0L9aHWeD2ttnp2ZNYKu4+cbtnoAlA9qqVVbBmxz2Rq5NGx68gsCefUq37QMOjCaAuEiCD81yvsgMVuWGanzxkJ0EEgknZlRoWK/rGNjB40BAPzxomNYh9q3bUsNKJh3NG+D61gNM8zqr28/XtbAdbA+XhmodcIPom4NpMuwwP9kOG+6EnsbTRnApi0HHGkGt3nQZnYJTlmYrqtalr2MBrRmIWWpN2NEhpHqhjM9LLo4qWwe7HvqV9OMsP5ttibVx9q3+TiNYIezfQsTxkxJsNxDYk3fJqVCJD70BI7TH/eT3a/isU4MiA8j9F9Q7/o2OHVL9pwVSl6+JM6+YroWTjRCWi36wwSvnP6ZdZLvdrboJD6pfQMBOI6bniyoBFwCQRwLoQwext5mUTJv3mQuB7VrBN1B2da2TDm59vjmyDNzOnMzP/ZuUK1LY0VQxyy1c+tI4n9dyXsq7g6iza2BnzpkVKO1zGuDyl+jmaOzfxxz37194SqmSXjOMCPfpB7eYgFZyLdQkEcGxv8gbojkOd7fvZsuMjv2pYMcc0i8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(47076005)(86362001)(33656002)(36860700001)(8936002)(82740400003)(81166007)(356005)(336012)(6862004)(5660300002)(70586007)(70206006)(41300700001)(8676002)(4326008)(2906002)(53546011)(82310400005)(6506007)(6486002)(107886003)(26005)(2616005)(40460700003)(40480700001)(36756003)(6512007)(54906003)(966005)(316002)(478600001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 13:22:33.3622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ce3ca2-fd8b-4cd5-ae72-08dab5c2cf72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10111

SGkgQXlhbiwNCg0KPiBPbiAyNCBPY3QgMjAyMiwgYXQgMTQ6MTEsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFua3VtYUBhbWQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBPbiAyNC8xMC8yMDIyIDExOjA2
LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgQXlhbiwNCj4gSGkgQmVydHJhbmQsDQo+
PiANCj4+PiBPbiAyMCBPY3QgMjAyMiwgYXQgMTE6NDEsIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFu
a3VtYUBhbWQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBSZWZlciBHSUMgdjMgc3BlY2lmaWNhdGlv
biAoQXJtIElISSAwMDY5SCBJRDAyMDkyMiksIElHUlBNT0RSIChzaW1pbGFyIHRvDQo+Pj4gSUdS
T1VQUikgaXMgcmVsZXZhbnQgb25seSB3aGVuIHRoZSBndWVzdHMgcnVuIGluIHNlY3VyZS9ub24t
c2VjdXJlIG1vZGUuDQo+PiBUaGlzIHNlbnRlbmNlIGlzIGEgYml0IG1pc2xlYWRpbmcgYXMgZ3Vl
c3RzIGFyZSBhbHdheXMgcnVubmluZyBpbiBlaXRoZXIgc2VjdXJlIG9yIG5vbi1zZWN1cmUuDQo+
IA0KPiBPaCwgbXkgdW5kZXJzdGFuZGluZyBmcm9tIHRoZSBjb21tZW50ICJXZSBkbyBub3QgaW1w
bGVtZW50IHNlY3VyaXR5IGV4dGVuc2lvbnMgZm9yIGd1ZXN0cyIgaXMgdGhhdCBYZW4gZG9lcyBu
b3QgYWxsb3cgZ3Vlc3RzIHRvIHJ1biBpbiBzZWN1cmUgbW9kZS4NCj4gDQo+IEFsc28sIGRvZXMg
WGVuIGl0c2VsZiBldmVyIHJ1biBpbiBzZWN1cmUgbW9kZSA/IEkgdGhvdWdodCBpdCB3YXMgbm8u
DQo+IA0KPiBGcm9tIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hlbl9BUk1fd2l0
aF9WaXJ0dWFsaXphdGlvbl9FeHRlbnNpb25zDQo+IA0KPiAiVGhlIHByaW1hcnkgcmVxdWlyZW1l
bnQgaXMgdGhhdCB0aGUgaHlwZXJ2aXNvciBtdXN0IGJlIGxhdW5jaGVkIGluIE5vbi1TZWN1cmUg
SHlwZXJ2aXNvciBtb2RlIG9ubHkuIg0KDQpGb3IgYSBsb25nIHRpbWUgdGhlcmUgd2FzIG5vIEVM
MiBpbiBzZWN1cmUgbW9kZSBzbyB0aGF0IHdhcyBub3QgZXZlbiBwb3NzaWJsZS4NClRoaXMgaGFz
IGJlZW4gaW50cm9kdWNlZCBpbiB0aGUgcGFzdCB5ZWFyIGJ1dCBub2JvZHkgZXZlciB0ZXN0ZWQg
dGhhdCBhcGFydCBmcm9tIHRoZSB3b3JrIG9uIFI4MiBhbmQgUjUyLg0KDQpTbyBmb3Igbm93LCBY
ZW4gbXVzdCBiZSBsYXVuY2hlZCBpbiBub24gc2VjdXJlIG1vZGUsIGFueSBvdGhlciBzZXR1cCBp
cyB1bnN1cHBvcnRlZCAobWlnaHQgd29yayB0aG91Z2gpLg0KDQo+IA0KPj4gV2Ugc2hvdWxkIGp1
c3Qgc2F5IHRoYXQgd2UgZG8gbm90IHdhbnQgZ3Vlc3QgdG8gY2hhbmdlIHRoZSBncm91cCBvZiBp
bnRlcnJ1cHRzIHNvIHdlIGRvIGFzIGlmIGFsbCBndWVzdHMgYXJlIHJ1bm5pbmcgaW4gbm9uLXNl
Y3VyZS4NCj4+IA0KPj4+IEFzIFhlbiBkb2VzIG5vdCBpbXBsZW1lbnQgc2VjdXJpdHkgZXh0ZW5z
aW9ucyBmb3IgZ3Vlc3RzLCBzbyB0aGUgcmVnaXN0ZXJzDQo+Pj4gYXJlIGVtdWxhdGVkIGFzIHJl
YWQgYXMgemVyby93cml0ZSBpZ25vcmUuDQo+PiBJIHdvdWxkIHJlcGhyYXNlIHRoaXMgYXMg4oCc
WGVuIGRvZXMgc3VwcG9ydCB0byBydW4gaW4gc2VjdXJlIG1vZGUgc28gZW11bGF0ZSBhbGwgcmVn
aXN0ZXJzIGFzIHRoZSBoYXJkd2FyZSBkb2VzIGluIG5vbi1zZWN1cmUu4oCdDQo+IA0KPiBEbyB5
b3UgbWVhbiA/DQo+IA0KPiAiIFhlbiBkb2VzICpub3QqIHN1cHBvcnQgKmd1ZXN0cyogdG8gcnVu
IGluIHNlY3VyZSBtb2RlIHNvIGVtdWxhdGUgYWxsIHJlZ2lzdGVycyBhcyB0aGUgaGFyZHdhcmUg
ZG9lcyBpbiBub24tc2VjdXJlLiAiDQoNCkEgZ3Vlc3QgaXMgYWx3YXlzIHJ1bm5pbmcgaW4gdGhl
IHNhbWUgbW9kZSBhcyBYZW4uDQoNClRoZXJlIGlzIGEgcXVlc3Rpb24gZm9yIGd1ZXN0IHJ1bm5p
bmcgaW4gc2VjdXJlIG1vZGUgd2hlbiAoaWYpIFhlbiB3aWxsIHJ1biBpbiBzZWN1cmUgbW9kZTog
d2hhdCByaWdodHMgY2FuIHdlIGdpdmUgdG8gZ3Vlc3QgPw0KRnJvbSB0aGUgdGhlb3J5IHBvaW50
IG9mIHZpZXcsIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgZm9yIGEgZ3Vlc3QgdG8gcGxheSB3aXRo
IHRoZSBncm91cHMgSSB0aGluaywgYXMgaW50ZXJydXB0IG1hbmFnZW1lbnQgaXMgdG8gYmUgZG9u
ZSBieSBYZW4uDQoNClNvIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gc2F5IHRoYXQgdGhvc2Ug
aGFyZHdhcmUgcmVnaXN0ZXJzIGFyZSBub3QgYWNjZXNzaWJsZSB0byBYZW4gZ3Vlc3RzIGFzIFhl
biB3aWxsIGhhdmUgdG8gYmUgdGhlIG9uZSBwcm9ncmFtbWluZyBpbnRlcnJ1cHQgdG8gYmUgZmly
ZWQgaW4gc2VjdXJlIG9yIG5vbiBzZWN1cmUgd29ybGQuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0K
PiANCj4gLSBBeWFuDQo+IA0KPj4gDQo+PiBPbiBhIHNpZGUgbm90ZSwgdGhlIHF1ZXN0aW9uIG1p
Z2h0IGNvbWUgYXQgc29tZSBwb2ludCBpZiB3ZSBzdXBwb3J0IHRvIHJ1biBmcm9tIHNlY3VyZSBt
b2RlIG9uIGhhcmR3YXJlIHN1cHBvcnRpbmcgaXQsIGl0IGNvdWxkIGJlIHRoYXQgZG9tMCBvciBY
ZW4gaXRzZWxmIHdvdWxkIG5lZWQgdG8gbW9kaWZ5IHRob3NlLg0KPj4gDQo+PiBUaGUgY29kZSBp
cyBvaywganVzdCB0aGUgY29tbWl0IG1lc3NhZ2Ugd291bGQgbmVlZCBhIGJpdCBvZiByZXdvcmsg
SSB0aGluay4NCj4+IA0KPj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0KPj4gDQo+Pj4gU2lnbmVkLW9m
Zi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW5rdW1hQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4g
DQo+Pj4gT2JzZXJ2ZWQgdGhlIGlzc3VlIHdoaWxlIHJ1bm5pbmcgWmVwaHlyIG9uIFI1Mi4NCj4+
PiBBbHNvLCBmb3VuZCB0aGF0IEtWTSBoYXMgc2ltaWxhciBiZWhhdmlvdXIuDQo+Pj4gDQo+Pj4g
Q2hhbmdlcyBmcm9tOi0NCj4+PiB2MSAtIE1vdmVkIHRoZSBkZWZpbml0aW9ucyBvZiBHSUNEX0lH
UlBNT0RSLCBHSUNEX0lHUlBNT0RSTiB0byBnaWNfdjMNCj4+PiBzcGVjaWZpYyBoZWFkZXIuDQo+
Pj4gDQo+Pj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZzLmggfCAyICsrDQo+
Pj4geGVuL2FyY2gvYXJtL3ZnaWMtdjMuYyAgICAgICAgICAgICAgICAgfCA0ICsrKysNCj4+PiAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPj4+IA0KPj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2RlZnMuaCBiL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9naWNfdjNfZGVmcy5oDQo+Pj4gaW5kZXggMzRlZDVmODU3ZC4uNzI4ZTI4ZDVlNSAx
MDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2RlZnMuaA0K
Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfZGVmcy5oDQo+Pj4gQEAg
LTMwLDYgKzMwLDggQEANCj4+PiAjZGVmaW5lIEdJQ0RfQ0xSU1BJX05TUiAgICAgICAgICAgICAg
KDB4MDQ4KQ0KPj4+ICNkZWZpbmUgR0lDRF9TRVRTUElfU1IgICAgICAgICAgICAgICAoMHgwNTAp
DQo+Pj4gI2RlZmluZSBHSUNEX0NMUlNQSV9TUiAgICAgICAgICAgICAgICgweDA1OCkNCj4+PiAr
I2RlZmluZSBHSUNEX0lHUlBNT0RSICAgICAgICAgICAgICAgICgweEQwMCkNCj4+PiArI2RlZmlu
ZSBHSUNEX0lHUlBNT0RSTiAgICAgICAgICAgICAgICgweEQ3QykNCj4+PiAjZGVmaW5lIEdJQ0Rf
SVJPVVRFUiAgICAgICAgICAgICAgICAgKDB4NjAwMCkNCj4+PiAjZGVmaW5lIEdJQ0RfSVJPVVRF
UjMyICAgICAgICAgICAgICAgKDB4NjEwMCkNCj4+PiAjZGVmaW5lIEdJQ0RfSVJPVVRFUjEwMTkg
ICAgICAgICAgICAgKDB4N0ZEOCkNCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMt
djMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMNCj4+PiBpbmRleCA3ZmI5OWE5ZmYyLi4wYzIz
ZjZkZjlkIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMNCj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vdmdpYy12My5jDQo+Pj4gQEAgLTY4NSw2ICs2ODUsNyBAQCBzdGF0aWMg
aW50IF9fdmdpY192M19kaXN0cl9jb21tb25fbW1pb19yZWFkKGNvbnN0IGNoYXIgKm5hbWUsIHN0
cnVjdCB2Y3B1ICp2LA0KPj4+ICAgICBzd2l0Y2ggKCByZWcgKQ0KPj4+ICAgICB7DQo+Pj4gICAg
IGNhc2UgVlJBTkdFMzIoR0lDRF9JR1JPVVBSLCBHSUNEX0lHUk9VUFJOKToNCj4+PiArICAgIGNh
c2UgVlJBTkdFMzIoR0lDRF9JR1JQTU9EUiwgR0lDRF9JR1JQTU9EUk4pOg0KPj4+ICAgICAgICAg
LyogV2UgZG8gbm90IGltcGxlbWVudCBzZWN1cml0eSBleHRlbnNpb25zIGZvciBndWVzdHMsIHJl
YWQgemVybyAqLw0KPj4+ICAgICAgICAgaWYgKCBkYWJ0LnNpemUgIT0gREFCVF9XT1JEICkgZ290
byBiYWRfd2lkdGg7DQo+Pj4gICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsNCj4+PiBAQCAtNzgx
LDYgKzc4Miw3IEBAIHN0YXRpYyBpbnQgX192Z2ljX3YzX2Rpc3RyX2NvbW1vbl9tbWlvX3dyaXRl
KGNvbnN0IGNoYXIgKm5hbWUsIHN0cnVjdCB2Y3B1ICp2LA0KPj4+ICAgICBzd2l0Y2ggKCByZWcg
KQ0KPj4+ICAgICB7DQo+Pj4gICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JR1JPVVBSLCBHSUNEX0lH
Uk9VUFJOKToNCj4+PiArICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JR1JQTU9EUiwgR0lDRF9JR1JQ
TU9EUk4pOg0KPj4+ICAgICAgICAgLyogV2UgZG8gbm90IGltcGxlbWVudCBzZWN1cml0eSBleHRl
bnNpb25zIGZvciBndWVzdHMsIHdyaXRlIGlnbm9yZSAqLw0KPj4+ICAgICAgICAgZ290byB3cml0
ZV9pZ25vcmVfMzI7DQo+Pj4gDQo+Pj4gQEAgLTExOTIsNiArMTE5NCw3IEBAIHN0YXRpYyBpbnQg
dmdpY192M19kaXN0cl9tbWlvX3JlYWQoc3RydWN0IHZjcHUgKnYsIG1taW9faW5mb190ICppbmZv
LA0KPj4+ICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSLCBHSUNEX0lDQUNUSVZFUk4p
Og0KPj4+ICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVBSSU9SSVRZUiwgR0lDRF9JUFJJT1JJVFlS
Tik6DQo+Pj4gICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JQ0ZHUiwgR0lDRF9JQ0ZHUk4pOg0KPj4+
ICsgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lHUlBNT0RSLCBHSUNEX0lHUlBNT0RSTik6DQo+Pj4g
ICAgICAgICAvKg0KPj4+ICAgICAgICAgICogQWJvdmUgYWxsIHJlZ2lzdGVyIGFyZSBjb21tb24g
d2l0aCBHSUNSIGFuZCBHSUNEDQo+Pj4gICAgICAgICAgKiBNYW5hZ2UgaW4gY29tbW9uDQo+Pj4g
QEAgLTEzNzksNiArMTM4Miw3IEBAIHN0YXRpYyBpbnQgdmdpY192M19kaXN0cl9tbWlvX3dyaXRl
KHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywNCj4+PiAgICAgY2FzZSBWUkFOR0Uz
MihHSUNEX0lDQUNUSVZFUiwgR0lDRF9JQ0FDVElWRVJOKToNCj4+PiAgICAgY2FzZSBWUkFOR0Uz
MihHSUNEX0lQUklPUklUWVIsIEdJQ0RfSVBSSU9SSVRZUk4pOg0KPj4+ICAgICBjYXNlIFZSQU5H
RTMyKEdJQ0RfSUNGR1IsIEdJQ0RfSUNGR1JOKToNCj4+PiArICAgIGNhc2UgVlJBTkdFMzIoR0lD
RF9JR1JQTU9EUiwgR0lDRF9JR1JQTU9EUk4pOg0KPj4+ICAgICAgICAgLyogQWJvdmUgcmVnaXN0
ZXJzIGFyZSBjb21tb24gd2l0aCBHSUNSIGFuZCBHSUNEDQo+Pj4gICAgICAgICAgKiBNYW5hZ2Ug
aW4gY29tbW9uICovDQo+Pj4gICAgICAgICByZXR1cm4gX192Z2ljX3YzX2Rpc3RyX2NvbW1vbl9t
bWlvX3dyaXRlKCJ2R0lDRCIsIHYsIGluZm8sDQo+Pj4gLS0gDQo+Pj4gMi4xNy4xDQo+Pj4gDQoN
Cg==

