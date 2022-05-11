Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FAE523531
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326936.549608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1non92-0001i7-DR; Wed, 11 May 2022 14:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326936.549608; Wed, 11 May 2022 14:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1non92-0001fU-9w; Wed, 11 May 2022 14:16:52 +0000
Received: by outflank-mailman (input) for mailman id 326936;
 Wed, 11 May 2022 14:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1non91-0001fG-6k
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:16:51 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe06::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5a206e-d134-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 16:16:49 +0200 (CEST)
Received: from AS8PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:20b:310::34)
 by AM4PR0802MB2225.eurprd08.prod.outlook.com (2603:10a6:200:61::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 14:16:46 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::89) by AS8PR04CA0029.outlook.office365.com
 (2603:10a6:20b:310::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Wed, 11 May 2022 14:16:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 14:16:46 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Wed, 11 May 2022 14:16:46 +0000
Received: from faeb3db08815.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE86418C-AB1B-4DAE-947D-4F1732C4237D.1; 
 Wed, 11 May 2022 14:16:39 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id faeb3db08815.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 14:16:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR2PR08MB4730.eurprd08.prod.outlook.com (2603:10a6:101:19::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 14:16:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:16:36 +0000
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
X-Inumbo-ID: ff5a206e-d134-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T8n/oM4xfKJCQ2vaF62Y9UKRCP5z2VP9hqwPpuG6tv7PRJwVEuXf5xOshz+dkOSQPTcuwjtLCpxxt+6CsWSTg1L641scsrBOWm7BOC3legXg8zHUXYY6h+tzefqeSvaVh+wr8gs3JtOvC5nLnkfJdcWKQG7NdffprRfm6ePBPUGz7g7cgv2/XLbpyq/bjVPT3EdL2x+hJdlDX8wDuLKlxPv9igAQ7h5X06YJ3105hJCqRn+S7coUlby6edB2On4hYylQWXs+eQNj4S6Tx6/TpUkEE9IcKcPf0+mmy1qpt2GCpNsNBsUzgHxHo0rNKm28PJaD/+YeouAddlkot9SYTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Txrs/sgZUAQdW+NVVTKGqX4PfNujslWU935SxZMzkXk=;
 b=aenlN/3fbgzEMoFYCSUVgVlMbp+VfjVSkjskSgBUeoPAed3uMMAS0EcSX6MhOQxZPAYWamlRcmLRLEXj0FEcWCVM7mBXcLW9LGDpcTdFajrcOoUOQZW6uG+Mf1FMqfWtPJki92tLc1BeuGEGFvlB/D8zEuyFVaurhefgrhKSebDskaYEUyxxO2XmRIT6QJw+4rg8tpfhuHfGSG+oUE1qnPCdCB+GHh1DkcbCQt3YPBlAh76PxlHoBEDHnT9kfqfkR+zG+bfMR0D4kLFI5N+iradQAw+HCYnmpMaA0GqolOaZjcZ2C0gryk2Mq873KbpTWBJE5DLzM7OjMu98CMoDwQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Txrs/sgZUAQdW+NVVTKGqX4PfNujslWU935SxZMzkXk=;
 b=c93WPjrGLcKvQZNXKoOcBbfOyiGPEPdX3HFTBwoKftqMXh6Q7pnS+JhhIE4uMzlIJboHn1kJTzxXeECkL6lL2OPa888exAKv+gcR1fvnbgap3DAaPuGMEJ3kHS91ciFqozzvp2mcxio9bymlslVHGfj47Qk49HqEELQQhfqeHag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15360ac84834ea70
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBCzh6AvmYjD33aRA68sl92McKlu1ZVjtsLMryayDN2w1a5gpJXeW4fZQ0zdcsTeYfHrXrAvPzbwR8Py8ZGbKcir5RGwNeyAMBwpGFz1HY8LeDltP/C0FeycTd5SsiyKPw1MCtaEw/M+aUHTS3QtU3qehU9Nkl12FUI3uHCpCtOXtwe993iXOYp3OsBp1a+VSvMqlJ3cKjNLRfDceTWhEf6yiBOHtSOvgrQHjzw/LOZqxRuETvdLQgU4bTN8vZrsgZiKuOOqZMvjxz5k0R2mSlTxXG01yjou5vmMxyLo8IIp9QTn/OQYhA5+eMjswDIdDIJh2emG2JNUqzRF/uxBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Txrs/sgZUAQdW+NVVTKGqX4PfNujslWU935SxZMzkXk=;
 b=Q7yFRuMP+1+VDUUK4ktILVi3+joGiWUXvthgNDApOZR0KmKi46DSK4jEzwgXlJAkpwPiK6xZ8ev5icHMwkJ36FWuKBj7coRxLMqgdqVwTFQzYbNU8aidIM7VvDFFzcjCOgjkSbJ0u7wzgjv/sw/PcKcwH9W4TL8S54Uc3c4dNd0zg2k9y20bZYVtab0eWs2gPluktWf2UHCIlz7QolnZjpPmpAJapQwaJg1Wi/R+DH2q/f9PptLZWEgWHCGVyV8rsWVgFtzjzZ3XTTe2RfUeSbVvlBN/LA95S1sNboQEZV/2h1Wcgswc+FcQ/Z3zxwcWRe45arv33iwXA9mC5tNbVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Txrs/sgZUAQdW+NVVTKGqX4PfNujslWU935SxZMzkXk=;
 b=c93WPjrGLcKvQZNXKoOcBbfOyiGPEPdX3HFTBwoKftqMXh6Q7pnS+JhhIE4uMzlIJboHn1kJTzxXeECkL6lL2OPa888exAKv+gcR1fvnbgap3DAaPuGMEJ3kHS91ciFqozzvp2mcxio9bymlslVHGfj47Qk49HqEELQQhfqeHag=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <amc96@srcf.net>, Lin Liu
	<lin.liu@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Topic: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Index:
 AQHYZFb+rXOikPJI0E2wxRXQiKvDPK0X7v0AgAAFDwCAAAI1AIAABM2AgAADuACAAQJtAIAAuZCA
Date: Wed, 11 May 2022 14:16:36 +0000
Message-ID: <773ED71F-3A5A-4682-82EB-8AB881D3D7FE@arm.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
 <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
 <e7fcd02f-5fef-13e5-9ae0-763913aadd0c@srcf.net>
 <2f5b0e01-2214-6150-bef2-e4f92cebd6ef@xen.org>
 <alpine.DEB.2.22.394.2205102012210.43560@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2205102012210.43560@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9577166b-0f84-4864-ce85-08da3358e1c0
x-ms-traffictypediagnostic:
	PR2PR08MB4730:EE_|AM5EUR03FT040:EE_|AM4PR0802MB2225:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB22255437AA3473F69C4420EB9DC89@AM4PR0802MB2225.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mywj+mfho+puBsqVj5wS3DFsjI1j+t/oDvvFm8Y2AtvPmTwtMHvEje3TtBn5/cxJXPNgIW8dfmGII0E2EDugcEVh71x8a17cr3mkBZCeOA6+q/RljhwLs9BitapMyRerP255oQon656hAS6+Fdj3JCIZ+GCuy/ztWKSq6WDFF7zwYwkc6r8mSKLmZCfsx1n3WZBF1AfcfQsUKxruIpHOWgk7S8F5VGRFEYDm2QTirBShnRo42+kqUQsnN7mcJr+QDGP7NlcHhw0/Fgxfhtm6ZZsjbboYJuH5wdoDBr2tPygRODHpIE8NI9DG352L9voZDC61zDzEpAZz831Zk91Ypf+Ap2iwh5SU0QdY6mkVJedlyXrC6ZoX0LbQdZBIzQrVtWyUOb0je7Z9KJAiWheVjvkhj80aEksLEkZcB+jra+R1tPTwm6aoexS6IIgiqkUqRWUuywzrYfVB+0v5JBN5AfJne0Z967mAAGkpmErXKV5P51p4Vfl0xUP823+TSx3xlqi/NPFOJhcKzaSjTX9cokMNFajXvWT1YU6KCYh61+3pA0epvkazZfvJAgY3R1L/DWDNpcHgVatz1BSkQ3Q/GFKrrloQyUBu9Y74CyTYxLk/6/Fx3L/k6O4NsqiYZCxvKZjZSPzh1TAeIMzrHtep3SNXbk8ePOt0+tZNIPL/ua3b3piXb4+ZV/20APNPifO4+4i1VgNVk59MnGDZwUgJs4DHynUlA/ZlqSHLqHFHnsP8SXJAjD+50/wNZKlEYVh+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2906002)(38070700005)(38100700002)(122000001)(26005)(6512007)(508600001)(36756003)(5660300002)(53546011)(6486002)(86362001)(54906003)(6916009)(6506007)(83380400001)(316002)(71200400001)(91956017)(76116006)(66446008)(64756008)(66556008)(8676002)(66946007)(4326008)(66476007)(2616005)(33656002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7129BE7EA6E8E244AA2B77382538D35C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4730
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5eef53ab-5d53-4004-1679-08da3358db9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ys4MRYWYUtJVKW7oTDJL9jQcR5SPtdq7emNbuNdJGLMd3GG2t8/+tGcU2+0UL+7y0Qx6R5FKlzeBT+e2Rkq/OY07p0WGw4YW5qGYQGiUPCtF8EfoKrPsq0QUJzC0evzIvU17ZYNGRzG8oNuW10mxZHI4BVrnPXO5tZYQJdvioOqciV0/CCfpIclmfkSFnGk9zqT9QhUPyZNnAmQGByl9BMSGEKtSknRo1vLyhUAnoHdvkfNdqaoz/CpyYvPtGz2aSLB0hYtT5ef9BFs9PeZohF3ukLfvZY74eHkKUSrjK+fZnVKHG0T7AhKDIWdY7GrGKmNGNPaGlafaBGUhJjeM8+HyWh4uoMGBM2fDhHD6aG+kOeSvFrMpAybRz+VSDWGdNtusagnHc60vAt5yaE6PfmylaGxZMaElgzlMeoP6iWlecpMBAUVYYA7WHHericWvvbpgYy8u2GeVSoQcPgo4oISbvWoft2D2EleUIAs8K8QGI90hOifFUo6Oc4RA34OfmpHMXJWp5nFGv6o8g8vQ8jvv8RuOhiuhcxzbzPSuCXJg24WZzU5V83RUt5QFqP8hhosCP+FzYAVxg4JdH04uqEh7OKvzUeS+8YMaWBUz6vqZvlqucAxm3TfADUfNxRkhZmhic0T7o6COihevkuGRHnQVODkFTxtiaK3hz+tgjdvfuhBvtnJKJiGiDH9BU+GR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(336012)(6512007)(508600001)(36860700001)(26005)(6486002)(47076005)(40460700003)(6506007)(86362001)(186003)(2906002)(5660300002)(2616005)(83380400001)(356005)(36756003)(53546011)(81166007)(82310400005)(8676002)(6862004)(4326008)(54906003)(70206006)(70586007)(8936002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:16:46.3213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9577166b-0f84-4864-ce85-08da3358e1c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2225

SGksDQoNCj4gT24gMTEgTWF5IDIwMjIsIGF0IDA0OjEyLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAxMCBNYXkgMjAyMiwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEl0IGlzIG5vdCByZWFzb25hYmxlIHRvIHNheSAidGhp
cyB1bnJlbGF0ZWQgdGhpbmcgaXMgYnJva2VuLCBhbmQgeW91DQo+Pj4gbmVlZCB0byBmaXggaXQg
Zmlyc3QgdG8gZ2V0IHlvdXIgc2VyaWVzIGluIi4gIFJlcXVlc3RzIGxpa2UgdGhhdCBhcmUsDQo+
Pj4gSSdtIHN1cmUsIHBhcnQgb2Ygd2hhdCBCZXJ0cmFuZCByYWlzZWQgaW4gdGhlIGNvbW11bml0
eSBjYWxsIGFzDQo+Pj4gdW5uZWNlc3NhcnkgZmljdGlvbiBnZXR0aW5nIHdvcmsgc3VibWl0dGVk
Lg0KPj4gDQo+PiBUbyBiZSBob25lc3QsIHlvdSBwdXQgdGhlIGNvbnRyaWJ1dG9yIGluIHRoaXMg
c2l0dWF0aW9uLiBJIHdvdWxkIGhhdmUgYmVlbg0KPj4gcGVyZmVjdGx5IGhhcHB5IGlmIHdlIGtl
ZXAgKmNwdXAqIGFyb3VuZCBhcyB0aGVyZSB3b3VsZCBiZSBvbmx5IGEgcGxhY2UgdG8NCj4+IGZp
eC4NCj4+IA0KPj4gV2l0aCB0aGlzIGFwcHJvYWNoLCB5b3UgYXJlIGVmZmVjdGl2ZWx5IGdvaW5n
IHRvIGluY3JlYXNlIHRoZSB3b3JrIGxhdGVyIG9uZQ0KPj4gYmVjYXVzZSBub3cgd2Ugd291bGQg
aGF2ZSB0byBjaGFzZSBhbGwgdGhlIG9wZW4tY29kZWQgdmVyc2lvbiBvZiAqY3B1cCogYW5kDQo+
PiBjaGVjayB3aGljaCBvbmUgaXMgbm90IHNhZmUuDQo+IA0KPiANCj4gV2l0aG91dCBkaXNhZ3Jl
ZWluZyB3aXRoIEp1bGllbiBvciBBbmRyZXcsIEkgYW0gYWN0dWFsbHkgaGFwcHkgdG8gc2VlIGFu
DQo+IGVmZm9ydCB0byBtYWtlIHRoZSByZXZpZXcgcHJvY2VzcyBmYXN0ZXIuIFdlIGhhdmUgbG90
IG9mIHJvb20gZm9yDQo+IGltcHJvdmVtZW50IGFuZCBzcG90dGluZyBvcHBvcnR1bml0aWVzIHRv
IGRvIHNvIGlzIHRoZSBmaXJzdCBzdGVwIHRvd2FyZA0KPiBpbXByb3ZpbmcgdGhlIHByb2Nlc3Mu
IEkgaGF2ZSBhY3R1YWxseSBiZWVuIHRoaW5raW5nIGFib3V0IGhvdyB0byBtYWtlDQo+IHRoaW5n
cyBmYXN0ZXIgaW4gY2FzZXMgbGlrZSB0aGlzIGFuZCBJIGhhdmUgYSBzdWdnZXNpb24gYmVsb3cu
DQoNCkRlZmluaXRlbHkgd2l0aCB5b3UgaGVyZSwgaXQgaXMgZ29vZCB0byBzZWUgdGhhdCBteSBt
ZXNzYWdlIG9uIHJldmlldyBwcm9jZXNzDQphbmQgZWZmb3J0IGlzIGFjdHVhbGx5IGluIHBlb3Bs
ZeKAmXMgbWluZHMgOi0pDQoNCj4gDQo+IEluIHRoaXMgY2FzZSBhbGwgb2YgdGhlIG9wdGlvbnMg
YXJlIE9LLiBXaGV0aGVyIHdlIGZpeCB0aGUgYWxpZ25tZW50DQo+IHByb2JsZW0gYXMgcGFydCBv
ZiB0aGlzIHBhdGNoIG9yIHNvb24gYWZ0ZXIgaXQgZG9lc24ndCBtYWtlIG11Y2ggb2YgYQ0KPiBk
aWZmZXJlbmNlLiBJdCBpcyBtb3JlIGltcG9ydGFudCB0aGF0IHdlIGRvbid0IGdldCBib2dnZWQg
ZG93biBpbiBhIGxvbmcNCj4gZGlzY3Vzc2lvbi4gQ29kaW5nIGlzIGZhc3RlciBhbmQgbW9yZSBm
dW4uDQoNCkkgd291bGQganVzdCBtYWtlIGEgc21hbGwgZXhjZXB0aW9uIGhlcmUgKHdoaWNoIGNv
cnJlc3BvbmRzIHRvIHNvbWV0aGluZw0KSnVsaWVuIGtpbmQgb2Ygc3VnZ2VzdGVkIGR1cmluZyB0
aGUgZGlzY3Vzc2lvbik6IHVubGVzcyB3ZSBpbnRyb2R1Y2UgYQ0KdGVtcG9yYXJ5IGJ1ZyBiZXR3
ZWVuIHRoZSBwYXRjaGVzLg0KQnV0IHRoaXMgY291bGQgYWN0dWFsbHkgYmUgc29sdmVkIGhlcmUg
YnkgbWFraW5nIGEgcGF0Y2ggdXBmcm9udCBhbmQgbWVyZ2luZw0KaXQgYmVmb3JlIHRoZSBvbmUg
aW4gZGlzY3Vzc2lvbiAod2hpY2ggbWlnaHQgcmVxdWlyZSBzb21lIHJlYmFzaW5nKS4NCg0KPiAN
Cj4gSXQgd291bGQgdGFrZSBsZXNzIHRpbWUgZm9yIEp1bGllbiAob3IgQW5kcmV3KSB0byB3cml0
ZSB0aGUgY29kZSB0aGFuIHRvDQo+IGV4cGxhaW4gdG8gdGhlIGNvbnRyaWJ1dG9yIGhvdyB0byBk
byBpdC4gRW5nbGlzaCBpcyBhIGdvb2QgbGFuZ3VhZ2UgZm9yDQo+IGFuIGFyY2hpdGVjdHVyYWwg
ZGlzY3Vzc2lvbiwgYnV0IHNpbXBseSByZXBseWluZyB3aXRoIHRoZSBleGFtcGxlIGNvZGUNCj4g
aW4gQyB3b3VsZCBiZSBtdWNoIGZhc3RlciBpbiBjYXNlcyBsaWtlIHRoaXMgb25lLg0KPiANCj4g
U28gbXkgc3VnZ2VzdGlvbiBpcyB0aGF0IGl0IHdvdWxkIGJlIGJlc3QgaWYgdGhlIHJldmlld2Vy
IChKdWxpZW4gaW4NCj4gdGhpcyBjYXNlKSByZXBsaWVkIGRpcmVjdGx5IHdpdGggdGhlIGNvZGUg
c25pcHBlciBoZSB3YW50cyBhZGRlZC4gSnVzdA0KPiBhbiBleGFtcGxlIHdpdGhvdXQgbG9va2lu
ZyB0b28gY2xvc2VseToNCj4gDQo+IC0tLQ0KPiBQbGVhc2UgZG8gdGhpcyBpbnN0ZWFkIHNvIHRo
YXQgYWxpZ25tZW50IGFsc28gZ2V0cyBmaXhlZDoNCj4gDQo+IHJldHVybiBiZTE2X3RvX2NwdSgq
KGNvbnN0IF9fcGFja2VkIHVpbnQxNl90ICopcCk7DQo+IC0tLQ0KPiANCj4gDQo+IEFsdGVybmF0
aXZlbHksIEkgYWxzbyB0aGluayB0aGF0IHRha2luZyB0aGlzIHBhdGNoIGFzIGlzIHdpdGhvdXQN
Cj4gYWxpZ25tZW50IGZpeCAoZWl0aGVyIHVzaW5nIGJlMTZfdG9fY3B1IG9yIGJlMTZfdG9fY3B1
cCkgaXMgZmluZS4gVGhlDQo+IGFsaWdubWVudCBjb3VsZCBiZSBmaXhlZCBhZnRlcndhcmRzLiBU
aGUga2V5IGlzIHRoYXQgSSB0aGluayBpdCBzaG91bGQNCj4gYmUgb25lIG9mIHRoZSBtYWludGFp
bmVycyB0byB3cml0ZSB0aGUgZm9sbG93LXVwIGZpeC4gQm90aCBvZiB5b3UgYXJlDQo+IHZlcnkg
ZmFzdCBjb2RlcnMgYW5kIHdvdWxkIGNlcnRhaW5seSBmaW5pc2ggdGhlIHBhdGNoIGJlZm9yZSBm
aW5pc2hpbmcNCj4gdGhlIGV4cGxhbmF0aW9uIG9uIHdoYXQgbmVlZHMgdG8gYmUgZG9uZSwgd2hp
Y2ggdGhlbiB3b3VsZCBuZWVkIHRvIGJlDQo+IHVuZGVyc3Rvb2QgYW5kIGltcGxlbWVudGVkIGJ5
IHRoZSBjb250cmlidXRvciAob3Bwb3J0dW5pdHkgZm9yDQo+IG1pc3VuZGVyc3RhbmRpbmdzKSwg
YW5kIHZlcmlmaWVkIGFnYWluIGJ5IHRoZSByZXZpZXdlciBvbiB2Mi4gVGhhdCB3b3VsZA0KPiB0
YWtlIGFuIG9yZGVyIG9mIG1hZ25pdHVkZSBtb3JlIG9mIGNvbGxlY3RpdmUgdGltZSBhbmQgZWZm
b3J0Lg0KDQpBZ3JlZSB3aXRoIHRoZSBleGNlcHRpb24gSSBtZW50aW9uZWQuDQoNCj4gDQo+IE9m
IGNvdXJzZSB0aGlzIGRvZXNuJ3QgYXBwbHkgdG8gYWxsIGNhc2VzLCBidXQgaXQgc2hvdWxkIGFw
cGx5IHRvIHF1aXRlDQo+IGEgZmV3Lg0KPiANCj4gSW4gc2hvcnQsIGxlc3MgRW5nbGlzaCwgbW9y
ZSBDICA7LSkNCg0KU2FtZSBnb2VzIGZvciB0aGluZ3MgbGlrZSDigJxwbGVhc2UgYWRkIGEgY29t
bWVudOKAnSBvciDigJxwbGVhc2Ugc2F5DQpzb21ldGhpbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
4oCdLCBpdCB3b3VsZCBiZSBtb3N0IG9mIHRoZSB0aW1lIGVhc2llcg0KZm9yIGV2ZXJ5b25lIHRv
IGRvOiBDb3VsZCB5b3UgYWRkIHRoZSBjb21tZW50IOKAnHh4eOKAnSBvbiB0b3Agb2YgdGhpcyBv
cg0KdGhlIHNlbnRlbmNlIOKAnHl5eeKAnSBpbiB5b3VyIGNvbW1pdCAob3IgZXZlbiBiZXR0ZXIg
YXNrIHRoZSBjb250cmlidXRvciBpZg0KaGUgaXMgb2sgd2l0aCBpdCBhbmQgZG8gaXQgb24gY29t
bWl0IHdoZW4gaXQgbm90IG1vZGlmeWluZyB0aGUgY29kZSkuDQoNCkNoZWVycw0KQmVydHJhbmQN
Cg0K

