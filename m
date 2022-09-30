Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C45F0C0C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 14:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414207.658368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFUg-0003pw-0L; Fri, 30 Sep 2022 12:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414207.658368; Fri, 30 Sep 2022 12:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFUf-0003n0-Tk; Fri, 30 Sep 2022 12:51:53 +0000
Received: by outflank-mailman (input) for mailman id 414207;
 Fri, 30 Sep 2022 12:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrHG=2B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oeFUf-0003mu-1H
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 12:51:53 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20049.outbound.protection.outlook.com [40.107.2.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a71445b9-40be-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 14:51:52 +0200 (CEST)
Received: from AS9PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:20b:488::13)
 by DBBPR08MB6315.eurprd08.prod.outlook.com (2603:10a6:10:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 12:51:36 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::a8) by AS9PR05CA0023.outlook.office365.com
 (2603:10a6:20b:488::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Fri, 30 Sep 2022 12:51:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 12:51:35 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Fri, 30 Sep 2022 12:51:35 +0000
Received: from 07e9c60d7ce5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3189B6B-B52A-48B7-AB16-1B9ABD5ECD67.1; 
 Fri, 30 Sep 2022 12:51:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07e9c60d7ce5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 12:51:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6427.eurprd08.prod.outlook.com (2603:10a6:10:25a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 12:51:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 12:51:22 +0000
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
X-Inumbo-ID: a71445b9-40be-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bpURE/B+Behnan9NxmICtJt9sFmPgtdY0Nn55r92OJfTFCZ9RfWGZgXkE4Hbsf4LNVaiKAz/kDkdIrCZ3Wbec3QxYeSCD/vJ1d5UDQEAdqihJyHj9SPWhXO4Np8Xe9JVvfZz9dTGU3jx7ui9M+gRNqofSW2w+/YoKCejoU0I+kSIaxFMYwFJaG2qgRC9Uu7EDb49Aj/lzS6S5eI7kPnFMpqgM74wXrZYIABSrr1G6fQ9CyCMLDDpZFKC2PGG69+JvzZPF1XA0PRz7+l35XXmYZLAFMbpY8N6/P9o1QVlqqZs6H7NUeoxYHqI6fBHhbaWQIfkHUTRxkInEhP6wFau+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21iZ/I1t58/hVVNe+uIVrGyzT/3xrRxSHAag3wNb6pA=;
 b=kxJ0d+UXzG+W8d4xFQh7wy90AVCQyhnYVIczmQ7OraVsOWXYpBobVvj66xHSAOTgeekoR/LxyLMHpCaf47vs59HnkZbmaUMtFdVAdGzmEa7j/Xp6N6MBU5A6+RG2QJqhnxeBbpzT2mSlFPjLMNhamrfZO46dnapVkl5xSe45uXX5t21ZNDefIW3+7Ej4CEXUc4fuSgN3uGjGq7+ZQO6M6luDzzdG79V4yEZh35RvhGCUnOJBd1HENAtc+GoYDDm4KeT1+2psQGvlzqCxUdPAFAkdd6i1X0IOd57g5ou0NZd8QQ3vvX+wOlpzQuQ0iI/YbEvgbRKiBLqcfQFPeGDR5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21iZ/I1t58/hVVNe+uIVrGyzT/3xrRxSHAag3wNb6pA=;
 b=GSiAWYZJY5Bx+JxaRkjUnaeOsESmCpQ0RAAIF1puNk/C3AMVqzR3EonYonwo+0IE5GeAteFUwXFhhNcdegNFfOs1qSljMpwaaAmEsFpnMBVT8gw4mka43VkAKXCk9ATOWMEYIYiyjUFLPGZVtWLCTp9jfzB8ZPPBSooJG+FC+Yw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 666b24c32a37d632
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB3z5E8TLM7SJYakQzQmjlnObOSWaQq6mI4i3Dwm2eFxxtMJOPaecTytIOsPz178GLjQs5vlhOyPaWCFqGlGiwUvnsJcITsUtG81S+mSjgcxFco0Nt9mMIm6Qc4HJv7MqRn/bYdK53mUZusZfwqEnQ2B3pTv4OiBRERm5g8Zkl46U137tc6QOazdQOJ+DZ3v1SaruUN2anWOC+/7/L2ja4D1ifvjUboIrWlgPSSNZh6jMxMsabUGMKt+Xv7jh5ZqXJx1yRlIWxxat1jIcPRU7FghXinvNhiUhidfGVCVYn4veCXo2O+RK/KgoGaOpedGJHkP1l7pwspVNqXPIDNuxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21iZ/I1t58/hVVNe+uIVrGyzT/3xrRxSHAag3wNb6pA=;
 b=DGKl3BlVT5Ioajp6ASi8aWKi9a4ARWv6UcIjs/IbImq4hkDGfRcllzOHjNVTSYI7TsfnNTiWpfJWRkfGZixPfOEQhPcBfifQ6Xxbc5fmyb3UNpqMxhNI8wR70SChoDAcxiQwyuVWzFXi9e2RjNRQKGVonOPQaaD0yQcC0pGvmlI1Yg9+3P/8jh5k5K3u0UMXuD6bMkkzou9kgyHJ2UoN/owTgTbheH3MhlCkPflgmC+4krODqWUOiejRDL0zSTKJCW5XRgFXSdpaEEih68IzmQe8aJHE/BNLmPRLNiO8Nl8JF17PoR36DExv69qMcAi7mmi6zcJfi+vwj0XURIXXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21iZ/I1t58/hVVNe+uIVrGyzT/3xrRxSHAag3wNb6pA=;
 b=GSiAWYZJY5Bx+JxaRkjUnaeOsESmCpQ0RAAIF1puNk/C3AMVqzR3EonYonwo+0IE5GeAteFUwXFhhNcdegNFfOs1qSljMpwaaAmEsFpnMBVT8gw4mka43VkAKXCk9ATOWMEYIYiyjUFLPGZVtWLCTp9jfzB8ZPPBSooJG+FC+Yw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Thread-Topic: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Thread-Index: AQHY1KFdAull5ChokkeaXft6EPXQra337WuA
Date: Fri, 30 Sep 2022 12:51:22 +0000
Message-ID: <9C12552C-0A64-433D-9F0C-5672281DD45D@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
In-Reply-To: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6427:EE_|VE1EUR03FT018:EE_|DBBPR08MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfe1840-c066-4667-2f36-08daa2e28243
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XKLP/RbFK2ETrgyutLeLQmwUWvFAtyZ+YkuPN34oB7vgpf4Q+CGnpqHhVtcgd1nMwWKfsLrhlvi5pA5mTfWskf0sP3afF9CiFEnjMAcJLCN07XmtILPSMt3b+QFDVqYuslLO2aXqMURXObSd6j7IkxCFsFNIgpJAtHVNryVpP7DdCNQHjzpSqPf1l75F1Mm4ZqLPJbXUNoBeQdTa8Ekl6RysqOw3Vi5XLImGaTSC7ay613yhMevPKqmLJlvyxiQcHB2PsCcHDQaNoROWvl0PhBM0bic5qRO3McPZNXcEK2J0gF8wX6EL07p52chd/nQLP4fL4l+V8JdNWqlSU4/LxM449mo4IX4NYBr+5XDm8cjZb3SMmqkg4OhVg4v+w8OgTjqwQGbM8aZP6hyADGc7QmrhxrjmYMz4pzsLYFEFP+yr9xvPcenRdJbfJICfIw+4netw7VlKZhqL7s5EIVjN2y9Su02mw7kVm9tDVnqoVC/fJnHhObCRKvQ+rJ2kPcrK6YvP/7gAyQGwfdUi578goKmrj4bFeqPn3syKS9ayePDWV9UTQknCrn+u3dgWLI4zRisoGQFul8f8Dgu0ijPeXsi3ejRaNVse+FD6i3wc4CcrDNaZ31Y3hll1zgrLoT8oyNV66967dSlw2Rxi8J1uhSpeNw0+GXyy4ufzqBrgt19t6qgh9n3Gfkug2mvUEiB5O8s9WMHOu3a7m7BXYfMmlq0lPPzvaX4zfBxUZuWEXnd72qyOc7O9gBW133NiUeYSN7a8yImq7uRNzLaAO6SsCrmMbNB8fvXqLS/h9hteHMg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(36756003)(53546011)(6506007)(8936002)(6512007)(26005)(54906003)(8676002)(6916009)(86362001)(5660300002)(71200400001)(316002)(478600001)(6486002)(33656002)(2906002)(83380400001)(91956017)(38070700005)(76116006)(2616005)(41300700001)(38100700002)(122000001)(66476007)(66556008)(66946007)(4326008)(186003)(64756008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <99A4B43BC6A4ED49A72EF5DE87C65946@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6427
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e76967d3-b2e5-4f51-e491-08daa2e27a39
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xgrKJWTo2iaqp85gUwFewa+Tf202pU88lzrY+3qyFKzxFUc98VcDv+cweyTl9AFBQPUS32Y+88goUHcBplUC60h5q12ef1Gi0P8XSh59jXvT7nADZnp4CpfL7/+vb8G7TzvA13FYRuFo3SXKfzSpZFyeJ8kM7Iuyc7dsqYdMets5c8umaeMHc2UjL1fc5JtlNU0l8UBOASFuT0Hysq4xSu7E/0NCOBXc4wmrMM6MZxG1/Wveuk/Au//7erTzUaQPC+F+AkwZkG0qTed3LoJ44y8P8UicZWFBupo46RU9oXOI9k5fyZ4Lc/iNBOxVLmi6B43J8Xo9z1U8Vh/P+nGFrtxU3igDLsW1rgvlCFfHejS8mguRCPgUyJnX8O7906Doolceg0NqMP4Iby2tk90jm3hSR74i7fdygZ+IyIoHDh5ME8SDTh5u4WegW4bSqteKE/wLLTCKyrh2Wm/LYiIoAgBbKyJA26/8tIqS1zZIvG3/iPyT16sjYvb+BJhCNWAHkX0JQ7RmaSOzV/xZJCvS0D1CIjTYKQhRu0l4XYGlrOzQ5JRRE5iwfuE9wTUakc+M/Yh2bLwfWxbS4lBgqeP9FBSNDfucvDKDXk687OknwljS/1ELDWy4jWDmUhxc081Fsu0pMtadEnDNX+VPA3Y+qG9Viic+sVWh2o5XDKYHQUkI4x52XzIAN0txnVkQvs5PdU5Ahromug3/yFetnv9Lsj64DKMYppx8jw6NzYXMrfMivp58nQ1knr4WRjvo+2Tdfbiv2XUvzd+upo3p1KCQUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(6862004)(8936002)(82310400005)(36756003)(5660300002)(41300700001)(4326008)(8676002)(40460700003)(83380400001)(47076005)(53546011)(40480700001)(186003)(336012)(33656002)(70586007)(86362001)(316002)(70206006)(54906003)(2906002)(478600001)(81166007)(356005)(36860700001)(82740400003)(6486002)(6512007)(26005)(2616005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 12:51:35.7002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfe1840-c066-4667-2f36-08daa2e28243
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6315

Hi Jan,

> On 30 Sep 2022, at 09:50, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> higher priority than the type of the range. To avoid accessing memory at
> runtime which was re-used for other purposes, make
> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> E820_ACPI memory there and hence that type's handling can be left alone.
>=20
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> Fixes: facac0af87ef ("x86-64: EFI runtime code")
> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm

Cheers
Bertrand

> ---
> Partly RFC for Arm, for two reasons:
>=20
> On Arm I question the conversion of EfiACPIReclaimMemory, in two ways:
> For one like on x86 such ranges would likely better be retained, as Dom0
> may (will?) have a need to look at tables placed there. Plus converting
> such ranges to RAM even if EFI_MEMORY_WB is not set looks suspicious to
> me as well. I'd be inclined to make the latter adjustment right here
> (while the other change probably would better be separate, if there
> aren't actually reasons for the present behavior).
>=20
> On Arm efi_init_memory() is compiled out, so adjusting Arm code here is
> perhaps more for consistency (not leaving a trap for someone to later
> fall into) than a strict requirement. I wonder though how Arm has
> managed to get away without at least some parts of efi_init_memory() for
> all the years that ACPI support has been present there. I guess this is
> connected to most of runtime.c also being compiled out, but that
> continuing to be the case is another aspect puzzling me.
>=20
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -183,13 +183,15 @@ static EFI_STATUS __init efi_process_mem
>=20
>     for ( Index =3D 0; Index < (mmap_size / desc_size); Index++ )
>     {
> -        if ( desc_ptr->Attribute & EFI_MEMORY_WB &&
> -             (desc_ptr->Type =3D=3D EfiConventionalMemory ||
> -              desc_ptr->Type =3D=3D EfiLoaderCode ||
> -              desc_ptr->Type =3D=3D EfiLoaderData ||
> -              (!map_bs &&
> -               (desc_ptr->Type =3D=3D EfiBootServicesCode ||
> -                desc_ptr->Type =3D=3D EfiBootServicesData))) )
> +        if ( desc_ptr->Attribute & EFI_MEMORY_RUNTIME )
> +            /* nothing */;
> +        else if ( (desc_ptr->Attribute & EFI_MEMORY_WB) &&
> +                  (desc_ptr->Type =3D=3D EfiConventionalMemory ||
> +                   desc_ptr->Type =3D=3D EfiLoaderCode ||
> +                   desc_ptr->Type =3D=3D EfiLoaderData ||
> +                   (!map_bs &&
> +                    (desc_ptr->Type =3D=3D EfiBootServicesCode ||
> +                     desc_ptr->Type =3D=3D EfiBootServicesData))) )
>         {
>             if ( !meminfo_add_bank(&bootinfo.mem, desc_ptr) )
>             {
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -185,7 +185,9 @@ static void __init efi_arch_process_memo
>             /* fall through */
>         case EfiLoaderCode:
>         case EfiLoaderData:
> -            if ( desc->Attribute & EFI_MEMORY_WB )
> +            if ( desc->Attribute & EFI_MEMORY_RUNTIME )
> +                type =3D E820_RESERVED;
> +            else if ( desc->Attribute & EFI_MEMORY_WB )
>                 type =3D E820_RAM;
>             else
>         case EfiUnusableMemory:


