Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB0F5A4780
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 12:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394534.633975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oScIh-00056H-O5; Mon, 29 Aug 2022 10:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394534.633975; Mon, 29 Aug 2022 10:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oScIh-00053Z-Jm; Mon, 29 Aug 2022 10:47:27 +0000
Received: by outflank-mailman (input) for mailman id 394534;
 Mon, 29 Aug 2022 10:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emil=ZB=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oScIf-00053S-T0
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 10:47:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6e431fb-2787-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 12:47:24 +0200 (CEST)
Received: from AM5PR0402CA0011.eurprd04.prod.outlook.com
 (2603:10a6:203:90::21) by AS4PR08MB7832.eurprd08.prod.outlook.com
 (2603:10a6:20b:51c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 10:47:21 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::72) by AM5PR0402CA0011.outlook.office365.com
 (2603:10a6:203:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21 via Frontend
 Transport; Mon, 29 Aug 2022 10:47:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Mon, 29 Aug 2022 10:47:20 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 29 Aug 2022 10:47:20 +0000
Received: from fa52e90d51ed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A81505B-CF82-4CD7-B027-25ADA7EDF014.1; 
 Mon, 29 Aug 2022 10:47:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa52e90d51ed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Aug 2022 10:47:14 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB6PR0801MB1685.eurprd08.prod.outlook.com (2603:10a6:4:38::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 10:47:10 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:47:10 +0000
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
X-Inumbo-ID: f6e431fb-2787-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Y69ZOO6UzX1wu5zsiZHWH/SqsS0vTBGHCdokKDEUIIyNLDZi2GAQ8fzC8KzIK/TZnh4C+9Rz3WmJi4Nl3cOyYmljte+MeVODvpEjCFipnCuDODHuSGuGfgzDVdGYbjgv1Gbn5xvonwNARlxnGnJlg+ajhYpCGLHckOSaU37PXIfLLiWryvYgOdB+euO9hcV0/hMkNoM9Ch7mlhcijVEW+DWqsOcALQAMoYhLpvM4X6LFYnyOBt1xti/JwgmOffrrciBoynH8eDuHkQRdMI+3RDHu5I1iZI7gxn8d24WqHPuioz3/R0QlwU+xvxZ6GEh3xijYeu/YpLG02AfVihqnNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O41ZtzFsUawgbIUV0P7gtt3+nqLxV1hCpCvyF7lDXNQ=;
 b=L2rC+wXTbmULO02NKL9v1diBv/kww37YOP7rdtNCv0OhIp46yRwyW3CF6QjVuXOYI+bZdynFHCEUSvtyroIjKIfjRQoPkKY1T3TFbH7sUlaHFLhdnMiWb8IObHJOm51nZMpzZGgcP9EmetGYKcR7bAaDbCqagMchAZYdQSMzjcIbUvjXIcpQVX1jytaWp83SFNyYidMCMeMU+ZFC1mmOf49s6sB/AJrm5HpNGG7+uB4OBJerQ/pr9t9wi2kVpErAwaR/R2EztFJHEwOuMpsKmv3GL8mHmLva0Jj4Lf3eNdpmo57FnTg8KNDJQZuT+vN7inj4YhU3zNmOzLaLgkDD5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O41ZtzFsUawgbIUV0P7gtt3+nqLxV1hCpCvyF7lDXNQ=;
 b=8mQGC88GZbeVZaxzTTP6URvy0aIh8yAInaUv6oGEiauqOGV8OlXm8TwNjZsKc06X2Rx7m68kJG8GCaJ3fhPahke7k6sFWwLnHD50kO1y9dn2NJfY9Ce5ldFIJqPoiLQSlJzrJQu2+UTQzHS0fxXx4bhLQNrkRRchdEL1n22VqU4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPvtv7X9GBHgF4b/2tjN51zL6ynKzStlG8jb5SsknlIMj/Ei9kGWQ00uFA/QbFQOIFO4YpGc+r9KWqffhhEr1zf0C31CUZUctEMUgTDPbc/1XY/c8WXau63jvC0Q4P2OoCHN8J7ETfsJOA8BH8WRpCN/wE8OhWV2UdflDQQo2HJgFQ0WUraL7SFRfa6QVBV0KZItEJIzRE6X+jl86hAg5/e4DON0+bP4xwPyRCwGHaybNaDbCoh5ffFkJx4oHvG55cUWJA9Hcrt4qh4NGoW0ydLA/N2P6/F/4nV4FE4AuxtlIGsgN15mJLH2DI/jZUoDs8HwgiOpaxMNdbEpEm4x1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O41ZtzFsUawgbIUV0P7gtt3+nqLxV1hCpCvyF7lDXNQ=;
 b=gDcMAF/HZWI2p7C6nrg7WDU3NlWWyz/8Q62J3uIuThUbaZor7BtpkAKRG4cHojiTZvRzk5N54NuC7IQBsV3sj/ZArvCa3LJzwCgI6bR5ctqVQHmLcC+RxU40ntPw0VJ4VtPK8ch2fTg73duPdAc84mkD0UyZ4lgIYwCUZ7GEXwgAeXT4gECZ8Eq0eJl9jjVuXUqJVS38Nlbflxfw06XxCFru9Ke+yHLr7YgG35vBkmDTbC/yFiwVsmXLzWQe0eyQ5iNzAI5NA6owwEoCbxANl7GzzpREQPsmh2WVIiMN2Hg0xaW/SgjPCp6K1semvlBlvtc0kMsW+LD3y4Frihepxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O41ZtzFsUawgbIUV0P7gtt3+nqLxV1hCpCvyF7lDXNQ=;
 b=8mQGC88GZbeVZaxzTTP6URvy0aIh8yAInaUv6oGEiauqOGV8OlXm8TwNjZsKc06X2Rx7m68kJG8GCaJ3fhPahke7k6sFWwLnHD50kO1y9dn2NJfY9Ce5ldFIJqPoiLQSlJzrJQu2+UTQzHS0fxXx4bhLQNrkRRchdEL1n22VqU4=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Topic: [PATCH v3 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Index: AQHYtdM2Eqjqd47WVk6sRlJr0wlVJa2/lskAgAYfE5A=
Date: Mon, 29 Aug 2022 10:47:09 +0000
Message-ID:
 <PAXPR08MB742071B0098747255B9A95F39E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-6-wei.chen@arm.com>
 <67d9e7bf-8e0c-9290-5ac5-30d8cd8b9177@suse.com>
In-Reply-To: <67d9e7bf-8e0c-9290-5ac5-30d8cd8b9177@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6C5BC177969AAB488A2E7125EB56395B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7eba1e52-8576-46bf-13be-08da89abd985
x-ms-traffictypediagnostic:
	DB6PR0801MB1685:EE_|VE1EUR03FT030:EE_|AS4PR08MB7832:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kz2HVDSvs3Ehjhtfc0lLVJh0Bx0rINbpz1KmMona4S1tpvNFPD+nBFBgBW7a1jkdF1wfVmt+tuC9pljDTBmdiooz+DOTfYeDlqEIOSB11aq5BZyVGDor0Xb4j6vKc1Z+WDU0ixMGtt3veI6l90k2WpJO2oHpGqbxMwhHOdibhY+w8qXLyn5j54q843wErTBbP/00sGt/I9GBGn+Z5GBgxVniRUu6ppCLB0H+XCHuoBujdJ17/FPcmw1zdRqxADu6ID8vsYYlnmsaBlicOxeQVboTilKJ9JOBKEO6tO+4nlDrn2Ep9uHwV/SLUhH+AgyWxsCtO3Fnqu4QYxRPKgN9tYEFogjb03HMkJmfJx5oK9SO13HsNpSR1j+ifShGdRb0Yro90K6UWPVN1XgsdwteuhQvHzdiZrwmkhtqchJTnn+hnegPNfE21trMcVdq5D+VHkGpU/1f/FZUNuySV/0kSsL5xw14Bmp0Ou4M09u6BZ+EJz8oIxlYPQh6zWa9RcDXv+XCpH1jPtipN52xOKree1PpfuHHPZrL9+B/MRzF2/adLVhCMtVfH4QKdF1PRNaKVd1EzLKx9B615Du0kXm4jhtH3ZQijiMvnxJkFohllQcJK7CoxvcM+XRJDpax/39a5tLIDdLVaTytFayVsmpbibEkhDAnTfxEnEkAqXZ0VknwTFVt0uujHtyCF1+t2SISnkzCnrAMhcFktkeb+0QW49+E7WYd0FP17J+SfsFAZYa47sa1GcSgsGu105RHIEyluWx69jGgtz+F6+4ggjb0hw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(33656002)(6506007)(7696005)(53546011)(86362001)(122000001)(38100700002)(41300700001)(83380400001)(26005)(186003)(9686003)(54906003)(6916009)(316002)(55016003)(66556008)(66946007)(478600001)(71200400001)(66476007)(66446008)(64756008)(4326008)(8676002)(2906002)(5660300002)(76116006)(38070700005)(52536014)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1685
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dcf09aa2-86a1-4ab0-55b2-08da89abd31f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M+ppcQdaJ3gT9Z3Dh2hNv8HSGzEIdAnPH+c80ZXBJ3AGNKji7B1ltl5CQqk1MDq/sThyppgDS8k1FfVoqMQKfzDi7Fbtoz19DqJP+7d/2Oj4W/btVdkffUTFWCA/8SGefEC+3UxJUUugiHw4nYRKv9mc5yc7O6LVQG5x6vcDnJxlanJF9VBeSAfKMLqysy9D1Oqvw9K1+TY7cOY5vgzM8wFhrRqO/RA1mDtnYMxf6BLpndm4meQdn8SEFHjRAeQ0hF/UMwX4A5T1765lNqXBBEJA7udEY9lgDJilQGFQKccWS7cbmBvCLY1ngnvKfsx73aTfOTsj5uJpwj/5mqz3MMyEZ6KPpSQjb94FvsA0qN/XTxN3a/CIeMqtIKwPMcFdiT3y2yqNp1aG5FWDa1ZbcwuFiUui/AGuXGDCBzWzYIS+NlhwrVnGcb8aLCjxAKZJDifMXrjM4QtE176t1XpsoZTcw/mBLjaBkGtYNBZtAkvVZHIOgdMTFAZ4r0dDArLLf30Pry565OiYzNhk8fJGLsIduzKzsz7RJOhjz9l/vi5RhkVxST2TcimeKgONJoM13qXvIJ25PMbB+URrHZToXat27ZYLHDo9eK9Tf3wJOs4FsPn8j9kXUwQQrxJks9jyAYeA1QeNYl04AwOCUXxVvQeRb2Kv6aZtfhnAzVdf9TVk+2j5S65n3cP6EFsd7m4KFZmJGrhBEM3Ut8lvuLy6fDNAJe+A1LTXTWwTJSYXDFooq8Z9WyUzJw/Nc5Z/TlXjiq+U8VTHZfRXhKSaHgEiVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(46966006)(40470700004)(70206006)(2906002)(70586007)(53546011)(7696005)(8676002)(33656002)(40480700001)(6506007)(8936002)(6862004)(52536014)(40460700003)(41300700001)(4326008)(336012)(5660300002)(55016003)(186003)(36860700001)(83380400001)(47076005)(478600001)(86362001)(81166007)(356005)(9686003)(26005)(82310400005)(82740400003)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:47:20.6417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eba1e52-8576-46bf-13be-08da89abd985
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7832

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDjmnIgyNeaXpSAyMDo1MA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjMgNS82XSB4ZW4veDg2OiBtb3ZlIE5VTUEgc2NhbiBub2RlcyBjb2RlcyBmcm9tIHg4Ng0K
PiB0byBjb21tb24NCj4gDQo+IE9uIDIyLjA4LjIwMjIgMDQ6NTgsIFdlaSBDaGVuIHdyb3RlOg0K
PiA+IC0tLSBhL3hlbi9jb21tb24vbnVtYS5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9udW1hLmMN
Cj4gPiBAQCAtMTMsNiArMTMsMjEgQEANCj4gPiAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPiA+
ICAjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4NCj4gPg0KPiA+ICtzdGF0aWMgbm9kZW1hc2tfdCBf
X2luaXRkYXRhIHByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQ7DQo+ID4gK3N0YXRpYyBub2RlbWFza190
IF9faW5pdGRhdGEgbWVtb3J5X25vZGVzX3BhcnNlZDsNCj4gPiArc3RhdGljIHN0cnVjdCBub2Rl
IF9faW5pdGRhdGEgbm9kZXNbTUFYX05VTU5PREVTXTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQg
X19yb19hZnRlcl9pbml0IG51bV9ub2RlX21lbWJsa3M7DQo+IA0KPiB1bnNpZ25lZCBpbnQ/DQo+
IA0KDQpZZXMsIEkgd2lsbCBmaXggaXQuDQoNCj4gPiBAQCAtMzYsNiArNTEsMzA4IEBAIGJvb2wg
bnVtYV9kaXNhYmxlZCh2b2lkKQ0KPiA+ICAgICAgcmV0dXJuIG51bWFfb2ZmIHx8IGFyY2hfbnVt
YV9kaXNhYmxlZChmYWxzZSk7DQo+ID4gIH0NCj4gPg0KPiA+ICt2b2lkIF9faW5pdCBudW1hX3Nl
dF9wcm9jZXNzb3Jfbm9kZXNfcGFyc2VkKG5vZGVpZF90IG5vZGUpDQo+ID4gK3sNCj4gPiArICAg
IG5vZGVfc2V0KG5vZGUsIHByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQpOw0KPiA+ICt9DQo+ID4gKw0K
PiA+ICt1bnNpZ25lZCBpbnQgdmFsaWRfbnVtYV9yYW5nZShwYWRkcl90IHN0YXJ0LCBwYWRkcl90
IGVuZCwgbm9kZWlkX3Qgbm9kZSkNCj4gDQo+IGJvb2wgKGFuZCB0aGVuIHRydWUvZmFsc2UgYmVs
b3cpPw0KPiANCg0KT2suDQoNCj4gPiArew0KPiA+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ID4g
Kw0KPiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBudW1fbm9kZV9tZW1ibGtzOyBpKysgKQ0KPiA+
ICsgICAgew0KPiA+ICsgICAgICAgIHN0cnVjdCBub2RlICpuZCA9ICZub2RlX21lbWJsa19yYW5n
ZVtpXTsNCj4gDQo+IGNvbnN0Pw0KPiANCj4gPiArICAgICAgICBpZiAoIG5kLT5zdGFydCA8PSBz
dGFydCAmJiBuZC0+ZW5kID49IGVuZCAmJg0KPiA+ICsgICAgICAgICAgICAgbWVtYmxrX25vZGVp
ZFtpXSA9PSBub2RlICkNCj4gPiArICAgICAgICAgICAgcmV0dXJuIDE7DQo+ID4gKyAgICB9DQo+
ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYw0KPiA+
ICtlbnVtIGNvbmZsaWN0cyBfX2luaXQgY29uZmxpY3RpbmdfbWVtYmxrcyhub2RlaWRfdCBuaWQs
IHBhZGRyX3Qgc3RhcnQsDQo+IA0KPiBNYXkgSSBhc2sgdGhhdCB5b3UgcmUtZmxvdyB0aGlzIHRv
IGVpdGhlcg0KPiANCj4gc3RhdGljIGVudW0gY29uZmxpY3RzIF9faW5pdA0KPiBjb25mbGljdGlu
Z19tZW1ibGtzKG5vZGVpZF90IG5pZCwgcGFkZHJfdCBzdGFydCwNCj4gDQo+IG9yDQo+IA0KPiBz
dGF0aWMgZW51bSBjb25mbGljdHMgX19pbml0IGNvbmZsaWN0aW5nX21lbWJsa3MoDQo+ICAgICBu
b2RlaWRfdCBuaWQsIHBhZGRyX3Qgc3RhcnQsDQo+IA0KPiA/DQo+IA0KDQpPay4NCg0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IGVuZCwgcGFk
ZHJfdCBuZF9zdGFydCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFkZHJfdCBuZF9lbmQsIHVuc2lnbmVkIGludA0KPiAqbWJsa2lkKQ0KPiA+ICt7DQo+
ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiArDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICog
U2NhbiBhbGwgcmVjb3JkZWQgbm9kZXMnIG1lbW9yeSBibG9ja3MgdG8gY2hlY2sgY29uZmxpY3Rz
Og0KPiA+ICsgICAgICogT3ZlcmxhcCBvciBpbnRlcmxlYXZlLg0KPiA+ICsgICAgICovDQo+ID4g
KyAgICBmb3IgKCBpID0gMDsgaSA8IG51bV9ub2RlX21lbWJsa3M7IGkrKyApDQo+ID4gKyAgICB7
DQo+ID4gKyAgICAgICAgc3RydWN0IG5vZGUgKm5kID0gJm5vZGVfbWVtYmxrX3JhbmdlW2ldOw0K
PiANCj4gY29uc3Q/DQo+IA0KDQpBY2suDQoNCj4gPiArYm9vbCBfX2luaXQgbnVtYV9tZW1ibGtz
X2F2YWlsYWJsZSh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICByZXR1cm4gbnVtX25vZGVfbWVtYmxr
cyA8IE5SX05PREVfTUVNQkxLUzsNCj4gPiArfQ0KPiANCj4gVGhpcyBpcyBraW5kIG9mIGNsdW1z
eSwgYnV0IEkgaGF2ZSBubyBiZXR0ZXIgc3VnZ2VzdGlvbi4NCj4gDQoNCkRpZCB5b3UgbWVhbiB0
aGUgd2hvbGUgZnVuY3Rpb24gb3IganVzdCB0aGUgbmFtZT8NCg0KPiA+ICsvKg0KPiA+ICsgKiBU
aGlzIGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIGJ5IE5VTUEgbWVtb3J5IGFmZmluaXR5IGluaXRp
YWxpemF0aW9uDQo+IHRvDQo+ID4gKyAqIHVwZGF0ZSBOVU1BIG5vZGUncyBtZW1vcnkgcmFuZ2Uu
IEluIHRoaXMgZnVuY3Rpb24sIHdlIGFzc3VtZSBhbGwNCj4gbWVtb3J5DQo+ID4gKyAqIHJlZ2lv
bnMgYmVsb25naW5nIHRvIGEgc2luZ2xlIG5vZGUgYXJlIGluIG9uZSBjaHVuay4gSG9sZXMgKG9y
IE1NSU8NCj4gPiArICogcmFuZ2VzKSBiZXR3ZWVuIHRoZW0gd2lsbCBiZSBpbmNsdWRlZCBpbiB0
aGUgbm9kZS4NCj4gPiArICoNCj4gPiArICogU28gaW4gbnVtYV91cGRhdGVfbm9kZV9tZW1ibGtz
LCBpZiB0aGVyZSBhcmUgbXVsdGlwbGUgYmFua3MgZm9yIGVhY2gNCj4gPiArICogbm9kZSwgc3Rh
cnQgYW5kIGVuZCBhcmUgc3RyZXRjaGVkIHRvIGNvdmVyIHRoZSBob2xlcyBiZXR3ZWVuIHRoZW0s
DQo+IGFuZA0KPiA+ICsgKiBpdCB3b3JrcyBhcyBsb25nIGFzIG1lbW9yeSBiYW5rcyBvZiBkaWZm
ZXJlbnQgTlVNQSBub2RlcyBkb24ndA0KPiBpbnRlcmxlYXZlLg0KPiA+ICsgKi8NCj4gPiAraW50
IF9faW5pdCBudW1hX3VwZGF0ZV9ub2RlX21lbWJsa3Mobm9kZWlkX3Qgbm9kZSwgdW5zaWduZWQg
aW50DQo+IGFyY2hfbmlkLA0KPiANCj4gVGhlIGZ1bmN0aW9uIG9ubHkgZXZlciByZXR1cm5zIDAg
b3IgLUVJTlZBTCAtIHBsZWFzZSBjb25zaWRlciBzd2l0Y2hpbmcNCj4gdG8gImJvb2wiIHJldHVy
biB0eXBlLg0KDQpPay4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFkZHJfdCBzdGFydCwgcGFkZHJfdCBzaXplLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcmVmaXgsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaG90cGx1ZykNCj4gPiArew0KPiA+ICsgICAg
dW5zaWduZWQgaW50IGk7DQo+ID4gKyAgICBwYWRkcl90IGVuZCA9IHN0YXJ0ICsgc2l6ZTsNCj4g
PiArICAgIHBhZGRyX3QgbmRfc3RhcnQgPSBzdGFydDsNCj4gPiArICAgIHBhZGRyX3QgbmRfZW5k
ID0gZW5kOw0KPiA+ICsgICAgc3RydWN0IG5vZGUgKm5kID0gJm5vZGVzW25vZGVdOw0KPiA+ICsN
Cj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBGb3IgdGhlIG5vZGUgdGhhdCBhbHJlYWR5IGhhcyBz
b21lIG1lbW9yeSBibG9ja3MsIHdlIHdpbGwNCj4gPiArICAgICAqIGV4cGFuZCB0aGUgbm9kZSBt
ZW1vcnkgcmFuZ2UgdGVtcG9yYXJpbHkgdG8gY2hlY2sgbWVtb3J5DQo+ID4gKyAgICAgKiBpbnRl
cmxlYXZlcyB3aXRoIG90aGVyIG5vZGVzLiBXZSB3aWxsIG5vdCB1c2UgdGhpcyBub2RlDQo+ID4g
KyAgICAgKiB0ZW1wIG1lbW9yeSByYW5nZSB0byBjaGVjayBvdmVybGFwcywgYmVjYXVzZSBpdCB3
aWxsIG1hc2sNCj4gPiArICAgICAqIHRoZSBvdmVybGFwcyBpbiBzYW1lIG5vZGUuDQo+ID4gKyAg
ICAgKg0KPiA+ICsgICAgICogTm9kZSB3aXRoIDAgYnl0ZXMgbWVtb3J5IGRvZXNuJ3QgbmVlZCB0
aGlzIGV4cGFuZHNpb24uDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIGlmICggbmQtPnN0YXJ0ICE9
IG5kLT5lbmQgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGlmICggbmRfc3RhcnQgPiBuZC0+
c3RhcnQgKQ0KPiA+ICsgICAgICAgICAgICBuZF9zdGFydCA9IG5kLT5zdGFydDsNCj4gPiArDQo+
ID4gKyAgICAgICAgaWYgKCBuZF9lbmQgPCBuZC0+ZW5kICkNCj4gPiArICAgICAgICAgICAgbmRf
ZW5kID0gbmQtPmVuZDsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICAvKiBJdCBpcyBmaW5l
IHRvIGFkZCB0aGlzIGFyZWEgdG8gdGhlIG5vZGVzIGRhdGEgaXQgd2lsbCBiZSB1c2VkDQo+IGxh
dGVyKi8NCj4gDQo+IFBsZWFzZSBhZGp1c3Qgc3R5bGUgaGVyZS4NCj4gDQoNCk9rLg0KDQo+ID4g
KyAgICBzd2l0Y2ggKCBjb25mbGljdGluZ19tZW1ibGtzKG5vZGUsIHN0YXJ0LCBlbmQsIG5kX3N0
YXJ0LCBuZF9lbmQsDQo+ICZpKSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICBjYXNlIE9WRVJMQVA6
DQo+ID4gKyAgICAgICAgaWYgKCBtZW1ibGtfbm9kZWlkW2ldID09IG5vZGUgKQ0KPiA+ICsgICAg
ICAgIHsNCj4gPiArICAgICAgICAgICAgYm9vbCBtaXNtYXRjaCA9ICEoaG90cGx1ZykgIT0gIXRl
c3RfYml0KGksIG1lbWJsa19ob3RwbHVnKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgIHByaW50
aygiJXNOVU1BOiAlcyAldSBbJSJQUklwYWRkciIsICUiUFJJcGFkZHIiXSBvdmVybGFwcw0KPiB3
aXRoIGl0c2VsZiBbJSJQUklwYWRkciIsICUiUFJJcGFkZHIiXVxuIiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgIG1pc21hdGNoID8gS0VSTl9FUlIgOiBLRVJOX1dBUk5JTkcsIHByZWZpeCwNCj4g
PiArICAgICAgICAgICAgICAgICAgIGFyY2hfbmlkLCBzdGFydCwgZW5kIC0gMSwNCj4gPiArICAg
ICAgICAgICAgICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLnN0YXJ0LCBub2RlX21lbWJsa19y
YW5nZVtpXS5lbmQNCj4gLSAxKTsNCj4gPiArICAgICAgICAgICAgaWYgKCBtaXNtYXRjaCApDQo+
ID4gKyAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgICAgICAgICAgYnJl
YWs7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICBwcmludGsoS0VSTl9FUlIN
Cj4gPiArICAgICAgICAgICAgICAgIk5VTUE6ICVzICV1IFslIlBSSXBhZGRyIiwgJSJQUklwYWRk
ciJdIG92ZXJsYXBzDQo+IHdpdGggJXMgJXUgWyUiUFJJcGFkZHIiLCAlIlBSSXBhZGRyIl1cbiIs
DQo+ID4gKyAgICAgICAgICAgICAgIHByZWZpeCwgYXJjaF9uaWQsIHN0YXJ0LCBlbmQgLSAxLCBw
cmVmaXgsDQo+ID4gKyAgICAgICAgICAgICAgIG51bWFfbm9kZV90b19hcmNoX25pZChtZW1ibGtf
bm9kZWlkW2ldKSwNCj4gPiArICAgICAgICAgICAgICAgbm9kZV9tZW1ibGtfcmFuZ2VbaV0uc3Rh
cnQsIG5vZGVfbWVtYmxrX3JhbmdlW2ldLmVuZCAtDQo+IDEpOw0KPiA+ICsgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiA+ICsNCj4gPiArDQo+ID4gKyAgICBjYXNlIElOVEVSTEVBVkU6DQo+ID4g
KyAgICAgICAgcHJpbnRrKEtFUk5fRVJSDQo+ID4gKyAgICAgICAgICAgICAgICJOVU1B77yaICVz
ICV1OiBbJSJQUklwYWRkciIsICUiUFJJcGFkZHIiXSBpbnRlcmxlYXZlcw0KPiB3aXRoICVzICV1
IG1lbWJsayBbJSJQUklwYWRkciIsICUiUFJJcGFkZHIiXVxuIiwNCj4gPiArICAgICAgICAgICAg
ICAgcHJlZml4LCBhcmNoX25pZCwgbmRfc3RhcnQsIG5kX2VuZCAtIDEsDQo+ID4gKyAgICAgICAg
ICAgICAgIHByZWZpeCwgbnVtYV9ub2RlX3RvX2FyY2hfbmlkKG1lbWJsa19ub2RlaWRbaV0pLA0K
PiA+ICsgICAgICAgICAgICAgICBub2RlX21lbWJsa19yYW5nZVtpXS5zdGFydCwgbm9kZV9tZW1i
bGtfcmFuZ2VbaV0uZW5kIC0NCj4gMSk7DQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ID4gKw0KPiA+ICsgICAgY2FzZSBOT19DT05GTElDVDoNCj4gPiArICAgICAgICBicmVhazsNCj4g
PiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBpZiAoICFob3RwbHVnICkNCj4gPiArICAgIHsNCj4g
PiArICAgICAgICBub2RlX3NldChub2RlLCBtZW1vcnlfbm9kZXNfcGFyc2VkKTsNCj4gPiArICAg
ICAgICBuZC0+c3RhcnQgPSBuZF9zdGFydDsNCj4gPiArICAgICAgICBuZC0+ZW5kID0gbmRfZW5k
Ow0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggc3RyY2FzZWNtcCgiTm9kZSIsIHBy
ZWZpeCkgKQ0KPiA+ICsgICAgICAgIHByaW50ayhLRVJOX0lORk8gIk5VTUE6IE5vZGUgJXUgJXMg
JXUNCj4gWyUiUFJJcGFkZHIiLCAlIlBSSXBhZGRyIl0lc1xuIiwNCj4gPiArICAgICAgICAgICAg
ICAgbm9kZSwgcHJlZml4LCBhcmNoX25pZCwgc3RhcnQsIGVuZCAtIDEsDQo+ID4gKyAgICAgICAg
ICAgICAgIGhvdHBsdWcgPyAiIChob3RwbHVnKSIgOiAiIik7DQo+ID4gKyAgICBlbHNlDQo+ID4g
KyAgICAgICAgcHJpbnRrKEtFUk5fSU5GTyAiTlVNQTogTm9kZSAldSBbJSJQUklwYWRkciIsICUi
UFJJcGFkZHIiXSVzXG4iLA0KPiA+ICsgICAgICAgICAgICAgICBub2RlLCBzdGFydCwgZW5kIC0g
MSwgaG90cGx1ZyA/ICIgKGhvdHBsdWcpIiA6ICIiKTsNCj4gDQo+IEhtbSwgaWYgSSdtIG5vdCBt
aXN0YWtlbiBvbmUgb2YgdGhlIHR3byBwcmludGsoKXMgYW5kIGhlbmNlIGFsc28gb25lIG9mDQo+
IHRoZSB0d28gZm9ybWF0IHN0cmluZ3Mgd2lsbCBiZSBkZWFkIGNvZGUgLyBkYXRhIG9uIGV2ZXJ5
IGFyY2hpZWN0dXJlLg0KPiBJIHdvbmRlciBpZiB3ZSBkb24ndCB3YW50IHRvIGhhdmUgYSBIQVNf
TlVNQV9GV19OT0RFX0lEIChuYW1lIHN1YmplY3QNCj4gdG8gaW1wcm92bWVudCkgS2NvbmZpZyBz
ZXR0aW5nIHRvIGF2b2lkIHN1Y2guIEkgY291bGQgaW1hZ2luZSB0aGlzIHRvDQo+IGJlY29tZSBy
ZWxldmFudCBhbHNvIGluIG90aGVyIGNvZGUuDQo+IA0KDQpJZiBIQVNfTlVNQV9GV19OT0RFX0lE
IGNhbiBhdm9pZCBzdWNoIGtpbmQgb2YgY29kZSwgSSB3aWxsIHRyeSB0bw0KdXNlIGl0IGluIG5l
eHQgdmVyc2lvbi4NCg0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBudW1hX3NjYW5fbm9kZXMocGFk
ZHJfdCBzdGFydCwgcGFkZHJfdCBlbmQpDQo+IA0KPiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgb25s
eSAwIG9yIC0xLCBpLmUuIGlzIGV2ZW4gbW9yZSBvZiBhIGNhbmRpZGF0ZQ0KPiBmb3IgaGF2aW5n
ICJib29sIiByZXR1cm4gdHlwZSB0aGFuIG51bWFfdXBkYXRlX25vZGVfbWVtYmxrcygpLg0KPiAN
Cg0KT2ssIEkgd2lsbCB0cnkgaXQuDQoNCj4gPiArew0KPiA+ICsgICAgdW5zaWduZWQgaW50IGk7
DQo+ID4gKyAgICBub2RlbWFza190IGFsbF9ub2Rlc19wYXJzZWQ7DQo+ID4gKw0KPiA+ICsgICAg
LyogRmlyc3QgY2xlYW4gdXAgdGhlIG5vZGUgbGlzdCAqLw0KPiA+ICsgICAgZm9yICggaSA9IDA7
IGkgPCBNQVhfTlVNTk9ERVM7IGkrKyApDQo+ID4gKyAgICAgICAgY3V0b2ZmX25vZGUoaSwgc3Rh
cnQsIGVuZCk7DQo+ID4gKw0KPiA+ICsgICAgLyogV2hlbiBudW1hIGlzIG9uIHdpdGggZ29vZCBm
aXJtd2FyZSwgd2UgY2FuIGRvIG51bWEgc2NhbiBub2Rlcy4NCj4gKi8NCj4gPiArICAgIGlmICgg
YXJjaF9udW1hX2Rpc2FibGVkKHRydWUpICkNCj4gPiArICAgICAgICByZXR1cm4gLTE7DQo+ID4g
Kw0KPiA+ICsgICAgaWYgKCAhbm9kZXNfY292ZXJfbWVtb3J5KCkgKQ0KPiA+ICsgICAgew0KPiA+
ICsgICAgICAgIG51bWFfZndfYmFkKCk7DQo+ID4gKyAgICAgICAgcmV0dXJuIC0xOw0KPiA+ICsg
ICAgfQ0KPiA+ICsNCj4gPiArICAgIG1lbW5vZGVfc2hpZnQgPSBjb21wdXRlX2hhc2hfc2hpZnQo
bm9kZV9tZW1ibGtfcmFuZ2UsDQo+IG51bV9ub2RlX21lbWJsa3MsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWJsa19ub2RlaWQpOw0KPiA+ICsNCj4gPiAr
ICAgIGlmICggbWVtbm9kZV9zaGlmdCA8IDAgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHBy
aW50ayhLRVJOX0VSUg0KPiA+ICsgICAgICAgICAgICAgICAiTlVNQTogTm8gTlVNQSBub2RlIGhh
c2ggZnVuY3Rpb24gZm91bmQuIENvbnRhY3QNCj4gbWFpbnRhaW5lclxuIik7DQo+ID4gKyAgICAg
ICAgbnVtYV9md19iYWQoKTsNCj4gPiArICAgICAgICByZXR1cm4gLTE7DQo+ID4gKyAgICB9DQo+
ID4gKw0KPiA+ICsgICAgbm9kZXNfb3IoYWxsX25vZGVzX3BhcnNlZCwgbWVtb3J5X25vZGVzX3Bh
cnNlZCwNCj4gcHJvY2Vzc29yX25vZGVzX3BhcnNlZCk7DQo+ID4gKw0KPiA+ICsgICAgLyogRmlu
YWxseSByZWdpc3RlciBub2RlcyAqLw0KPiA+ICsgICAgZm9yX2VhY2hfbm9kZV9tYXNrKCBpLCBh
bGxfbm9kZXNfcGFyc2VkICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwYWRkcl90IHNpemUg
PSBub2Rlc1tpXS5lbmQgLSBub2Rlc1tpXS5zdGFydDsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYg
KCBzaXplID09IDAgKQ0KPiA+ICsgICAgICAgICAgICBwcmludGsoS0VSTl9JTkZPICJOVU1BOiBu
b2RlICV1IGhhcyBubyBtZW1vcnlcbiIsIGkpOw0KPiA+ICsNCj4gPiArICAgICAgICBzZXR1cF9u
b2RlX2Jvb3RtZW0oaSwgbm9kZXNbaV0uc3RhcnQsIG5vZGVzW2ldLmVuZCk7DQo+ID4gKyAgICB9
DQo+IA0KPiBNYXkgSSBzdWdnZXN0IHRvIGVsaW1pbmF0ZSAic2l6ZSIgYXQgdGhpcyBvY2Nhc2lv
biwgZm9yIGJlaW5nIHVzZWQNCj4gb25seSBvbmNlIGFuZCByYXRoZXIgbm90IGhlbHBpbmcgcmVh
ZGFiaWxpdHkgKGltbyBhdCBsZWFzdCk/DQo+IA0KDQpPay4NCg0KPiA+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9tbS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gPiBAQCAtNTgs
NiArNTgsOCBAQA0KPiA+ICAjaW5jbHVkZSA8eGVuL3BlcmZjLmg+DQo+ID4gICNpbmNsdWRlIDxw
dWJsaWMvbWVtb3J5Lmg+DQo+ID4NCj4gPiArZXh0ZXJuIHBhZGRyX3QgbWVtX2hvdHBsdWc7DQo+
ID4gKw0KPiA+ICBzdHJ1Y3QgcGFnZV9pbmZvOw0KPiA+DQo+ID4gIHZvaWQgcHV0X3BhZ2Uoc3Ry
dWN0IHBhZ2VfaW5mbyAqKTsNCj4gDQo+IEknbSBzb3JyeSwgYnV0IEkgZ3Vlc3MgdGhpcyBtYXkg
Z28gYWJvdXQgYW55d2hlcmUgaW4gdGhlIGZpbGUsIGJ1dCBub3QNCj4gcmlnaHQgYXQgdGhlIHRv
cC4gSSB3b3VsZCBwcm9iYWJseSBoYXZlIHB1dCBpdCBhaGVhZCBvZiBucGZlY19raW5kX3QNCj4g
b3IgcmlnaHQgYWZ0ZXIgZG9tX2Nvdy4NCg0KT2ssIEkgd2lsbCBtb3ZlIHRoZSBwbGFjZSBvZiBp
dC4NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0KPiANCj4gSmFuDQo=

