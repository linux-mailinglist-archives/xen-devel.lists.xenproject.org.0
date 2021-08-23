Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1743F4DC0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 17:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170485.311285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mICBb-0001Fb-3N; Mon, 23 Aug 2021 15:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170485.311285; Mon, 23 Aug 2021 15:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mICBb-0001CX-0C; Mon, 23 Aug 2021 15:48:31 +0000
Received: by outflank-mailman (input) for mailman id 170485;
 Mon, 23 Aug 2021 15:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xpK=NO=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mICBZ-0001CR-Q5
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 15:48:29 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.86]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ae0182d-c48a-4f12-99b9-0730c996c13b;
 Mon, 23 Aug 2021 15:48:27 +0000 (UTC)
Received: from AM6P194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::33)
 by VI1PR08MB4189.eurprd08.prod.outlook.com (2603:10a6:803:e7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 15:48:24 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::4e) by AM6P194CA0020.outlook.office365.com
 (2603:10a6:209:90::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 15:48:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 15:48:24 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Mon, 23 Aug 2021 15:48:24 +0000
Received: from ea07b43f768a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2FDFC96D-1A53-4DE1-90E4-8D2ECE484B3B.1; 
 Mon, 23 Aug 2021 15:48:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea07b43f768a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Aug 2021 15:48:17 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6560.eurprd08.prod.outlook.com (2603:10a6:102:12d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Mon, 23 Aug
 2021 15:48:14 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4394.023; Mon, 23 Aug 2021
 15:48:14 +0000
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
X-Inumbo-ID: 4ae0182d-c48a-4f12-99b9-0730c996c13b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1HbpxITTjsoyKhikva9BLbtIa2JQIM7YNisgW2fNmw=;
 b=XfTdxsJQCeNC5Rlk9Q2vzdY2k7y6L6d4R+wdEYNz3uvYxjR3tKZeSVKRNI2VqdHr01U5VB/OLYF7EI7bkUpv9I9wQ1lnEK6lt3tujXbstTRT8+HhxF2Ta3mN+yFuyZQ8NqmnWYrkmKDM/MmaMQqAMZX7Cs9Iq5oNoj+Ad9bd6Ic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea0c63d358fe2b98
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7zlgGSldAbSYfD8JVVLFIFJDjOd1hNEi1OLe2j+aNhtq8/z8C3zqcAADrDVxn5pbOKMlLMjClAcTXKIHIeaxnZrdPl4Q6zp5T7h5sfUqs578QJ1ZuXWTt60pFkRonty9UDAtyAmcB4Plq9eqD2A4Kv15/rGrfo3POvEBK5+eOltLuzej8SQsMRno7FuPUPh6dDrtunRUS57xrdPw2KS4gPI/uPo1w8OMJI8ESvSIJhnj4617hpgMzdmvfqKTjLKbM67+nIQhN1mPLykXSCojStgP9Y39vmhA/DlX+iNhEPhkpT0jcPC+hjWCPWgzq/GFBuwVql7p6C+oCZjSJe9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1HbpxITTjsoyKhikva9BLbtIa2JQIM7YNisgW2fNmw=;
 b=na75W2ZRJxkkZlylICrNKhPsfT/zxVSTS5vLsZ3XqRDEXfdiOaQjhKmreqCsqARpQUdjlwvWGPoPH+INceE4V2+twzsNeKNb8m0wU3Ia8irCQqszuCmsvL3Y0MsVpXykLOja8rFpGBUjAYNCReWGNPHSWzwvw48khVZHas+fSWm2xldO1pF5t5TMOyJrNrbBJXSkkylQEnnXohpfxwEEr/w4n6MFRfjcjSiZNO2AxFI/486fxFja0DZit4d5lGh9+xcw2k0Fp/ydIJVv/jK+ydtPLGwRA+Qnu7fwNTIVrClDA5UAK+9Tx5VtNiBhlZQ7JKVxQ7Vos0sqJAzymdeFEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1HbpxITTjsoyKhikva9BLbtIa2JQIM7YNisgW2fNmw=;
 b=XfTdxsJQCeNC5Rlk9Q2vzdY2k7y6L6d4R+wdEYNz3uvYxjR3tKZeSVKRNI2VqdHr01U5VB/OLYF7EI7bkUpv9I9wQ1lnEK6lt3tujXbstTRT8+HhxF2Ta3mN+yFuyZQ8NqmnWYrkmKDM/MmaMQqAMZX7Cs9Iq5oNoj+Ad9bd6Ic=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/7] xen/arm: Sanitize cpuinfo
Thread-Topic: [PATCH v2 0/7] xen/arm: Sanitize cpuinfo
Thread-Index: AQHXmApE4Kv6+ShsZkCCCMo7AkZIk6uA/4aAgAA89IA=
Date: Mon, 23 Aug 2021 15:48:14 +0000
Message-ID: <07661F12-BA25-4854-92A3-86172AC0ACF6@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
 <30ad3be3-b8b2-b83f-e061-5a428175e3f4@xen.org>
In-Reply-To: <30ad3be3-b8b2-b83f-e061-5a428175e3f4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5b9932ad-b7d0-41f6-ca73-08d9664d711e
x-ms-traffictypediagnostic: PAXPR08MB6560:|VI1PR08MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4189260DD6158E992EF20B6F9DC49@VI1PR08MB4189.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mKvAzw8TlqCdlGTxuj3RvPO3w1ZRq2oCyM1fw2asqaeaDh5k8yexRVaGK6F46vphacf4pH5ysGI1Yif1U0TDnV3gwzMCEgEAeBIIla4UE7gmZsXZRwyu/MZYa2WBGaK9KVfpdw0U04feNgvMw5ISPa5FlZoymxiQFwZ+yCq04acdNzAnZtrJbPeeVuv+NDCUhPTLPPC7ZDtbE4uXPUOOLtF/JRaTOrX5TFU+SivPaUVUYlkvMvSga8zk+v58v/RdlMTd995qn6xfkq23pSuFleAboq6qTQPgRTjzb/oPqkh8h7lNXJwB9l2dvthPxA1IknCWhbairq5T9ws9bxhE6Dn9s6mx5qd+bhUa8HJfQGv5IC3gNhYDzUChYS7qt4eT8O7+Ial2QH2NrSyDvV3/mpIACTbJQ3Pm/VqAhAGXDyq8TPNnBrIAZVjzT+ILjya6cr3GExX9jnlkr5MqrwM12Y9+HsPlHa6hkT34zliVA3+IE8GilKUZvtYHTH1NWV2synC4CFIKOd4xNGTRf5Uo2VRsb8EmjYgZGiux21PZO2umFtxOxmuMPLMySEJ02aXjJdO+O+uV5sZIRIZr4EHEuTB5gxIw4iO06ib7Pa7a9QEcn8Kdq/jraQbPhTKRJv+1R8Ow5Hj/tGEyzchexbi4v6JSFHlP9ES6FZhisskP/t+nWiaKq6ElxhtSzRzCZGtuoOjUwc5SZoPbm6pOBLfFTE5/wuzwZFHHJ7DuOYzHIMFK/asnAAWFoIG68KTAVpdpLR7EAMwW6kt5+Tqb9lXe+F2NMGOphT8Lts7shTz1aUqJVuBCfYA9l4TJlwbqMDBw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(6916009)(66446008)(36756003)(6512007)(66556008)(122000001)(2616005)(38100700002)(26005)(478600001)(66946007)(53546011)(66476007)(38070700005)(186003)(316002)(64756008)(4326008)(76116006)(6486002)(8936002)(6506007)(71200400001)(54906003)(2906002)(5660300002)(966005)(8676002)(91956017)(86362001)(33656002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LApokFcxTrBp4AmzHBHujqid6M5AIW+CC42w2QmeAV8m65xF4udoNR1BC9zn?=
 =?us-ascii?Q?X5SbOSVCqsgrrb8r8/3EdQMykl8KFtY+vAfDFPPVl/JYm/GJFypYU9/62kcT?=
 =?us-ascii?Q?Z+5N58jSf76EHJWtZY9+kSepRs2LMo6NZgcHPJ1cKrqKHZRFcsEbJamxAD7X?=
 =?us-ascii?Q?m3Z4I3rNqfEwCVnsTmmfRxTR+k4aeV1OvNtH77fMDD2jltVyV8/GfAjj/HzD?=
 =?us-ascii?Q?6/VP0Yzfzp6ipvXckg1QLH5feW/Ng4iJ+6Azs8ffRkCfOztZHvMUrAvxGB27?=
 =?us-ascii?Q?RPMHyyCi/80sGQqkDdHWIC9n+2Y4vFPgG0aaiod+uswbmPqv0l9+DmFw8SPU?=
 =?us-ascii?Q?TOnX9S2TCBGMzjeS/fvhto+IM7OUEkv/39wDdwVIMN7leY2cSiBgji7Ahx+R?=
 =?us-ascii?Q?WWP+I5rOWgobLYw7OUEyd+hwxPkzUbePso15nK2x6GOMnqWWEMU6kn9JB3hM?=
 =?us-ascii?Q?D1TR1rg+IPZw+Sz7tjqPK2tt9+H1+otPw/J3S6oErO6P+1ztkF7oY3vGIjSz?=
 =?us-ascii?Q?R4CqMq6ZhMuq5zxkcYVEfoPyer3myPeTMDMl2gIFekX8d0fNOHUBojdpSyzR?=
 =?us-ascii?Q?mPRKse1uKiivu6RM8jVH43aPzwC8jDzkFIumAWRmi496Q+t2b8VXnecWcS4l?=
 =?us-ascii?Q?PzKzPj7R3ronuhmoye5peo+wejH9MiExbOZE7THcm9xnCfwEW+1VraozB0RT?=
 =?us-ascii?Q?anjO6a5Jo0m3Emr6pZ8ittzsIvpHoNjQ1ha1gpGig5v90G9F+jdxkJ2C+R/G?=
 =?us-ascii?Q?rPWtXueYIESxKwEE+6aSHpN8viw+ErLgm/ImZ9Lsc2/a3ytRgHKaiqqEdlIM?=
 =?us-ascii?Q?CFzvjxl+uBlvSHsA7xUSVFpo+XR1UxdcnkwBK/NzLo1v1GG8M6EnZ1Tqmfgx?=
 =?us-ascii?Q?Tt0sb/DssugmNCc7GSltg/BfcuDdJK79/LKNk7AbXKbUATx03dC9STEX/YyJ?=
 =?us-ascii?Q?2wajHq8WwJifFuBs75BuuXG1IOhvCbPPMwCtcGVCUaJd9O64R5HSHLzxCKjn?=
 =?us-ascii?Q?++obVm1kizqmt4pXk+D84QDZzHOyaFb/bdv99m9RODpQcBYCnrpv2LDE1s+W?=
 =?us-ascii?Q?1/6qzRxSBsEKx+bCsjFb4jpNz0EfuTnQvdoQEiO4wgQRYnvtyNjpAfSwJqrn?=
 =?us-ascii?Q?8tw+hVJaYCCmHso6/cE89tCAiHRGabJh64K7xwtoIvYkb05M8sWGvUL6qKIs?=
 =?us-ascii?Q?MD1RC8cNI3VlGepr0y0H+ORJ6SN00kr7G0dGSSLwyp+zU6NuPLaTfnhmg3b1?=
 =?us-ascii?Q?OWckSZau89pkOQ87IUUpwSUS66wy9GTtrCLFaQL4c/r+9cu19PYO1RHYlEmK?=
 =?us-ascii?Q?jfuRjmZakXNSz9lhMPJvodR6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F21EF037178D648B9EA7DD5E44F0260@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6560
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9075bb7-d384-4901-c448-08d9664d6b12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TDERKFcHZlkNLLJ/HxiODHyWy6HZCFOPAW0AvQ8XOqQ8wIgTL2jkgCttczZgxLsHDq9g6LvnxDEv5HXDxBkeFVKhP0jLcQoLaVS1Pq9ZMh178US0WKHqSjdc4D2uAzHZmo50owA9IVD9gLC40QHCHpcv1SOjwA2NtAD7e+jUUvcFEV4D1tGis92usSZjnOtzmWZkbIZErGL0arhkm+DBXUF/pj/spwZ+SSXOtXfg2ToiqGNt4BIS8ncqumL6B/NErwUId6YaLuJHjL6PY9lR8l/eIP+8qrgYx9XkoguxKVI7nyT3xC0tvgpkyL/NOtXwsfXAYR4JtkiQU6/2xrigAT1Qm6203ii7bVs3FVG50klYsoT9PPBCVjFhngSIFHHkrQyBbOfh6NPINt2hXhh/VgOvU4cQsYvfdsUoDDbfG0jhZjUC71YUGqOdA/tVKETObtNn/+FM7EckTiC5YI4Jn8TEoXPNlBRErvQVh3lMb1YqOexr6ocPkw6n+61nTlfdoIRXD03nXbYAWmwF6j5JmXc8QHJxJMyDQmvhW35pdwzsrqjNZocmwcrAsb75Yt57AXka2cB9K+Drj7jLRv8hXFedqM2GUdZVPAsF2BCFh7N4CalLbieH6EFJ7677L6qKQ7dz2ZftZ5ib8pvH1DyIWL6eq2tZcvsx3OSphBTFw2hK37kbJLa3StEzRZEcXwNxSgAkL7UmTdSNxFDxPMi3hgAdic2b6jgkxxrylB9o7y4Sr1yYb5+X0XtlIZrHgmqwBLB1HKX1BJCU10z9kzctOonEz0gLEIF6br7CM/6KU/s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(36840700001)(46966006)(186003)(70206006)(70586007)(82740400003)(4326008)(316002)(8676002)(81166007)(36860700001)(5660300002)(6512007)(54906003)(356005)(26005)(2616005)(6862004)(107886003)(6486002)(966005)(47076005)(53546011)(36756003)(6506007)(33656002)(86362001)(478600001)(82310400003)(336012)(8936002)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 15:48:24.4924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9932ad-b7d0-41f6-ca73-08d9664d711e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4189

Hi Julien,

[Keep only arm maintainers in the CC list]

> On 23 Aug 2021, at 13:10, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 23/08/2021 11:32, Bertrand Marquis wrote:
>> On arm architecture we might have heterogeneous platforms with different
>> types of cores. As a guest can potentialy run on any of those cores we
>> have to present them cpu features which are compatible with all cores
>> and discard the features which are only available on some cores.
>=20
> Sanitizing the CPU info is important for Xen so it can correctly size the=
 P2M, flush the cache... However, I don't think this is going to be suffici=
ent to be able to move a vCPU between different type of pCPU.
>=20
> The main hurdle I can see so far is errata handling. Not all the errata c=
an be fully handled in Xen so some of them are left to the guest to mitigat=
e.

I agree this is something to work on and a problem with the current serie.

>=20
> The errata are usually detected based on the MIDR while the OS is booting=
. IOW, a guest will not be able to know that it needs to handle an errata f=
or pCPU B if it only runs on pCPU A.

Ack.

>=20
> I don't know yet how this can be solved, but errata are not that uncommon=
 on Arm. So until this addressed, we will still need to make sure that vCPU=
s are not migrated between pCPUs with at least a different MIDR.
>=20
> This prevention can be either done manually by pinning the vCPUs or imple=
menting the proposal that Dario sent a few years ago (see [1]).

My current proposal would be the following:
- add a command line option to allow to use all cores on a heterogeneous pl=
atform (different MIDR)
- taint Xen on this case
- keep the feature sanitize as it is as on this case it will create a safer=
 setup (apart from the errata potential problem)
- keep current behaviour if command line option is not passed

Having a solution to enable all cores (even if it is unsafe) could still be=
 a good improvement for development on big.LITTLE
platforms or for people knowing how to properly configure the system to pre=
vent the problems by using properly cpupools so
I still think this serie with the proposed changes is still making a lot of=
 sense.

I will start looking at a long term solution, maybe automatically create a =
cpupools on boot or investigate on the design you provided.

Please give me your view on this.

Kind regards
Bertrand

>=20
> Cheers,
>=20
> [1] https://lists.xenproject.org/archives/html/xen-devel/2016-12/msg00826=
.html
>=20
> --=20
> Julien Grall


