Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969958DB0B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 17:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383010.618098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLR41-0005q9-DI; Tue, 09 Aug 2022 15:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383010.618098; Tue, 09 Aug 2022 15:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLR41-0005oM-AF; Tue, 09 Aug 2022 15:22:37 +0000
Received: by outflank-mailman (input) for mailman id 383010;
 Tue, 09 Aug 2022 15:22:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEZx=YN=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oLR3z-0005oG-Oo
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 15:22:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80059.outbound.protection.outlook.com [40.107.8.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 175cba18-17f7-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 17:22:34 +0200 (CEST)
Received: from FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::19)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 15:22:31 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::7c) by FR3P281CA0135.outlook.office365.com
 (2603:10a6:d10:94::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.7 via Frontend
 Transport; Tue, 9 Aug 2022 15:22:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 15:22:30 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Tue, 09 Aug 2022 15:22:30 +0000
Received: from 7bd232136c39.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37632C01-843C-4299-A70A-D0BCCD15FB54.1; 
 Tue, 09 Aug 2022 15:22:18 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7bd232136c39.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Aug 2022 15:22:18 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS1PR08MB7610.eurprd08.prod.outlook.com (2603:10a6:20b:475::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 15:22:15 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 15:22:15 +0000
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
X-Inumbo-ID: 175cba18-17f7-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iZjPXbBtEXWOhYM0ZhLxc5O2Q7lxSKPvG5VY9bVPi1FPTirNXOWkL1kx21C56KK1ePE5pfQLKNEBfvqA5tQGiiMGS9xeklhxbhJKrVYT3F9B/D5WKbtSboEl/diOoe11z4TLQM33o34cuTjeykjMTayqzFmiK/5cqURQ/yewCmcpAr7f5prbwEEbRjzctcUEGs4ApW3f/u+fA34L4h2rLtkfkuHNZqa4YWZYKEeQ+a4G8HFJE1vUhb93eDXZVk8wxIqvXaP/REB/DgB+qLCpcoobSNBltYzC9e+tLeMzKSepo/xKruot6Rvy5MXEsv55A7T/Py+aD83x9ML2uzjB2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKiyMQZmH1ue12GWdoANJx1MtXUAu20XJJARPdqamKg=;
 b=IKNIe2uH79Rt326WgqeAspMh/1HZoOlEy5yc9Tq0ZWmxJzf1hZ2HIMHkezXWtxuWGgBvMWRVkXWXpuUj+BB0Tcbmku6OSJtiOUFkDAqu3nCyrLMJ896eKd+HPlb5mkQ/8QPsxQVx/TcmutiYyWnVh8/f3lAHt7f/a50zeGjBWDpaBMmcltk9+u8N8EWgrm+T4xYfC3dTz5ywZNNyJhFJ3OqODJqDWUJ4IwWALcfzDS0DQ1MkvobFgsxXZkKlBS+b5zM0MtQCHn8buwgL4/ccGp2nV9D9p5UdAhaFukqg0EnFd1ffBpdR7lj9fOVVt2qUINfvV0c5fo9fkIhX6/XOvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKiyMQZmH1ue12GWdoANJx1MtXUAu20XJJARPdqamKg=;
 b=fHRwtCccM+EZX+eWH8///W1Q68zlwcvuz2NeRqCj9QJzcy3+W7QsuUvx7VnEpiNEFkB6LRIHH6AZp+ak435SuWWxqlmL12Jcq97SrGzUhPIs7C/YQaV+QjFMLAe4SaZ28kbrFQIAXmEOQCJ5J2g9mMO71t00ORp0+pyUk5hcKkI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff585f82a6814432
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjjVmO/I8xJdRI9xV5pxbNjGF50gd3DUJwAt69iIWRsnTsC44px4Wzp/QYd+ggnPtIwpwoBb/0h775TazSxc4VRy/+gepd5b9d0vuMuzrqEB0PqcIH3UCeooOqpC1yyEze15ZRTG3BVorbLmqyyk2DnbwWB8J0B/BCFFGFJ6vWmZYIInFhXvUijQ+iBGqm+geAO/7rlb94WLce9pW4/iyxlrMnoVK97H5IefTgl4PEjT/eG4ec3Jx4nlPHGNbMMuaMEFW+kM28x21H7r0amV+sueVRB5bZebiR5OK3rVS01BD1bDki2kC9z67Ht9hukK2J0yf2V+1zPa+UUXcHbBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKiyMQZmH1ue12GWdoANJx1MtXUAu20XJJARPdqamKg=;
 b=SXmGPeVOWhggQd6gT+V6fMXpYtISUyTj7DDnnOc3TEeI1SXj4VCIojg17g/WK/0OO54FmBVd+2qhg85OOB7wMIXZUFygvG5FRAvGGYA+/+d1JuzqE7DYsH9LM+s46ihMvxIIKtQlx5NWZd/cDRWPgKQMnRqY3a0MowuXNtpMbRb2026P8051UL7h8h0hb62Is7Jb9Y95MApJyjpoNtb60H2TDIA+aRfichGKAAju/Swi80dEf0Z0Akna4ASYLq3HmZV6H/bE1RjOd4u8aTMiUuFQ8JJf6YWvKp4qXImoQYFLsT/Ix+vOvSu63wtEBzND/wySHGYwPEc6I+pkDyxx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKiyMQZmH1ue12GWdoANJx1MtXUAu20XJJARPdqamKg=;
 b=fHRwtCccM+EZX+eWH8///W1Q68zlwcvuz2NeRqCj9QJzcy3+W7QsuUvx7VnEpiNEFkB6LRIHH6AZp+ak435SuWWxqlmL12Jcq97SrGzUhPIs7C/YQaV+QjFMLAe4SaZ28kbrFQIAXmEOQCJ5J2g9mMO71t00ORp0+pyUk5hcKkI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] xen/pci: replace call to is_memory_hole to pci_check_bar
Thread-Topic: [PATCH] xen/pci: replace call to is_memory_hole to pci_check_bar
Thread-Index: AQHYqOJykksEC+xLCUihSPiXurK3kK2lJb0AgAGQGQA=
Date: Tue, 9 Aug 2022 15:22:15 +0000
Message-ID: <43039C71-D661-4C8D-A132-9E020D0D1013@arm.com>
References:
 <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <d5590d91683f2dddb3836b1afb444f30c2f5a7fb.1659713855.git.rahul.singh@arm.com>
 <5e762a42-d0d5-86be-e3cd-64bde82c8b47@gmail.com>
In-Reply-To: <5e762a42-d0d5-86be-e3cd-64bde82c8b47@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6427c48a-242a-4d27-e492-08da7a1af9f6
x-ms-traffictypediagnostic:
	AS1PR08MB7610:EE_|VE1EUR03FT060:EE_|AM6PR08MB4278:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6dCXPs1E3HdJ/XbN+U8pdoFgrn2/dUbbetlF3RPSe7SGcIPpz5moIoIbUye3YRVtSEnZ42qO9jipPOE7Lv7bbAFafh9CauTQ1SqihkrAAZCed8/JqSgZ6FpFBvEjbYviNbi321SMuA3oWNJvYnWRmXDTV9rF5pqrItHG+LLtAjwYBqQPj0ThdP3U5dHUP6fyJ+uEb3Ksi3zS5IgTUN7XkbbHJOACizp0un10Ypiz4rvumW/2A17U+w0Qc00hUfiLx5EOri6UGeVVXHYI47dHuS59UcsusVJiE9sXpu8sRvLuD27OeWc95dGbiIpaFOPGYEroM0NK76dJ6WlV4lwDX9bBe7e1vc2XXKuUTgddLKaZx2USCyjHVU3szSllowDvbcFvGrC2Z4sGXMrWlbe4PkTTS7tjdAmUnV57AI6434CvmEPrdBbmXxb6CtHxwy3I6/grXhZfb/PvkccBUybKeVi7lz1WeP1yma8ryIZsYTy44lIpfNvOvTc72s7+fPXrUPUjlKxhubf991BdXQpLSCXGUhhJNhdsN7+lawSgIHcFyFq89r2Mke+8Q8fnad1dyCxnhnAQ6paSdWgoCfIAUy7dfqElA3kL9iZbdJ3A63J2ZQEvKeGlZpEuY60ivnZ3p3KJbkonnN1jBMPPdF51zb6ZgGQclgzdW6h5E5j+ZzCNBGAXCeXaUf/JST315HWBTmQGmYigDF++QN5p0ITzt+4Oh5w8GGT5UVQ90tOPMMxs+KgIHibfQuLYecVtn782GGnKjb55Dx/b1xwZPWyxOXorT432ADtDgL3pY2LyK7zOxETqVunT2bTf52iphU0I7EfqAOsgkboSjcbN6uob0KMknHOJdkck1kfUIPo/B0Bn4kx9eldjKGNXy7epig6N
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(2906002)(38070700005)(41300700001)(26005)(83380400001)(53546011)(6506007)(6512007)(2616005)(38100700002)(122000001)(6486002)(478600001)(33656002)(966005)(91956017)(8676002)(4326008)(71200400001)(36756003)(8936002)(66556008)(66446008)(66476007)(76116006)(186003)(64756008)(86362001)(316002)(66946007)(54906003)(6916009)(7416002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D52F4C825D2CC479FD62B4CC7C425AB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7610
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	acd90479-6034-4aa8-bd1e-08da7a1af0ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a1g3ZcQ522zQ/OjKF6U93/lFAJGzuBXLPcs4qLx7A/slHi6Cr7FBi0J6m23MGYobQ/4YZ6tviRH5/jJ3PEH91DQVyxL+EByESQp82twlA21Q48dLDHmcUU0MJ47Osja+dT6fVJnsO7vGHemWLMUbmTZX8nNDlrSpw9+SPOeTWuCmhU6Owxx2Oq/MJ5tO4PSBGhAHesxGtr7QbPkeeBXhZoZi3LmJ067AYXX3iuWKFwLel8/0u/jayAnqM6vHqnpvq5WlPnSHnkqQMkiYGARUb70mvS3ROCRSaRF3R1BYYPluosMC4+AblZePDeU5m/Mj8L7QrxlA1bnKRQnSpMfcu/QZGlqhAqe4J/ududcZAui9b7CN9PhcLuSuavFAhAhFrm6P6rayrphHZ59WCovJXR+r+CTDy9j5o9Qcz8Mv/ciKZwVHNsr/0aLK4cqRukPK7vhbs/H1Y/K8w+v++EiT7t07EKVrXS6fk3yZ437ZNfH3F+WC/tg0K4IcXXY6pC9QDHTtimIilLi3UN+9D3PGMqj146G3nBgMspJoqmAQMAgnpiwh3a7zVNADe4+duTuMl5EC75glAeXOFiUK5NXcOBACaQ5Mok8OKNLDAzpKc/m/cu3/xy6HBkH+Y6b8q7+677CkAvLfcFwWOo4tuLzFGH+0b+lTxGShzFJxhtVQ3tL86bsdpxcYdyoBfJCNiAnmWaSXCiccO3ipUyoRJXHvgTkVVeh3RGzjSY2zWxjct5OsShDIRqDvK88nhAbWQ84Jd34bKOMAhuAwcHM2gCDCmrMP7wPUXAnFjdyLALcPY40rP1zE4qUDTMuyNC/jusCcPTslsGjamHbJ8JIGpGFmQQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(40470700004)(46966006)(36840700001)(41300700001)(8936002)(5660300002)(6862004)(86362001)(40460700003)(54906003)(966005)(70206006)(70586007)(4326008)(6486002)(316002)(478600001)(8676002)(83380400001)(36756003)(6512007)(47076005)(26005)(40480700001)(186003)(336012)(2616005)(36860700001)(356005)(33656002)(82740400003)(81166007)(82310400005)(2906002)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:22:30.6279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6427c48a-242a-4d27-e492-08da7a1af9f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278

SGkgT2xla3NhbmRyLA0KDQoNCj4gT24gOCBBdWcgMjAyMiwgYXQgNDozMCBwbSwgT2xla3NhbmRy
IDxvbGVrc3R5c2hAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBPbiAwNS4wOC4yMiAxODo0
MywgUmFodWwgU2luZ2ggd3JvdGU6DQo+IA0KPiANCj4gSGVsbG8gUmFodWwNCj4gDQo+IA0KPiBU
aGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGF0IHBhdGNoIQ0KPiANCj4gDQo+PiBGcm9tOiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+
IA0KPiBJIGFtIG5vdCAxMDAlIHN1cmUgcmVnYXJkaW5nIHRoYXQuIFRoaXMgaXMgKmNvbXBsZXRl
bHkqIGRpZmZlcmVudCBwYXRjaCBmcm9tIHdoYXQgT2xla3NhbmRyIGluaXRpYWxseSBtYWRlIGhl
cmU6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMjA3MTkxNzQy
NTMuNTQxOTY1LTItb2xla3N0eXNoQGdtYWlsLmNvbS8NCj4gDQo+IENvcHkgYmVsb3cgZm9yIHRo
ZSBjb252ZW5pZW5jZToNCj4gDQo+IA0KPiArYm9vbCBpc19tZW1vcnlfaG9sZShtZm5fdCBzdGFy
dCwgbWZuX3QgZW5kKQ0KPiArew0KPiArICAgIC8qIFRPRE86IHRoaXMgbmVlZHMgdG8gYmUgcHJv
cGVybHkgaW1wbGVtZW50ZWQuICovDQo+ICsgICAgcmV0dXJuIHRydWU7DQo+ICt9DQo+IA0KPiAN
Cj4gDQo+IA0KPiBQYXRjaCBsb29rcyBnb29kLCBqdXN0IGEgY291cGxlIG9mIG1pbm9yIGNvbW1l
bnRzL25pdHMuDQoNCk9rLiBJIHdpbGwgcmVtb3ZlIOKAnEZyb206IOKApiDigJwgaW4gbmV4dCB2
ZXJzaW9uLg0KPiANCj4+IA0KPj4gaXNfbWVtb3J5X2hvbGUgd2FzIGltcGxlbWVudGVkIGZvciB4
ODYgYW5kIG5vdCBmb3IgQVJNIHdoZW4gaW50cm9kdWNlZC4NCj4+IFJlcGxhY2UgaXNfbWVtb3J5
X2hvbGUgY2FsbCB0byBwY2lfY2hlY2tfYmFyIGFzIGZ1bmN0aW9uIHNob3VsZCBjaGVjaw0KPj4g
aWYgZGV2aWNlIEJBUiBpcyBpbiBkZWZpbmVkIG1lbW9yeSByYW5nZS4gQWxzbywgYWRkIGFuIGlt
cGxlbWVudGF0aW9uDQo+PiBmb3IgQVJNIHdoaWNoIGlzIHJlcXVpcmVkIGZvciBQQ0kgcGFzc3Ro
cm91Z2guDQo+PiANCj4+IE9uIHg4NiwgcGNpX2NoZWNrX2JhciB3aWxsIGNhbGwgaXNfbWVtb3J5
X2hvbGUgd2hpY2ggd2lsbCBjaGVjayBpZiBCQVINCj4+IGlzIG5vdCBvdmVybGFwcGluZyB3aXRo
IGFueSBtZW1vcnkgcmVnaW9uIGRlZmluZWQgaW4gdGhlIG1lbW9yeSBtYXAuDQo+PiANCj4+IE9u
IEFSTSwgcGNpX2NoZWNrX2JhciB3aWxsIGdvIHRocm91Z2ggdGhlIGhvc3QgYnJpZGdlIHJhbmdl
cyBhbmQgY2hlY2sNCj4+IGlmIHRoZSBCQVIgaXMgaW4gdGhlIHJhbmdlIG9mIGRlZmluZWQgcmFu
Z2VzLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJt
LmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wY2kuaCAgICAgfCAx
MiArKysrKysrKysrDQo+PiAgeGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYyB8IDM1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wY2kuaCAgICAgfCAxMCArKysrKysrKysNCj4+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYyAgICAgIHwgIDggKysrLS0tLQ0KPj4gIDQgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9wY2kuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wY2kuaA0KPj4g
aW5kZXggN2M3NDQ5ZDY0Zi4uNWM0YWIyYzRkYyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9wY2kuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Bj
aS5oDQo+PiBAQCAtOTEsNiArOTEsMTYgQEAgc3RydWN0IHBjaV9lY2FtX29wcyB7DQo+PiAgICAg
IGludCAoKmluaXQpKHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyAqKTsNCj4+ICB9Ow0KPj4gICsv
Kg0KPj4gKyAqIHN0cnVjdCB0byBob2xkIHBjaSBkZXZpY2UgYmFyLg0KPj4gKyAqLw0KPj4gK3N0
cnVjdCBwZGV2X2Jhcg0KPj4gK3sNCj4+ICsgICAgbWZuX3Qgc3RhcnQ7DQo+PiArICAgIG1mbl90
IGVuZDsNCj4+ICsgICAgYm9vbCBpc192YWxpZDsNCj4+ICt9Ow0KPiANCj4gDQo+IE5pdDogVGhp
cyBpcyBvbmx5IHVzZWQgYnkgcGNpLWhvc3QtY29tbW9uLmMsIHNvIEkgdGhpbmsgaXQgY291bGQg
YmUgZGVjbGFyZWQgdGhlcmUuDQoNCkFjay4NCj4gDQo+IA0KPiANCj4+ICsNCj4+ICAvKiBEZWZh
dWx0IEVDQU0gb3BzICovDQo+PiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBwY2lfZWNhbV9vcHMgcGNp
X2dlbmVyaWNfZWNhbV9vcHM7DQo+PiAgQEAgLTEyNSw2ICsxMzUsOCBAQCBpbnQgcGNpX2hvc3Rf
aXRlcmF0ZV9icmlkZ2VzX2FuZF9jb3VudChzdHJ1Y3QgZG9tYWluICpkLA0KPj4gICAgaW50IHBj
aV9ob3N0X2JyaWRnZV9tYXBwaW5ncyhzdHJ1Y3QgZG9tYWluICpkKTsNCj4+ICArYm9vbCBwY2lf
Y2hlY2tfYmFyKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBtZm5fdCBzdGFydCwgbWZuX3Qg
ZW5kKTsNCj4+ICsNCj4+ICAjZWxzZSAgIC8qIUNPTkZJR19IQVNfUENJKi8NCj4+ICAgIHN0cnVj
dCBhcmNoX3BjaV9kZXYgeyB9Ow0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvcGNp
LWhvc3QtY29tbW9uLmMgYi94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiBp
bmRleCBmZDhjMGY4MzdhLi44ZWExYWFlZWNlIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJt
L3BjaS9wY2ktaG9zdC1jb21tb24uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9z
dC1jb21tb24uYw0KPj4gQEAgLTM2Myw2ICszNjMsNDEgQEAgaW50IF9faW5pdCBwY2lfaG9zdF9i
cmlkZ2VfbWFwcGluZ3Moc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICAgcmV0dXJuIDA7DQo+PiAg
fQ0KPj4gICtzdGF0aWMgaW50IGlzX2Jhcl92YWxpZChjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUgKmRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICB1NjQgYWRkciwgdTY0IGxlbiwg
dm9pZCAqZGF0YSkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBwZGV2X2JhciAqYmFyX2RhdGEgPSBk
YXRhOw0KPj4gKyAgICB1bnNpZ25lZCBsb25nIHMgPSBtZm5feChiYXJfZGF0YS0+c3RhcnQpOw0K
Pj4gKyAgICB1bnNpZ25lZCBsb25nIGUgPSBtZm5feChiYXJfZGF0YS0+ZW5kKTsNCj4+ICsNCj4+
ICsgICAgaWYgKCAocyA8IGUpICYmIChzID49IFBGTl9ET1dOKGFkZHIpKSAmJiAoZTw9IFBGTl9E
T1dOKGFkZHIgKyBsZW4gLSAxKSkgKQ0KPiANCj4gDQo+IE5pdDogd2hpdGUgc3BhY2UgYWZ0ZXIg
J2UnIGlzIG1pc3NlZCBpbiB0aGUgbGFzdCBwYXJ0IG9mIHRoZSBjaGVjaw0KDQpBY2suDQoNCj4g
DQo+IA0KPj4gKyAgICAgICAgYmFyX2RhdGEtPmlzX3ZhbGlkID0gIHRydWU7DQo+PiArDQo+PiAr
ICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtib29sIHBjaV9jaGVja19iYXIoY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYsIG1mbl90IHN0YXJ0LCBtZm5fdCBlbmQpDQo+PiArew0KPj4g
KyAgICBpbnQgcmV0Ow0KPj4gKyAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmR0X25vZGU7DQo+
PiArICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IChzdHJ1Y3QgZGV2aWNlICopcGNpX3RvX2Rldihw
ZGV2KTsNCj4gDQo+IA0KPiBUaGUgY2FzdCBpcyBwcmVzZW50IGhlcmUgYmVjYXVzZSBvZiB0aGUg
Y29uc3Q/DQoNClllcyB5b3UgYXJlIHJpZ2h0LCBjYXN0IGlzIGJlY2F1c2Ugb2YgdGhlIGNvbnN0
Lg0KPiANCj4gSSB3b3VsZCBjb25zaWRlciBwYXNzaW5nICJjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldiIgaW5zdGVhZCBvZiAic3RydWN0IGRldmljZSAqZGV2IiB0byBwY2lfZmluZF9ob3N0X2Jy
aWRnZV9ub2RlKCkgYW5kIGRyb3BwaW5nIGNvbnZlcnNpb24gKHBjaTwtPmRldikgaW4gYm90aCBm
dW5jdGlvbnMuDQoNClllcyBtYWtlIHNlbnNlLiBJIHdpbGwgZG8gdGhhdCBpbiBuZXh0IHZlcnNp
b24uDQo+IA0KPiANCj4gU29tZXRoaW5nIGxpa2UgYmVsb3cgKG5vdCB0ZXN0ZWQpOg0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wY2kuaCBiL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9wY2kuaA0KPiBpbmRleCA1YzRhYjJjNGRjLi5hMTdlZjMyMjUyIDEwMDY0
NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcGNpLmgNCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3BjaS5oDQo+IEBAIC0xMTYsNyArMTE2LDcgQEAgYm9vbCBwY2lf
ZWNhbV9uZWVkX3AybV9od2RvbV9tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJp
ZGdlLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGFk
ZHIpOw0KPiAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqcGNpX2ZpbmRfaG9zdF9icmlkZ2UodWlu
dDE2X3Qgc2VnbWVudCwgdWludDhfdCBidXMpOw0KPiAtc3RydWN0IGR0X2RldmljZV9ub2RlICpw
Y2lfZmluZF9ob3N0X2JyaWRnZV9ub2RlKHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ICtzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKnBjaV9maW5kX2hvc3RfYnJpZGdlX25vZGUoY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXYpOw0KPiAgaW50IHBjaV9nZXRfaG9zdF9icmlkZ2Vfc2VnbWVudChjb25zdCBz
dHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQxNl90ICpzZWdtZW50KTsNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21t
b24uYw0KPiBpbmRleCA4ZWExYWFlZWNlLi4zYTY0YTczNTBmIDEwMDY0NA0KPiAtLS0gYS94ZW4v
YXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9wY2kv
cGNpLWhvc3QtY29tbW9uLmMNCj4gQEAgLTI0MywxMCArMjQzLDkgQEAgZXJyX2V4aXQ6DQo+ICAv
Kg0KPiAgICogR2V0IGhvc3QgYnJpZGdlIG5vZGUgZ2l2ZW4gYSBkZXZpY2UgYXR0YWNoZWQgdG8g
aXQuDQo+ICAgKi8NCj4gLXN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqcGNpX2ZpbmRfaG9zdF9icmlk
Z2Vfbm9kZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICtzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKnBj
aV9maW5kX2hvc3RfYnJpZGdlX25vZGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICB7
DQo+ICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlOw0KPiAtICAgIHN0cnVjdCBw
Y2lfZGV2ICpwZGV2ID0gZGV2X3RvX3BjaShkZXYpOw0KPiANCj4gICAgICBicmlkZ2UgPSBwY2lf
ZmluZF9ob3N0X2JyaWRnZShwZGV2LT5zZWcsIHBkZXYtPmJ1cyk7DQo+ICAgICAgaWYgKCB1bmxp
a2VseSghYnJpZGdlKSApDQo+IEBAIC0zODAsMTQgKzM3OSwxMyBAQCBib29sIHBjaV9jaGVja19i
YXIoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIG1mbl90IHN0YXJ0LCBtZm5fdCBlbmQpDQo+
ICB7DQo+ICAgICAgaW50IHJldDsNCj4gICAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmR0X25v
ZGU7DQo+IC0gICAgc3RydWN0IGRldmljZSAqZGV2ID0gKHN0cnVjdCBkZXZpY2UgKilwY2lfdG9f
ZGV2KHBkZXYpOw0KPiAgICAgIHN0cnVjdCBwZGV2X2JhciBiYXJfZGF0YSA9ICB7DQo+ICAgICAg
ICAgIC5zdGFydCA9IHN0YXJ0LA0KPiAgICAgICAgICAuZW5kID0gZW5kLA0KPiAgICAgICAgICAu
aXNfdmFsaWQgPSBmYWxzZQ0KPiAgICAgIH07DQo+IA0KPiAtICAgIGR0X25vZGUgPSBwY2lfZmlu
ZF9ob3N0X2JyaWRnZV9ub2RlKGRldik7DQo+ICsgICAgZHRfbm9kZSA9IHBjaV9maW5kX2hvc3Rf
YnJpZGdlX25vZGUocGRldik7DQo+IA0KPiAgICAgIHJldCA9IGR0X2Zvcl9lYWNoX3JhbmdlKGR0
X25vZGUsICZpc19iYXJfdmFsaWQsICZiYXJfZGF0YSk7DQo+ICAgICAgaWYgKCByZXQgPCAwICkN
Cj4gDQo+IA0KPj4gKyAgICBzdHJ1Y3QgcGRldl9iYXIgYmFyX2RhdGEgPSAgew0KPj4gKyAgICAg
ICAgLnN0YXJ0ID0gc3RhcnQsDQo+PiArICAgICAgICAuZW5kID0gZW5kLA0KPj4gKyAgICAgICAg
LmlzX3ZhbGlkID0gZmFsc2UNCj4+ICsgICAgfTsNCj4+ICsNCj4+ICsgICAgZHRfbm9kZSA9IHBj
aV9maW5kX2hvc3RfYnJpZGdlX25vZGUoZGV2KTsNCj4gDQo+ICAgICBpZiAoICFkdF9ub2RlICkN
Cj4gICAgICAgICByZXR1cm4gZmFsc2U7DQoNCkFjay4gDQo+IA0KPiANCj4+ICsNCj4+ICsgICAg
cmV0ID0gZHRfZm9yX2VhY2hfcmFuZ2UoZHRfbm9kZSwgJmlzX2Jhcl92YWxpZCwgJmJhcl9kYXRh
KTsNCj4+ICsgICAgaWYgKCByZXQgPCAwICkNCj4+ICsgICAgICAgIHJldHVybiByZXQ7DQo+IA0K
PiBzL3JldHVybiByZXQ7L3JldHVybiBmYWxzZTsNCg0KQWNrLiANCj4gDQo+IA0KPj4gKw0KPj4g
KyAgICBpZiAoICFiYXJfZGF0YS5pc192YWxpZCApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7
DQo+PiArDQo+PiArICAgIHJldHVybiB0cnVlOw0KPj4gK30NCj4+ICAvKg0KPj4gICAqIExvY2Fs
IHZhcmlhYmxlczoNCj4+ICAgKiBtb2RlOiBDDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3BjaS5oIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BjaS5oDQo+PiBp
bmRleCBjOGUxYTllY2RiLi5mNGE1OGM4YWNmIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3BjaS5oDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGNp
LmgNCj4+IEBAIC01Nyw0ICs1NywxNCBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGlzX3Bj
aV9wYXNzdGhyb3VnaF9lbmFibGVkKHZvaWQpDQo+PiAgICB2b2lkIGFyY2hfcGNpX2luaXRfcGRl
dihzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+PiAgK3N0YXRpYyBpbmxpbmUgYm9vbCBwY2lfY2hl
Y2tfYmFyKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG1mbl90IHN0YXJ0LCBtZm5fdCBlbmQpDQo+PiArew0KPj4gKyAgICAv
Kg0KPj4gKyAgICAgKiBDaGVjayBpZiBCQVIgaXMgbm90IG92ZXJsYXBwaW5nIHdpdGggYW55IG1l
bW9yeSByZWdpb24gZGVmaW5lZA0KPj4gKyAgICAgKiBpbiB0aGUgbWVtb3J5IG1hcC4NCj4+ICsg
ICAgICovDQo+PiArICAgIHJldHVybiBpc19tZW1vcnlfaG9sZShzdGFydCwgZW5kKTsNCj4+ICt9
DQo+IA0KPiANCj4gTml0OiBJIHdvdWxkIHVzZSBzaW1wbGUgI2RlZmluZSBpbnN0ZWFkIG9mIHN0
YXRpYyBpbmxpbmUgaGVyZQ0KPiANCj4gQnV0IEkgYW0gbm90IDEwMCUgc3VyZSB0aGF0IHg4NiBt
YWludGFpbmVycyB3b3VsZCBiZSBoYXBweS4NCj4gDQoNCkphbiByZXBsaWVkIHRvIHRoaXMgYW5k
IEkgd2lsbCBjaGVjayB3aGF0IGlzIHN1Z2dlc3RlZCBieSBKYW4uDQoNClJlZ2FyZHMsDQpSYWh1
bA==

