Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0DA62741B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 02:19:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443055.697446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouO7V-0005wV-3a; Mon, 14 Nov 2022 01:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443055.697446; Mon, 14 Nov 2022 01:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouO7V-0005tR-0i; Mon, 14 Nov 2022 01:18:41 +0000
Received: by outflank-mailman (input) for mailman id 443055;
 Mon, 14 Nov 2022 01:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eg9/=3O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ouO7T-0005tJ-Vm
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 01:18:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 428e0452-63ba-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 02:18:36 +0100 (CET)
Received: from AS8PR07CA0040.eurprd07.prod.outlook.com (2603:10a6:20b:459::11)
 by AS2PR08MB9691.eurprd08.prod.outlook.com (2603:10a6:20b:605::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 01:18:33 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::d1) by AS8PR07CA0040.outlook.office365.com
 (2603:10a6:20b:459::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 01:18:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 01:18:32 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Mon, 14 Nov 2022 01:18:32 +0000
Received: from 385ba41371eb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 511128A7-C8BD-44B4-A90E-42F9C6251995.1; 
 Mon, 14 Nov 2022 01:18:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 385ba41371eb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 01:18:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 01:18:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Mon, 14 Nov 2022
 01:18:24 +0000
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
X-Inumbo-ID: 428e0452-63ba-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IfKgzMdsJAKpl57lA8z9nDDRl2d2dDeQUNKvNWNWPP7yqSP9YnpoMtsV/TKBUVn6jpZkB8msYmxWgAc43VcMWu3TFh3WMeEQ39B2BiHYfoJbTKE6+GChEdJY9J/0j4xu93aDhGTMARoY1Q2tW/gTYEx+tsyC3IeKWKdx4RSHwQNTbOQXhho6FcQdfHXE2DVNdCREN8bnbl7SJn1xW3RrvCz9lkc6gkJL4gWeglkz/SQYkHGMhoiRFlNFq6Rs0m5EDlZ0wkknFxC7xNuVpUwwBlG32QGf8lPpxia8tmaObKHyWAnku5FWBrqsf478uJnMxiENlIXyovQ+uB1NsF68kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsATxt7qa+FQO28pzai6izHvkY7Or/JLb2YXVkoOEbE=;
 b=azQiOzCi7bDKVzrFrQsX4bjh5vMt0Ar5tgYBg6eTGR//MUJQB824fh/96+sekzGjxMA5fsr+Bdwd8FZlU1G3R0pLleSXwbdlLXbcgpprbiEu+ivDcqaYxDc0ZfwzXcvvs2wnyz7nsW2rw4AfFWvZGRAmYiAhxPJlTYeBWiEciOEcR8vf0XDU+ws10jQxPHSlrhQZ5XXxZj4jvM9QUgi7Yr5sKE4VWn4ZuPyLRFIiBRr2ziUhExkUSt/rPqLwH0J/sc4V7xCHg3RsR7U0u2l3uEt6jqnhZFaPG6lSjjk0VrMPCMpLoTk50Yj2SivSt4aNMRaEDKSZBOWawcp6r/VXYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsATxt7qa+FQO28pzai6izHvkY7Or/JLb2YXVkoOEbE=;
 b=557/J8rSz/ThPeyd1MBrZSixnxYfk5ySoKzL6pR+B8EsWrNNInRXqSnE0rEnm0fgsZ/vb2EKmCJxEVqiZYMslhBbEjz/UKz2Evcaq5lqH9OYBI6dYbjmks9MVr/w3PPkEuoPVDY3Tkc3ZPneXmYlcklnnVpsJxDVU6yc+nSdWmM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXsGLxn5qxiCR9KvBMfIKIAnjFtP3a0S9V/Tly7Cqesu8W4rQaARCcmsOZn3xG6DH2yLq7nn1NTwmxaZkY2f/jV2FM33xwo/FsBMdsHc8iX623VTX4qK5Te3PP3xEJl3AZMMFynQ9K2hvt4faKxW4NvVYWuS5vflxHfTzss++rUGMAYRSsMCUWocRWj+DX/X0oYpYXHpiSkgvnBF/4Iul5mPEg+UW1aOHpA8twVhV2WT0ekKh/oizUtRzyWm0uNeBD8KEdPOF3T/U2fHkYe3Ano+vmhp5IH0AbpAG611Q7jeDAbKskB4EYFZwRT9AE5NjWAIv5ZEBFVsErdbWpk1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsATxt7qa+FQO28pzai6izHvkY7Or/JLb2YXVkoOEbE=;
 b=KZ3uY2GV5SatJcJ0JJyathsxxYk4JbEt/ZtNroip07KKB67+oeTygC53B3jzAK6xPi/QJCQbm2zuV5F0jQW757t7kXmTSlF+9GYfepPh0yb5UyaD7b/s+/cr3DkAUbVh4RhES0k6XjqCABmKwthDKkgtOgsS16fPTke5cRfeXioAA1YNJaH3jtlQ3k4DxpOi2ks7F5kKfiFH8vkvFNyJqbFFCaNiLADez2LAVjdzC2cEPGmNhc0J59JzsXlwdN5k/CuCfdKRTPkv7ygBc22NpmHuMqrqqCtjZV5xeMYEkyKosEAREwcpxdLrHAwMPQxY7kP7HK1qdkq65IVoNkmKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsATxt7qa+FQO28pzai6izHvkY7Or/JLb2YXVkoOEbE=;
 b=557/J8rSz/ThPeyd1MBrZSixnxYfk5ySoKzL6pR+B8EsWrNNInRXqSnE0rEnm0fgsZ/vb2EKmCJxEVqiZYMslhBbEjz/UKz2Evcaq5lqH9OYBI6dYbjmks9MVr/w3PPkEuoPVDY3Tkc3ZPneXmYlcklnnVpsJxDVU6yc+nSdWmM=
From: Henry Wang <Henry.Wang@arm.com>
To: Jim Fehlig <jfehlig@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: RE: vnuma_nodes missing pnode 0
Thread-Topic: vnuma_nodes missing pnode 0
Thread-Index: AQHY9iDYCXvlfuymEU2cRUBeAI3Esq49n+1w
Date: Mon, 14 Nov 2022 01:18:24 +0000
Message-ID:
 <AS8PR08MB799119CD58863C6D1D309E9092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
In-Reply-To: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3FBC458A4BB07840885FE2C5728B6C64.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6053:EE_|AM7EUR03FT038:EE_|AS2PR08MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d860fa-2262-4115-f2f1-08dac5de254c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1apFI6iQUdjdWnDlfWGFs3uOusX9EGEBsIrUW7Hw19EfNlOiEuMjEYjn6fLNcsgrwhJ+RJYtGo1TtxkW4scIrqxLsEGCAXRPaOR8G6du7ylYi5WPocjCh6j+8z9OM/sI0u5sWyhvjcldT568N1E8eX46qHuPdS4aV26CDS/p7x9W3hhZg86d2WpGl/AZuds8iHZJ7Gu24fs7+GXYxUyMp0d9d9URx4U2090FbIOqXAbgZ6MZehDJEBRF7y8XIaMBebf9VU13JGfO6rlcLptHc8pCXI13YQr9bcZdSkAHB3Letpg7MZA635vZet2l1AKvemnXKTdR2xan0bB7QkCfmN0P0g04nK0ZEh1V1hp/8ijEm5duwleVSUIlljODcfdcsuc6csFBnvP5xe0DK13emigj3VR20tOkc8MA3Fgg3NWPxfSfDQ+ahdNCFQDsPVD+Bh1nj+PiyxFRRTrlvMJ7nclGEI4zDBhokTNY6tiB3SOctahPYtuaPR8UOTXP/KTvikkMrLBBKhnDAZhAWroSWDBx8f1tySE623P+ltgmltBvFBZwG5YogH9zYZ8bUKSSbCAoocuUEoGPJCvQnC7FVX4NPL+rlfeajFNbv4PFRm/JsfRSlS+n9eqLJgSr6NfFYabi/0mnYtvzjaGIOimQIO3pQqLB2vo5pAH5Wy7C6+Jn8VLTkApYpA2Cbe+sCzTE9e4gpzphw6wYSu4tJLOXyuZt8g2/z6Vw5WkEIaMMTZqbZKXVWKeo1FRG7ikD3AHrJyIzEC74MgQSGFUujk+N2kOeCYX3ZCkB1Gte+JXNaoQa8O8Ip3kNlY3117sS4dlo3o6u89XbbJxtYaVwWnKgbg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(366004)(376002)(136003)(396003)(451199015)(55016003)(33656002)(6506007)(7696005)(26005)(4326008)(2906002)(86362001)(54906003)(316002)(186003)(478600001)(41300700001)(966005)(83380400001)(38070700005)(5660300002)(8936002)(110136005)(52536014)(38100700002)(71200400001)(66476007)(66946007)(66446008)(8676002)(64756008)(122000001)(7116003)(76116006)(66556008)(9686003)(533714002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6fba7b1f-c3ec-4f31-5221-08dac5de2058
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3WQdjGFoUiyCdcTjrw9eRKR1HVBWnXWXsnAx+ivlpmv9bY4NXIoaYXMkvwjd0o+HrwFdRvrL9pNNarUOYL1XiSIl1Mx1Msr70QCxt2IFNfSwwV4vAmX7V2RA/2ORByT1ZeUvmWOHYTd2ZBMrDHURAHvwF+OFCAk3cha/T3pt28c4d4Qk+k5eVVQJD7DyNFX0UDGXtZ0DTvZavCIyNLOMlvoworJ2UcpY4oT5ZEIhYl1xtskWnvkGS8DvG3I4oH82uK+j9On8BwktMKg9wYjGS0b4bV0/gPFSzVwRjph8qFunuieks0ZrH2Sh5T5sZu3abUjHZv+ML02TexQIrhSUCsRYA5gw59/5UF8RL+E8TfsxC5KG7LC+gltb8Cjbum5tmyKP6y3J+/QHskcJm5kcO18leYxMRWMAzWo8gPU6YMNaV59loMdGsE7Ryldk+GfANd6n/VbwXlIyEvaUsjoAWwFCQKmnnX30jYuP6K6LiF4JL9aZy+TFSURy3ntj8Edrpps5vmic034B9e6IpFIjXCUheM1Ob879GjOVw27LKILNSzDGtAP3VTVi8x0QZSwGeHYpYLA2DgNRz/8V4doMRPn+/8im9+BdPgKCNwTyEEr1eVufIemVoFv4HVeOgC2wRBnHGY01OeYnHPQA1VzTYRUIXPTroizspg0nxsYO0XSTxIR+uKybNLyowmEpF8Ho9AhSNMxBgRiLsdxflc2U/yeMq358Pvr6J6wpe+BqtdE6buUk4xDzKiU75cWA/6MczBO9hKkZyqClQTCoBJrGfF7vkcok1NCf9EDbKRGLnfM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39850400004)(451199015)(36840700001)(46966006)(33656002)(82740400003)(41300700001)(2906002)(356005)(81166007)(83380400001)(36860700001)(86362001)(54906003)(70206006)(70586007)(47076005)(110136005)(966005)(4326008)(478600001)(336012)(316002)(186003)(7116003)(82310400005)(40480700001)(8936002)(107886003)(52536014)(5660300002)(6506007)(55016003)(7696005)(26005)(8676002)(9686003)(533714002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 01:18:32.5089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d860fa-2262-4115-f2f1-08dac5de254c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9691

KEFkZCB4ODYgbWFpbnRhaW5lcnMgZm9yIG1vcmUgdmlzaWJpbGl0eSkNCg0KSGkgeDg2IG1haW50
YWluZXJzLA0KDQpTaW5jZSB0aGlzIHJlcG9ydCBtaWdodCBiZSByZWxhdGVkIHdpdGggdGhlIHJl
bGVhc2UsIGlmIHlvdSBoYXZlIHRpbWUsDQpwbGVhc2UgaGF2ZSBhIGxvb2suIFRoYW5rIHlvdSB2
ZXJ5IG11Y2guDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gU3ViamVjdDogdm51bWFfbm9kZXMgbWlzc2luZyBwbm9kZSAwDQo+IA0KPiBI
aSBBbGwsDQo+IA0KPiBXaGlsZSBmaXhpbmcgWzFdIGEgcmVjZW50IGRvd25zdHJlYW0gbGlidmly
dCBidWlsZCBmYWlsdXJlIGFnYWluc3QgNC4xNyByYzMsIEkNCj4gbm90aWNlZCB0aGUganNvbiBy
ZXByZXNlbnRhdGlvbiBvZiBsaWJ4bF92bm9kZV9pbmZvIG9taXRzIHBub2RlIHdoZW4gdmFsdWUN
Cj4gaXMgMC4NCj4gVGhlIHByb2JsZW0gY2FuIGJlIHNlZW4gYnkgc3RhcnRpbmcgYSBWTSBjb250
YWluaW5nIHRoZSBmb2xsb3dpbmcgdm51bWENCj4gY29uZmlnDQo+IA0KPiB2bnVtYSA9IFsgWyAi
cG5vZGU9MCIsICJzaXplPTIwNDgiLCAidmNwdXM9MCIsICJ2ZGlzdGFuY2VzPTEwLDIwIiBdLCBb
DQo+ICJwbm9kZT0xIiwgInNpemU9MjA0OCIsICJ2Y3B1cz0xIiwgInZkaXN0YW5jZXM9MjAsMTAi
IF0gXQ0KPiANCj4gVGhlIGpzb24gcmVwcmVzZW50YXRpb24gZm9yIHRoaXMgY29uZmlnIGRvZXMg
bm90IGNvbnRhaW4gcG5vZGUgMA0KPiANCj4gICAgICAgICAgICAgICAgICJ2bnVtYV9ub2RlcyI6
IFsNCj4gICAgICAgICAgICAgICAgICAgICAgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
Im1lbWtiIjogMjA5NzE1MiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICJkaXN0YW5jZXMi
OiBbDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTAsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMjANCj4gICAgICAgICAgICAgICAgICAgICAgICAgIF0sDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAidmNwdXMiOiBbDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgXQ0KPiAgICAgICAgICAgICAgICAg
ICAgICB9LA0KPiAgICAgICAgICAgICAgICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAibWVta2IiOiAyMDk3MTUyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgImRpc3Rh
bmNlcyI6IFsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyMCwNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAxMA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgXSwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICJwbm9kZSI6IDEsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAidmNwdXMiOiBbDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgXQ0KPiAgICAgICAgICAgICAgICAgICAgICB9DQo+ICAg
ICAgICAgICAgICAgICAgXSwNCj4gDQo+IEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgY29kZSBn
ZW5lcmF0b3IgZm9yIHRoZSAqX3RvX2pzb24gZnVuY3Rpb25zLCBidXQgd2l0aA0KPiBhDQo+IGhp
bnQgSSBjYW4gcHJvYmFibHkgY29vayB1cCBhIHBhdGNoIDotKS4NCj4gDQo+IFJlZ2FyZHMsDQo+
IEppbQ0KPiANCj4gWzFdIGh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL2FyY2hpdmVzL2xpYnZp
ci1saXN0LzIwMjItDQo+IE5vdmVtYmVyLzIzNTc0NS5odG1sDQoNCg==

