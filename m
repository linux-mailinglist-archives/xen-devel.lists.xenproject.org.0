Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A62951F861
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 11:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324324.546306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnzyz-0004XP-0d; Mon, 09 May 2022 09:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324324.546306; Mon, 09 May 2022 09:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnzyy-0004Ul-SD; Mon, 09 May 2022 09:47:12 +0000
Received: by outflank-mailman (input) for mailman id 324324;
 Mon, 09 May 2022 09:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11oC=VR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nnzyx-0004Uf-JA
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 09:47:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe7b3bf5-cf7c-11ec-a406-831a346695d4;
 Mon, 09 May 2022 11:47:09 +0200 (CEST)
Received: from AM6PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:20b:b2::13)
 by AM6PR08MB3989.eurprd08.prod.outlook.com (2603:10a6:20b:b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 9 May
 2022 09:47:07 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::a9) by AM6PR08CA0001.outlook.office365.com
 (2603:10a6:20b:b2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18 via Frontend
 Transport; Mon, 9 May 2022 09:47:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 09:47:07 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Mon, 09 May 2022 09:47:06 +0000
Received: from efe468709104.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24A9F1B1-E78C-4897-88B5-B1DDD34ABEA1.1; 
 Mon, 09 May 2022 09:46:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id efe468709104.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 May 2022 09:46:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB4122.eurprd08.prod.outlook.com (2603:10a6:10:ac::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 09:46:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 09:46:56 +0000
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
X-Inumbo-ID: fe7b3bf5-cf7c-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hG4rjsWVRCyQeSzI38QBCj+6rnGLRI4MS7u/2L3cLxnYgdKPLoy/qoZmC0nRFdXkr3SsTeWwyknUmF08xwQztGtoya3RCsL1R4t3Aon8oS4nJT5qXzIrTzzcgvRFvGAI5pFwYfe7N1CzLGJTLEwPy31pgf/J6ghznswjWspO/9g3dkIAmHV/zDciEJrheGD583/Tldu2hnI8ukSRsExGFGTdtlvHlHg1l2GWDm4xtsKK5WOAdCsyzQQO/ZBgBPn/DB4pHgO5q5KzKqTP5pLORsR9n7MB7iIxBhwtlJm6FNfHYb0WSGGF1yD/WJTM7Wi7WWrUzbREBlw3b8D4GtOfvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYT1EqkJ3FLOiwWV9EZXmDjeaH5HDWuuXGwUQGzONGI=;
 b=KRVU8ySZ4tr+J71u+9B/TujbESsHfvzpeKRHUrzUb/Y/H8Ti7MajyuEiNNPeJLkOmxbABXkb91JqMApYr3GPwafx64puhEe7uZ7nnd62XWhpcUQX+jxVOK/nDb2TGGREJ+vqFShiqAmj53mpKpOuztlBL3Z67/WaTt/viJTrQPiA9Dsi5bhowo2TLbx0vOfpOXai+hm/jafTtngvf2C1rWqNgDuzdP4uBaTgFwGH3xSuf5m+611/wSzx06Q1B5IGlcEDYVTHi0pbYjqdPR5+ixSOb+6nf2WWZBJtwiAZeIKNbeHNX+vw6WkoHJvxdFs6Ob7k9vwdry1q2HWKuQvd9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYT1EqkJ3FLOiwWV9EZXmDjeaH5HDWuuXGwUQGzONGI=;
 b=DG7Va+kKu5RJsRmmd7IUhJxzdmmT5AWh8yfEcfwNKhZPwSHs22V3dqoamP8nktBgQBBD7GpgHelxFn8Wta5/FtM84k39vQGmbikGeMTDdULMZQDvV7MbjNn8qkoPE9FUrnNfJtziCQF1E2wJO2X0Gh7bdHCp/3Ihh/0DsNdosSg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d9e81029e671d8d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adWp9jXT4mDdrqKOIgBMoUKyaOPU6EwhSPUG/QJIXAr4QdrNsD7PHWVuPrk+W+Fh+8P82z6Mb6KuckEEzu5NIHVstBT4K3FlmQRYnICFM3Yu4d5I1/+59Am2IsrWZyAHiJg8Tb/augjTJUZqpHnWB/9nzrfjkCNhk382p7U80r8Pxjq+xaM9wDUpwCbAw0Z5rpDECqa2MOGrw3SwwL5VzlRDiTZJPJRWCpyE/fPsGekrJZ0E4K1CwKQUsmwqaffF9kTqzZocxJt6rIAdV2JNg2X5nJqIJNIO0zjHr4thUnnQB8N7imjswvQQLPuIBcKisHXUj/+jNP5ww3Ee3CpB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYT1EqkJ3FLOiwWV9EZXmDjeaH5HDWuuXGwUQGzONGI=;
 b=Pl0QfP4kavN2SSxARxuNYf6SyGQQg0HnCTeGhQJbaf7eSsrsIlaH+XahW1Kir233TYDAUHgg8GiJ6GPeJnFLKr8pmdwPXowTHg6GRIhufOQHfkWGAL8gmLM+PS7HHOpCXNHDjYJ7tAbXy/CaL5WfDmMBzXjL3lg73miadWfoP0MPnF2n0oiV+2DBTjn6Bgj9Oyx7CsI/IE7traUpRDfZEHLevC5s6IE60UNJnwyqPDm3xY/OTck4eaPkjPnKFfp5dk8/4ApQdvA8wq1tpl181FBS4rb6VyJpDXVJBMoWLESWO8pcrysHXiG+Eb1fvsbd4XTOptPjpd8HJnapVzqDIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYT1EqkJ3FLOiwWV9EZXmDjeaH5HDWuuXGwUQGzONGI=;
 b=DG7Va+kKu5RJsRmmd7IUhJxzdmmT5AWh8yfEcfwNKhZPwSHs22V3dqoamP8nktBgQBBD7GpgHelxFn8Wta5/FtM84k39vQGmbikGeMTDdULMZQDvV7MbjNn8qkoPE9FUrnNfJtziCQF1E2wJO2X0Gh7bdHCp/3Ihh/0DsNdosSg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "julien@xen.org" <julien@xen.org>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: ECLAIR Xen x86 results and progress
Thread-Topic: ECLAIR Xen x86 results and progress
Thread-Index: AQHYYWa8wpeTjlErNka5mMv8kda4r60WUKGA
Date: Mon, 9 May 2022 09:46:56 +0000
Message-ID: <3F6B0F2E-0CF6-4C60-A803-DD8A5EAF0DFB@arm.com>
References:
 <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8479fff3-eb68-4ea4-7e18-08da31a0e150
x-ms-traffictypediagnostic:
	DB8PR08MB4122:EE_|AM5EUR03FT043:EE_|AM6PR08MB3989:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB39895EB19ABB094BE244DFAE9DC69@AM6PR08MB3989.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IT5feKVNAoRGDMFZZOed57vUtoGxd08iI/BVucQ4emoI2+/WmbdsXXXidrZhOp0EB9wwbwTxLZOWega4AAAipxI/2LzmH65Gsc9mYDQsMP8wcUP4NeCIpCBqMkJ3CtXUT16vRtkngCBwvJsZsrZ5yK2EKnZ1IKdetCM/bdxdcSWX4budXuVez9WJyPKABuIxPDHLL4pg9HtZcYMhfJFAq5NAz446dK4sADzXpIwn4H4820Lq13+XNOjPLaBEAAm+EsO84kMApDRf1mBJhH5ELQ4YRuiGuEdgfZA2Q90quO/Dtjb44cgzMVKcIwgMOuayNmC85D+3yLyAR0A68damPbvBJHnKyVM2zKAhIEGrQyQAT6ffjq6bcFDXOVwQyJdY6D0fV6Eeuxg/dI5PNfI7P3Ob3AlBEs/4B/Nyl+GP2HX9EnipNzqbAD34EdjZTwnXOhkWvyJfnHCzNk+NBnVn15BHggccAvHAlu0sfFVfsArnvldZFDnuXNx4vZFfafi/5TvEBcFfuq6prRKEiyuAevWsmDMJo2oXratElWSLV5LmlV4BWxQs0gxRFsAv/Ts/n7drd1Mb/ay/K3gxWHZjzMalaB5+B5STHgkp9YGyrtc+GxvjD49KXxh3d9wQA7sRxGWAkldHpoiOsrBK6VLCcLASDGz2ipVon03dji5YZPgQV1i0kaEDzoPmNO1GdRoVThdQd2yGCLc398L3mCII8A9DNbZxBt0qf0/d0C/515tsCtZN2mBsnV8Mta1wflIAXrQfgLLS8+As/LXtOzSDL+7m5ZyzJ4W1wX4uu6yzwglK6xHyQM0Dd52q5t4ZdaR9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(91956017)(8936002)(71200400001)(508600001)(8676002)(4326008)(66556008)(66946007)(66476007)(66446008)(2906002)(64756008)(33656002)(76116006)(54906003)(6916009)(53546011)(122000001)(86362001)(6506007)(2616005)(5660300002)(4744005)(6486002)(966005)(316002)(38070700005)(38100700002)(186003)(6512007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <58B4670E96597C49856BC417329EC4A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4122
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86640104-dbd8-4fdf-48be-08da31a0dacf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kk6XTh1mUGRwWLcW1OsBG8yyE+r7KXgWDEjhAeWie3mQytEjQzRhufCaAApjCIw9AguuAATV0xH//TaTnDbYcHt4mjUhuSypo+LSeS8vZiL+PKKlZwZ+qIMqbstC+Rp8zUSo7Xv4f3qXoXPaQyQ4kOs6Xr4NnsmWxvGAyaz3nLdAm42vJy+wtsn/4ZsvKS97npvkRD986l6S707S40chKFU1ep2/9+c7m+PomQQPam2XXkkNRG9DIFJ270y0B+pRjk7OVFU9J4Mx/siHhxqjYIfwZbdRWX6jfbFdaD2abBVWXoDSz3+ErMu8pCcKy4vmOiWDDIebfgWmY9QqsBYq2MmwahuulgQCnAAVNlKHjggRtfPhrF74YBKJErQg1dKtXWFkMT1HEc8mQKy1/Tmp8cj6Cdv+c+tIQJrvnGJ5nVMz4DgNY4Le+SHnhXf+1oJHny/WtdGl3SFmynwBn0v36y08EAMRDrvH77rGyFpJWZyDfIByFyT5BTQz4bNezyG0CYLDXAV4aYkITZbEmTz2DvozgNdMnC1x43ddhC4XB0/4yaFh7A++/mnLCEwav/mT6I7SJnz7VCU+hxV+yvx15wIdfGHcjlzjTXvZEWyavf3s3xdp0NsVKsNNpbDnTwVAq+QDca3exIMZJ/zyZyXsthYRweSnW+HTZd3tHDFOey5llh+rUTXcpIPw9+c3ixNhrQ+gYpTK6m6HGjgWKE+QWgmxKCHLnqUksgxw1dpWkjoJ1hK70V6UEwMxfaEB+QnZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(6506007)(53546011)(2906002)(40460700003)(70586007)(81166007)(6486002)(86362001)(26005)(4744005)(966005)(6512007)(356005)(70206006)(6862004)(8676002)(54906003)(4326008)(82310400005)(8936002)(33656002)(5660300002)(336012)(316002)(186003)(47076005)(2616005)(36756003)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 09:47:07.0554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8479fff3-eb68-4ea4-7e18-08da31a0e150
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3989

Hi Stefano,

> On 6 May 2022, at 17:31, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> Hi all,
>=20
> Roberto kindly provided the ECLAIR x86 results:
>=20
> https://eclairit.com:8443/job/XEN/Target=3DX86_64,agent=3Dpublic/lastSucc=
essfulBuild/eclair/
>=20
> Click on "See ECLAIR in action", then you can select "Show 100 entries"
> and see all the results in one page. As an example MC3R1.R1.3
> corresponds to Rule 1.3 in the spreadsheet.
>=20
>=20
> If you are OK with this, I would like to aim at a follow-up meeting on
> Tue May 17 at the same time (8AM California / 4PM UK). If the date/time
> doesn't work, I'll run another Doodle poll.

Works for me.
>=20
> By then, I am hoping that the group has already gone through the first
> 20 rules in the list, up until Rule 8.10. Is that reasonable for all of
> you?

I completed that part of the table this morning (up to 8.14), it took me 30=
 minutes.

Cheers
Bertrand

>=20
> Cheers,
>=20
> Stefano


