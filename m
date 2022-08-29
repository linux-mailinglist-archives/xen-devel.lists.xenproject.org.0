Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986395A46FB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 12:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394528.633964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSbqD-0001qA-EX; Mon, 29 Aug 2022 10:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394528.633964; Mon, 29 Aug 2022 10:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSbqD-0001nM-BA; Mon, 29 Aug 2022 10:18:01 +0000
Received: by outflank-mailman (input) for mailman id 394528;
 Mon, 29 Aug 2022 10:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emil=ZB=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oSbqB-0001nG-FH
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 10:17:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da24da49-2783-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 12:17:57 +0200 (CEST)
Received: from AS9PR0301CA0003.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::24) by DB6PR0801MB1974.eurprd08.prod.outlook.com
 (2603:10a6:4:72::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:17:54 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::ae) by AS9PR0301CA0003.outlook.office365.com
 (2603:10a6:20b:468::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21 via Frontend
 Transport; Mon, 29 Aug 2022 10:17:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Mon, 29 Aug 2022 10:17:54 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Mon, 29 Aug 2022 10:17:53 +0000
Received: from 366aba678583.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 601978E7-0F52-45C6-8C52-888320BC8139.1; 
 Mon, 29 Aug 2022 10:17:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 366aba678583.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Aug 2022 10:17:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by HE1PR08MB2652.eurprd08.prod.outlook.com (2603:10a6:7:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:17:38 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:17:38 +0000
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
X-Inumbo-ID: da24da49-2783-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TZ3y35cUnluUotDOeVoo0qmhyLCfvJEIGaDsubu5pH5hHifTejJpVnXEMAnw52HpLXmYz5DlDRCUr3E7LziZQD6QPTAKVXK6BTnQMVqC8PgcnfD1ZmsGElrPcNyixhCk0FEfyCTQ/Dd1FrMlVucs9Cpgvl2pqeofRt1+zIA1m2fYdWm45qt83s0EA4iKgerEorcth+zFhIvZdnTIgyeXje8ht1Mea9KLRj4SwnfCr8kbPLHlygxR2jOzaw/ndWk7CWM6VrZU3R6C/+6OPa6P/ZeNNc+Vz2nyEC2VTGBHTDMsK7oGxY3V9F33zGWS9mX85+ULZbn6HnDRnQvNOGIdbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRNhH2fkOYjz9s/JKS8HNghlnSDdFFVSgBW+uGA9CIQ=;
 b=e8YYD/6bLBh7KT+88AQAZ543CwpOZu9KfQq/b1mSph0CCguPz/mZP60zUQUzGOgCHwWdx5wiO/ryrLxGen9H3eMqFdtqwFdahqgmwU5XaaXliWC8JkhfpBBTG1+gXS8UcKCbE1j/K+2MJX4RX2UD8y5bQaWvjwsW4a7WDian8aj6M17PDwKvnemu5Zg5pNmgbQfclsHBLlQqtOD3IF5gn5VLiCxdobtZomTB1XQ9yxT86S8GNddNfJS8b6V8xbgVpitTQnjCEtE0T82C/TAbXvebZ8sSfcNyTI/DPoGbp78qTDKrHBaseTkxNW4ysC7+lBNcTX9CtGPo/mQ36cOEHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRNhH2fkOYjz9s/JKS8HNghlnSDdFFVSgBW+uGA9CIQ=;
 b=iMQnWZeNln9eOddLo7N9d4y8asOQazyejMb6W9XgJMf1WU2YtISaUd8JbmE6qAFKIa4UHSsacTAdk6YayVxfslouQ+GeskOLSTJT4hGw+fGu8VKIsTggu4QkAZHj6R8YMkWgeudsLFnHdy0f1VdiGpLjPDf/9ZTk3zq8kmUDVF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1z/ip4LnaRWjkG8P9Nd1S4bmbXgBxrV9ZFQ8pD60D8HU3X1rdKUzK/wgSt/3836FRTfGWmmFpztuBEpD70C6peVe+QmOuA3kzjNCrUq3vql1bcblReaFl06QC3sHtqev6I8FNpVEEfZAv18TRY720D2hsnK6Df8Py6XByO/k8hPBbvkT5GaivTm7QaODhN9lvzlKEMb9ijGo7u15CCbbqzauutLP5zY5AAAPlF0DWugGaRQJewysGSUQx5FWZ107TLreyTI7Xy2lS/l3MomK9flb5MNga1cyBCpaIWJNey+t8MHx+xXnmACnVpnvmUqLfwEnNPdPXqTsfk4rmz9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRNhH2fkOYjz9s/JKS8HNghlnSDdFFVSgBW+uGA9CIQ=;
 b=fmqNPg2mzA83JXpiNf6Hgx6mhiMZ3Mf/LOVeTf5gS9hR6wrF5+xdjXQQTxWY6O/retseVbhNjFxVHX83EHZMBPQHkJM7VQ2tKB9wwewtt4G4ejAnxWY2SL5hENhqhZ4PRM5twsqv17ncO5qoQ56LM3+JBT3vLEHk8mnm7CXvQCpnkrc08Vfmk0QG/EABjtMCv51mXeS8GdeqYuXRcExFRqF7YbZSsh+JaJ7wcC9GqyDPXy6kwf8qK4pVjW1NWuj43rlIcavnm+YEjn2BBGzd3Ujf1a9B6xRbUjFLTXqWFb5Ju2sRnZMkFC6nwjnIzqaakMsySbXDGj0/673FUQx0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRNhH2fkOYjz9s/JKS8HNghlnSDdFFVSgBW+uGA9CIQ=;
 b=iMQnWZeNln9eOddLo7N9d4y8asOQazyejMb6W9XgJMf1WU2YtISaUd8JbmE6qAFKIa4UHSsacTAdk6YayVxfslouQ+GeskOLSTJT4hGw+fGu8VKIsTggu4QkAZHj6R8YMkWgeudsLFnHdy0f1VdiGpLjPDf/9ZTk3zq8kmUDVF8=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 4/6] xen/x86: use arch_get_ram_range to get information
 from E820 map
Thread-Topic: [PATCH v3 4/6] xen/x86: use arch_get_ram_range to get
 information from E820 map
Thread-Index: AQHYtdMz1vGBusPHbkWa5f3aYmkHna2/jMQAgAYiKbA=
Date: Mon, 29 Aug 2022 10:17:38 +0000
Message-ID:
 <PAXPR08MB7420CCB6E5456D9037E06C289E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-5-wei.chen@arm.com>
 <392cae07-d8da-8ecf-4356-cd5c6f983629@suse.com>
In-Reply-To: <392cae07-d8da-8ecf-4356-cd5c6f983629@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9E46011765101041BE290C683999FD69.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cb4682c0-8cdb-480f-501c-08da89a7bc94
x-ms-traffictypediagnostic:
	HE1PR08MB2652:EE_|AM7EUR03FT036:EE_|DB6PR0801MB1974:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ONMb0yPb1YFKdnc+Gb1vTauzTEcfTNcoYBqw4qftGd2/WT1nnmOTtmDyzPpGw7OOH1TTsUBwS8DRonulP/+jgeWhVPHDnP8+YK3kduxeKtwcxc8VxQ5XriBCed1y5bT7vkDkF4+Rio53xU8uuUt5MtuKheehCOErWIfKPpdss9g21fR32W1H9VqzqcY2yFDCdool1Mo44+X/y4wVMCbTv8jyms06DC45LOBqiT9YyBtX5GLVpHhDfV6oRQUmfcxfqjcVtN25MPgp12N37Jm+wXPr+CXCVkx/ofCWYqUM76Gyuqwze5L9VvVFTxpmQ8fAdjphgEp3Gst/I7V4on/VsUY5nIa9yB+yRbndVCB8fwK6bjRVOGfKb6lvtSz5DXRFNNtRrczU4emjnK4hwSkKyvrXVLsWSDl1KER7tt/3UvdHCb+icuuK/QCoL/X9wF4Hqrgd8mA62yP9L+qKPI6CVTrDTC8l8EIq6Q0L1BO++HcTkMRa5ccKRltEowCFTOmNAkFyaoNpC9p11Ump1f3trwq3a6N2MqGB32AHQeXQMQuetkDxmP7MyXhUgmRbPrZ/x593I/iPnZfy2eAlLeCZwJDzjg9I99LXQX2rN1v5aLgWDQSOVE2oShfzevQnM82ZV0jX1Sstwhp3rKZeJq8zixUcfGNbugvLCu8pmZhNuLDCL6OnzSpvSVU9/26uKh6NZoDXT1IprKGbKt5qttc0zGFdgeg8FqEESqRYS5W5GFbNAGjGmGQJp4dmlUkU9rui5XC49nSTaVbgInCzqCbnjA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(2906002)(83380400001)(38100700002)(9686003)(26005)(122000001)(6506007)(53546011)(55016003)(7696005)(33656002)(186003)(71200400001)(6916009)(54906003)(316002)(8676002)(64756008)(66946007)(4326008)(66446008)(66476007)(66556008)(76116006)(52536014)(86362001)(41300700001)(5660300002)(8936002)(38070700005)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2652
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b41c670a-e71a-4af8-ab1c-08da89a7b2f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mr7Co67yXT45hiKz+WDisNl0V1R6KbStwe9z/RuJ3r9ArRboe6d5fDgQmT/KWgMZKzbg7rtVQUbolz7JdLrOD599+CAp1cxe1+YTl+nRhzA/TCNYLFczZKMAdeGE9yE/1bIIroNtM9zIvjw41MIRhEiLqYWDl0j+1ki4M1JbVM4aG9Pb6ogH2NU/OrMtwnoCR9OJaMoSaqHytb4V/ectmYezwGyqFy2JTgJ9y8owiqFYGLQv88vLoQ//uHIAcXl+gzZLksyR+Xg3/slmQg6vw4unBrPnHVqiAYNAAdk0vu3mgtz9aRAcViUhmtDSA0tE8yZizNDb9+Myuw9EWnUjMR4THMGeg2DWa5ijjCs9Rl12L1gknd7zlmos24TP1D3cdKT0T/pKKSk9ZblCB4Fd4R5jCdisPVaxcpcMTYKNOBRd0IoKbLIhgI4Wua8lj6WB6cbkwRBf9lzxqOkJYgT8MKRLmOHO10Om4JjkqtG9cC7yplpXx4H+EjiuJRT7fViW+51FuT4GKTsNTtTLE50uQBEVB9TOi2qcwE+dPzm+xNxEkZsc70sxf2MuMxJkGxHeksVbhw8vQzVePF2O4gY99X3moRnVk8i4jSlFqoBoSTP7w3f0z2zRkuVlQZEfQP5Of2n29l3Av3r2bZ9s9PM642UhHy1W2LjwtDnLx5NRz8qYgQuSfr3LQkyvZ54sr7SsoC95RzDAl/8oW1fqqFTu/WG/yvmHuCHz1O6vLV2CuFV/lT0iSv39+S9o88PibXbV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(8676002)(4326008)(316002)(54906003)(70206006)(70586007)(86362001)(6862004)(5660300002)(8936002)(478600001)(81166007)(52536014)(41300700001)(356005)(7696005)(6506007)(82310400005)(53546011)(9686003)(2906002)(82740400003)(26005)(36860700001)(40480700001)(47076005)(55016003)(336012)(83380400001)(186003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:17:54.2101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4682c0-8cdb-480f-501c-08da89a7bc94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1974

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDjmnIgyNeaXpSAyMDoxNA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjMgNC82XSB4ZW4veDg2OiB1c2UgYXJjaF9nZXRfcmFtX3JhbmdlIHRvIGdldA0KPiBpbmZv
cm1hdGlvbiBmcm9tIEU4MjAgbWFwDQo+IA0KPiBPbiAyMi4wOC4yMDIyIDA0OjU4LCBXZWkgQ2hl
biB3cm90ZToNCj4gPiBAQCAtOTYsMyArOTcsMjcgQEAgdW5zaWduZWQgaW50IF9faW5pdCBhcmNo
X2dldF9kbWFfYml0c2l6ZSh2b2lkKQ0KPiA+ICAgICAgICAgICAgICAgICAgIGZsc2wobm9kZV9z
dGFydF9wZm4obm9kZSkgKyBub2RlX3NwYW5uZWRfcGFnZXMobm9kZSkgLw0KPiA0IC0gMSkNCj4g
PiAgICAgICAgICAgICAgICAgICArIFBBR0VfU0hJRlQsIDMyKTsNCj4gPiAgfQ0KPiA+ICsNCj4g
PiArLyoNCj4gPiArICogVGhpcyBmdW5jdGlvbiBwcm92aWRlcyB0aGUgYWJpbGl0eSBmb3IgY2Fs
bGVyIHRvIGdldCBvbmUgUkFNIGVudHJ5DQo+ID4gKyAqIGZyb20gYXJjaGl0ZWN0dXJhbCBtZW1v
cnkgbWFwIGJ5IGluZGV4Lg0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgcmV0
dXJuIHplcm8gaWYgaXQgY2FuIHJldHVybiBhIHByb3BlciBSQU0gZW50cnkuDQo+ID4gKyAqIG90
aGVyd2lzZSBpdCB3aWxsIHJldHVybiAtRU5PRU5UIGZvciBvdXQgb2Ygc2NvcGUgaW5kZXgsIG9y
IHJldHVybg0KPiA+ICsgKiAtRUlOVkFMIGZvciBub24tUkFNIHR5cGUgbWVtb3J5IGVudHJ5Lg0K
PiA+ICsgKg0KPiA+ICsgKiBOb3RlOiB0aGUgcmFuZ2UgaXMgZXhjbHVzaXZlIGF0IHRoZSBlbmQs
IGUuZy4gW3N0YXJ0LCBlbmQpLg0KPiA+ICsgKi8NCj4gPiAraW50IF9faW5pdCBhcmNoX2dldF9y
YW1fcmFuZ2UodW5zaWduZWQgaW50IGlkeCwgcGFkZHJfdCAqc3RhcnQsIHBhZGRyX3QNCj4gKmVu
ZCkNCj4gDQo+IFNpbmNlIHRoZSBjb21tZW50IGlzIGludGVuZGVkIHRvIGFwcGx5IHRvIGFsbCBh
cmNoaXRlY3R1cmVzIHByb3ZpZGluZywNCj4gSSB0aGluayBpdCBzaG91bGQgZ28gd2l0aCB0aGUg
ZGVjbGFyYXRpb24gKG9uY2UpIHJhdGhlciB0aGFuIHRoZQ0KPiBkZWZpbml0aW9uIChhdCBsZWFz
dCBvbmUgaW5zdGFuY2UgcGVyIGFyY2gpLg0KPiANCg0KT2ssIEkgd2lsbCBtb3ZlIHRoZSBjb21t
ZW50IHRvIGhlYWRlciBmaWxlLg0KDQo+ID4gK3sNCj4gPiArICAgIGlmICggaWR4ID49IGU4MjAu
bnJfbWFwICkNCj4gPiArICAgICAgICByZXR1cm4gLUVOT0VOVDsNCj4gPiArDQo+ID4gKyAgICBp
ZiAoIGU4MjAubWFwW2lkeF0udHlwZSAhPSBFODIwX1JBTSApDQo+ID4gKyAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+IA0KPiBFSU5WQUwgaXMgc28gaGVhdmlseSAob3Zlcilsb2FkZWQgdGhhdCBJ
J20gaW5jbGluZWQgdG8gYXNrIHRvIHVzZSBlLmcuDQo+IC1FTk9EQVRBIGhlcmUuDQo+IA0KDQpP
ay4NCg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvc3JhdC5jDQo+ID4gQEAgLTQyOCwxOCArNDI4LDIyIEBAIGFjcGlfbnVtYV9tZW1vcnlfYWZm
aW5pdHlfaW5pdChjb25zdCBzdHJ1Y3QNCj4gYWNwaV9zcmF0X21lbV9hZmZpbml0eSAqbWEpDQo+
ID4gICAgIE1ha2Ugc3VyZSB0aGUgUFhNcyBjb3ZlciBhbGwgbWVtb3J5LiAqLw0KPiA+ICBzdGF0
aWMgaW50IF9faW5pdCBub2Rlc19jb3Zlcl9tZW1vcnkodm9pZCkNCj4gPiAgew0KPiA+IC0JaW50
IGk7DQo+ID4gKwl1bnNpZ25lZCBpbnQgaTsNCj4gPg0KPiA+IC0JZm9yIChpID0gMDsgaSA8IGU4
MjAubnJfbWFwOyBpKyspIHsNCj4gPiArCWZvciAoaSA9IDA7IDsgaSsrKSB7DQo+ID4gIAkJaW50
IGosIGZvdW5kOw0KPiA+ICAJCXBhZGRyX3Qgc3RhcnQsIGVuZDsNCj4gPg0KPiA+IC0JCWlmIChl
ODIwLm1hcFtpXS50eXBlICE9IEU4MjBfUkFNKSB7DQo+ID4gKwkJLyogVHJ5IHRvIGxvb3AgbWVt
b3J5IG1hcCBmcm9tIGluZGV4IDAgdG8gZW5kIHRvIGdldCBSQU0NCj4gcmFuZ2VzLiAqLw0KPiA+
ICsJCWZvdW5kID0gYXJjaF9nZXRfcmFtX3JhbmdlKGksICZzdGFydCwgJmVuZCk7DQo+ID4gKw0K
PiA+ICsJCS8qIEluZGV4IHJlbGF0ZSBlbnRyeSBpcyBub3QgUkFNLCBza2lwIGl0LiAqLw0KPiA+
ICsJCWlmIChmb3VuZCA9PSAtRUlOVkFMKQ0KPiA+ICAJCQljb250aW51ZTsNCj4gPiAtCQl9DQo+
ID4NCj4gPiAtCQlzdGFydCA9IGU4MjAubWFwW2ldLmFkZHI7DQo+ID4gLQkJZW5kID0gZTgyMC5t
YXBbaV0uYWRkciArIGU4MjAubWFwW2ldLnNpemU7DQo+ID4gKwkJLyogUmVhY2ggdGhlIGVuZCBv
ZiBhcmNoJ3MgbWVtb3J5IG1hcCAqLw0KPiA+ICsJCWlmIChmb3VuZCA9PSAtRU5PRU5UKQ0KPiA+
ICsJCQlicmVhazsNCj4gDQo+IFdoYXQgaWYgYW4gYXJjaCByZXR1cm5zIGEgM3JkIGVycm9yIGlu
ZGljYXRvcj8gVGhlIHdheSB5b3UndmUgd3JpdHRlbg0KPiBpdCBjb2RlIGJlbG93IHdvdWxkIGFz
c3VtZSBzdWNjZXNzIGFuZCB1c2UgdW5pbml0aWFsaXplZCBkYXRhLiBJJ2QNCj4gbGlrZSB0byBz
dWdnZXN0IHRvIG9ubHkgc3BlY2lhbC1jYXNlIC1FTk9FTlQgYW5kIHRyZWF0IGFsbCBvdGhlcg0K
DQpZZXMsIEkgaGFkbid0IHRha2VuIHRoZSAzcmQgZXJyb3IgY2FzZSBpbnRvIGFjY291bnQuIEkg
d2lsbCBmb2xsb3cgeW91cg0KQ29tbWVudCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gZXJyb3JzIHRo
ZSBzYW1lLiBCdXQgb2YgY291cnNlIHRoZSB2YXJpYWJsZSAocmUpdXNlZCBkb2Vzbid0IHJlYWxs
eQ0KPiBmaXQgdGhhdDoNCj4gDQo+IAkJLyogUmVhY2ggdGhlIGVuZCBvZiBhcmNoJ3MgbWVtb3J5
IG1hcCAqLw0KPiAJCWlmIChmb3VuZCA9PSAtRU5PRU5UKQ0KPiAJCQlicmVhazsNCj4gDQo+IAkJ
LyogSW5kZXggcmVsYXRlIGVudHJ5IGlzIG5vdCBSQU0sIHNraXAgaXQuICovDQo+IAkJaWYgKGZv
dW5kKQ0KPiAJCQljb250aW51ZTsNCj4gDQo+IGJlY2F1c2UgaGVyZSByZWFsbHkgeW91IG1lYW4g
Im5vdCBmb3VuZCIuIFNpbmNlIGluIGZhY3QgImZvdW5kIiB3b3VsZA0KPiB3YW50IHRvIGJlIG9m
ICJib29sIiB0eXBlIGluIHRoZSBmdW5jdGlvbiwgYW5kICJqIiB3b3VsZCB3YW50IHRvIGJlDQo+
ICJ1bnNpZ25lZCBpbnQiIGp1c3QgbGlrZSAiaSIgaXMsIEkgcmVjb21tZW5kIGludHJvZHVjaW5n
IGEgbmV3IGxvY2FsDQo+IHZhcmlhYmxlLCBlLmcuICJlcnIiLg0KPiANCg0KT2suDQoNCkNoZWVy
cywNCldlaSBDaGVuDQoNCj4gSmFuDQo+IA0KPiA+ICAJCWRvIHsNCj4gPiAgCQkJZm91bmQgPSAw
Ow0K

