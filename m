Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60970F095
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538858.839179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jnM-0001rf-A5; Wed, 24 May 2023 08:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538858.839179; Wed, 24 May 2023 08:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jnM-0001pj-5x; Wed, 24 May 2023 08:24:32 +0000
Received: by outflank-mailman (input) for mailman id 538858;
 Wed, 24 May 2023 08:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1jnK-0001pd-Mb
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:24:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6629ed53-fa0c-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:24:28 +0200 (CEST)
Received: from AS8PR04CA0142.eurprd04.prod.outlook.com (2603:10a6:20b:127::27)
 by DBAPR08MB5622.eurprd08.prod.outlook.com (2603:10a6:10:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 08:23:59 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::16) by AS8PR04CA0142.outlook.office365.com
 (2603:10a6:20b:127::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 08:23:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 08:23:58 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Wed, 24 May 2023 08:23:58 +0000
Received: from 6924a593a8e7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6019D4E4-6E39-4DCA-983B-553A0D66A8D7.1; 
 Wed, 24 May 2023 08:23:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6924a593a8e7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 08:23:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB8PR08MB5369.eurprd08.prod.outlook.com (2603:10a6:10:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 08:23:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 08:23:48 +0000
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
X-Inumbo-ID: 6629ed53-fa0c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+ZtTVyHFUj2UKsTLlBul5a5nsSxQFVSTk7EzWTOPLQ=;
 b=mYHa1M0YdwOyi5UKuhiqN9nNnkLOi6NXHa67sDmFpO3MuUSY8O3UR4IYLCcMK07JtXZhMXlXBVcf2ifesY0owH+emGq247Bkh1nze8SriLDKTcZk5Kk/QKR+ebn78vaxAMd1cLTBThdMfejd2evvJDGpiwPwaeYJxCjPPDA4HJg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7dad52d7735b7b93
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksPyQdE5CnFW9Ki7iRX8811htZMepFkVvfRUTtHUzzOKDA/kY5XHKVMqL5jNBtodSy9XkDEuELPnBS+nDFDarQAz+2dQjoobk0AItJtX+lc2iTSrOUbNfBIl1MUqy/KbqaG37Rpkbe2tsi0yhFa8b+w0S4XXryKFEBnh4apQLycQlQb/7RQRTaNGXRBL20f/XL1ifwOKIm7naJGiCcvGSA8ijlcU8Tl+eeGSQcNi0Hm0e8F2dzEREg+k2S1Rxfmg8U5GUST+lL6rRv8HbpcEQTFuq9ueYFlYeKID9xtm79oR7akRQ2FKtiWjXvhreH8ensaK+17VlVSZusWG+hBZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+ZtTVyHFUj2UKsTLlBul5a5nsSxQFVSTk7EzWTOPLQ=;
 b=EXgM7Rc0hz5JcNQ19TBozxbR5PT5MOQXatDCYvtb0mqm9L7ydswt9cbZOGKTFbsvUbTrXCrHOjSHbzXGw7l2mdtp5lK8m3kBpBUJS4XXJ9HW5pAQAMVQz+pIKKnc6tWGb627s7b9OfRkmPhSnLwdKtygkFGPBKses2LabZkJr6Tel7/UsoQIG1Pty2GbKAQCFuhtlYcL/zCWCUvpQ1EIE6eZM8/AhnI0a7d4qTNeiERPPLyrdmnwDWEPtKT3+V3IeixiHEfnIvYkhIBO5ODAQ84MTNLoAPWCpKGliWAXQnr3RHHvBcSTlUF6YMNfVixXCW9vn5E04oxHJGRElMYxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+ZtTVyHFUj2UKsTLlBul5a5nsSxQFVSTk7EzWTOPLQ=;
 b=mYHa1M0YdwOyi5UKuhiqN9nNnkLOi6NXHa67sDmFpO3MuUSY8O3UR4IYLCcMK07JtXZhMXlXBVcf2ifesY0owH+emGq247Bkh1nze8SriLDKTcZk5Kk/QKR+ebn78vaxAMd1cLTBThdMfejd2evvJDGpiwPwaeYJxCjPPDA4HJg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: Re: [XEN PATCH 09/15] build: hide commands run for kconfig
Thread-Topic: [XEN PATCH 09/15] build: hide commands run for kconfig
Thread-Index: AQHZjZUZfllK9TyAd06fAPp67+uiZK9pFuiA
Date: Wed, 24 May 2023 08:23:48 +0000
Message-ID: <BF9D6C54-1DA7-4B10-A447-6F53783EA078@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-10-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-10-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB8PR08MB5369:EE_|AM7EUR03FT023:EE_|DBAPR08MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: a79e65e7-903a-4c56-015f-08db5c303909
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F8rbyjvrvthx6FF/tQTqCEYDuLybzaAjHOk91q1ex6VhkfNfvrKXw5pxrcSSM050ljjUJn4HV5SxIniPF0lg52g7IU6KloAlFSoi+Rg4aPApBW3HLVnO0dSyIVtMty5guX78emJjd+67ksprfqPjnIIkBFTyn/UL/oi9jp5fYK796PpPaI0TdYFLEDeIRVbG8x3ftTIZVv9sU8qEgTZPT8HNi1525Me1FIcxNtHa76/z5Re5Uobt72kDjRFB1xZMj6R+TO393atgVgApgcDYFCNM/48QpfpVqzBxIFs5nnDYkGk/Dh6EEkQLmFIte3fogFMUINavpNw5wYalYyWXZ+srpsaJ9SJaWH8ASHY+3X+vN2EwTixYXJ8hdxiKwD/GsetRWHhZQ8BOmCCN8pERohrV8i8edXI8hhhcq6pMdJJM/Vv8w2ZFB+V3b5RNYCABMxvjc+5UpP1YgPjeYfUS+9cFyXB7Gvh0RXz5RtQ8ZvaKWA5aOx5NstGCWzBT6aCWZ5u7qHbyTBr0aHcL7ZoOMv69L+V/iVDdNXJvOTeonZ3pydZ4z+I2yT1qfLSj4pHGwNMt/pj6NOftr8f54yDVKFUWq4BZuhT2pZquUPK5TeqCKuQ1YEZ5P1JAnTjU2DhivIoxtxlY1LxSXUqLaAOFaw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(71200400001)(478600001)(6486002)(33656002)(2616005)(38070700005)(86362001)(38100700002)(122000001)(6506007)(6512007)(26005)(36756003)(53546011)(186003)(41300700001)(8676002)(8936002)(316002)(5660300002)(2906002)(4744005)(54906003)(66556008)(66946007)(66476007)(66446008)(91956017)(76116006)(6916009)(4326008)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4EED588F4DA6AC44A5094A4F8C0A8CFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5369
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc798970-e7c5-479d-4402-08db5c3032de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y9bIWh7eei9IZjj7wRA8/BYLmPihtyCKUeLkXanM+dIwNE0SkkKUjQgrkju3XxCrI0amPGGUbpkYGgb07UwyJZMnLTBxdsjL4v3L17J3semVFXEU0uIyepixYXGi/tzkCjSS/31H0Ia/kyx9WyLrcPYNxgdzkAR2YjSbFA+foJDtPXJTZ+HF0vyDq7l4am2SEmbcUUmm5rnqUl6I8U9sVBxGxU8ri8hkN/Ok8Ox4q7AkU26mImhhJAYs62y4SF6DGZNK5YqXC9mq0GC3f52OHxl5MYxqNDuCQqHRnVetoiv2Oe8uC7xEi7o3Ez6BxENcCdyWm+V5AYw+u9N1zWDg2NGdRYOu4XlFiKCmWBgtTrBAb4vXaK+l1GZVW1u8tYIF+XnBqx1MIzAhTiwFd+cN1UwIE2SCRS5PJ/74m3Xb3Gy10s0yWhM4pYmxB9eaoGs8LYyiiyxvwxvxQkJsZf9RdGtazKwOa6i+YtKayGVkQrAa2i0z15Vdb/gs7Ds1QMAMCGQrzRsgKRACkLWeZZR5bMYqMX3NbbbFBpRiIU6Knl7SwZ9NCAzchIu+rpN5gHTYK5UKbiclNhrKM6gTRCt1QvzzfeudwwiFFHeBbXp2O1EQpY1CaCn8nl5YANwsYicAkT9aEaqkpzx3GMxukG2I6HPKmN//5mZ9xySJ6ZaV98rebMQzyngvQ4x9JL1kXQYVB5ZV+FDy+co6+izfkCpWRgNHYY11ojkIQq1FUz7vwkdq3bvipUMlVMMrRMIKRbW2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(8676002)(8936002)(6862004)(41300700001)(33656002)(5660300002)(82740400003)(53546011)(26005)(6512007)(6506007)(186003)(107886003)(40480700001)(82310400005)(86362001)(54906003)(478600001)(6486002)(4326008)(70586007)(70206006)(316002)(40460700003)(356005)(81166007)(36756003)(4744005)(2906002)(36860700001)(336012)(47076005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:23:58.7509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a79e65e7-903a-4c56-015f-08db5c303909
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5622



> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> but still show a log entry for syncconfig. We have to use kecho
> instead of $(cmd,) to avoid issue with prompt from kconfig.
>=20
> linux commits for reference:
>    23cd88c91343 ("kbuild: hide commands to run Kconfig, and show short lo=
g for syncconfig")
>    d952cfaf0cff ("kbuild: do not suppress Kconfig prompts for silent buil=
d")
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>




