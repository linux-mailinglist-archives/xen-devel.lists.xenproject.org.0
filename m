Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD040622414
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 07:48:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440652.694749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oseri-0006Sp-Vp; Wed, 09 Nov 2022 06:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440652.694749; Wed, 09 Nov 2022 06:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oseri-0006Q8-RL; Wed, 09 Nov 2022 06:47:14 +0000
Received: by outflank-mailman (input) for mailman id 440652;
 Wed, 09 Nov 2022 06:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIzN=3J=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oserg-0006Q2-Ut
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 06:47:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55881921-5ffa-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 07:47:10 +0100 (CET)
Received: from AM6P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::27)
 by PAXPR08MB7597.eurprd08.prod.outlook.com (2603:10a6:102:23c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 06:47:07 +0000
Received: from VI1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::60) by AM6P195CA0014.outlook.office365.com
 (2603:10a6:209:81::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 06:47:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT058.mail.protection.outlook.com (100.127.144.186) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 06:47:06 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 09 Nov 2022 06:47:06 +0000
Received: from f4319a4e95cc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA1EBDF5-63A2-4139-971A-B76146F76F5E.1; 
 Wed, 09 Nov 2022 06:47:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4319a4e95cc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 06:47:00 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB8PR08MB5308.eurprd08.prod.outlook.com (2603:10a6:10:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 06:46:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%6]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 06:46:58 +0000
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
X-Inumbo-ID: 55881921-5ffa-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Yuo6Wp/dpTShKuLKPcUHaFWCglsH64b3ZFGuRWvYBUHmtoy81nBTwpGH9zivi2NBsjytUahzhYBI/1U2uigjqHeJzdiTNL/PXRZY2VXbveyIsRVJ0EN9x0QDxPnjPnDN59MOUj+CQkwPS36yH38JSPlYLnoR8l97InLTibrRoz7maMqSIQSAZnPvN7Gmg8MybB30XWTThkeVrNw6r3tHeht3a+kD+2aO4p+GeOxn0ZYFPDeq1PmHenpnyvL5ja0SZDsAitB6y5M48om20KHnaiVSlOJyaVYG/gxne0RsVV5BKy91GNklzX+96yu/z/j8x6T6Yy+ffUTnVahdQ3VU9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x/UmCsr55BDJBfCWaiNONnWpVNM5XpYkxIp9xvm7jA=;
 b=TDBhK0hrN+dqV5SvgdFGbp8M/KFysfoDqPBaKn/0N8MBoesGHvZuY4tLZt2TnAR6nNNwgu7jl/XzuKe1V3N9Wb9ZF/0E2ZkBJMt3gM1Q/cWk1iLBgQUcOnC1xKQhk8QJDz8IIAzKHvIx4jXumHJ+DXJWQrMX6LmmSKsCikE7PxHhShaS8QwsI/YAoNeIp7MrEJz+u6Nor3XRSozdAu/A4tw6F25GTEnVN6H+NW6mdKDcHD3egUMxPe2HzCNqLCUr5lNsAgSuonOOnQ5KAVi1FSI/MaAnKRD/kjuP+/Zk2hj+daYrOjMyB5nX9s9/Vhf/nUO3jufWIaHDMRtcCOpqag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x/UmCsr55BDJBfCWaiNONnWpVNM5XpYkxIp9xvm7jA=;
 b=NuxlZ/sQMF13St6mAfD7v8IGpoJuj+n47FYJAe9Gd5ZefmTSDvlbnNQo4MbE5xkbd6dB33jaYsHYWRBa45//PEmiib8YNJKgL/4ZvfA9N0j1pFe/DSOQr866J7TUQ9EMM6ky/shgaWeEaSJC1bNGpIhRYXR/R3z1xUTHzi8Gfrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODITASiIU9i0ghGswYBKJfwhwZQc0S4DAzp665L57o1UhpwWLUMYErJqa7kBpbjv4rB0Zt52jpXjwlnJPXTwAPvKD1ZSL9t7FCnYIHksFFdlic7h1AtZFGnxwkKMPPCdZBn1wNFe2IcyeKalNekC7n7IZ6NUTDG3fj3R6HZmqGdPPpFaaLp2P1r2WA/n/mZT1SOSKbDzXIHGnizok2INs2R+2vxDfpBxuZokUtsNdzDoTk2BcvxfqZktClfUB+DhITC4G8FUVkMCoghqZdC1XmP6c5cZYY2ObQX6l82W4g81x21b24fXpy9uqGLyePaCw6qw5PozqIaQOA8m/Zy0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x/UmCsr55BDJBfCWaiNONnWpVNM5XpYkxIp9xvm7jA=;
 b=dpMaszCxqhGqv5nZQRV2lnHxE2c2xwTA8s+RVNTFIvQ7tIj1C93cOJiWMusjvChc9jsv471JX29kz0CUMaQHWimKT8YwnWHsdJAAHB2ThgubO17Qiox2kPzxCu+O0pcJISWw2SrgW3AIj85YkkcNtD+lzDN9GA7z2BYAJkRrF/k0OYDL95NkqEWG7njE9zpq9ZsVWU5YJkFoTPhS3ukHKLG+xW9q2qq06oqzR3mHMdwEKSdXl2hygLQMGzqY03XL57+OiuFL3HDr+OLEMwOARis4j8yA04XQkvf7jF1QOA2qKu/Zs+LSHoR/iaoxknuqxH7ZpdpYV5o8PyeSlOsurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x/UmCsr55BDJBfCWaiNONnWpVNM5XpYkxIp9xvm7jA=;
 b=NuxlZ/sQMF13St6mAfD7v8IGpoJuj+n47FYJAe9Gd5ZefmTSDvlbnNQo4MbE5xkbd6dB33jaYsHYWRBa45//PEmiib8YNJKgL/4ZvfA9N0j1pFe/DSOQr866J7TUQ9EMM6ky/shgaWeEaSJC1bNGpIhRYXR/R3z1xUTHzi8Gfrw=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU systems
Thread-Topic: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU systems
Thread-Index: AQHY8DVneLUTj6n4XEmKaYaqtg988K4yT/yAgAPcKRA=
Date: Wed, 9 Nov 2022 06:46:57 +0000
Message-ID:
 <PAXPR08MB7420B9D326528EC2D20FE47D9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-8-wei.chen@arm.com>
 <db5667fc-ac64-411c-4011-dd4bbe25ad7e@xen.org>
In-Reply-To: <db5667fc-ac64-411c-4011-dd4bbe25ad7e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 965A78688B6484488DC5B11EA91F1EE5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DB8PR08MB5308:EE_|VI1EUR03FT058:EE_|PAXPR08MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f58ea1-a551-4f20-f5b8-08dac21e37f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Vi4+UTaJz6kA5OC6d8vhssCL2dJbEKusWr0oKX4T9poilAsMehGHMx/FhpAF8877Sq07eobr5wSplv8zJCY+vKkW2ccUN31U26FK5sNsFSwtfiIACEcgn0Ec/Pgz+T0MGd+4HCaLAHcOHnMZHLOY7R36FCBLd8mqEs0snphArgmfJMLbfw5HlhFt/aBVKXa968g2sO5u3tMxilM4z5p+90p0mn87yFTCY/eK8A86ke7VB2/JKKpvYW8xsqXnFZKjRtN+GuPIvQnvykhrC5SaJFy+5Qt8IRxR2xHJ+UUKW7aFrkLja+KfuKj6uWbBeWDW60m9cK6Uzmmc+2U5hi039yUkWj7EKdjR/lfa+tvdx0sXrE61zsGvxB9cFTw0CVnJ8y5IOATHWnF5zSp7hgPsJsmqODlJpbt631/wZZSY2JVudCfA2psRO2yUdr5bvclhz8VX6EDQi1s8fOmDZuIpTwpFIDG5FY110xwb7pct6P1ntrSpVQ9lYJ6QOSUHjsD5ExwQA7M2/idsBqziMIy36sL3niTLLbnLhUyeItteE9sc3NcRfx3Iir8xqdCGwuthE4ILx92kkJfcHHPYjO5pP7sTlI0BzTbeyp1DDkHsx509tdAZJ9zJdRrBIDEfNeQhQvNJvq/KYT3VKBUf5WfuvJYoDgh+L/Q/kPtfT9cKc0WKIkmmR58++WE45op2pnH+rgS0ePvJp9OhFus3SFpqL9r9bQUwqn4FUZbYUsQ3DnfaeVJ+lpn2Apu2p/iJaWMHP+WdEQPtPKnGKuooXO4R6Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199015)(66446008)(64756008)(66476007)(8676002)(4326008)(33656002)(66556008)(53546011)(66946007)(76116006)(316002)(6506007)(7696005)(55016003)(83380400001)(2906002)(41300700001)(9686003)(86362001)(26005)(122000001)(38100700002)(5660300002)(186003)(8936002)(52536014)(71200400001)(478600001)(110136005)(54906003)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5308
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eb0026fc-32e8-435a-75e4-08dac21e3285
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wRABiPyPDWaCRQlL/lrAh+UqWsQmbGbn14sXOTPCysE29azY4Lw3bH4f71YD1pRVs+/2LSaulLHFa/u6u5SfKW9xdk/Y5bXcejZ9iZoNpD6Con3FHVZ2SXGiPgMcHXUbsr2EapDBhevaAYYT/iq0tSm04trdlaISDU+O+dQfdbdJOWCo2E04XXnSm0c5G/EV+Pl4VNQIAuv06sWlKYfRyRIuLkxpqhY+sroBgD/e1XyAsuZYIhpUrXqeI8WZ0BjL7htb7Zx9JGerVFDIgUEyY2/vbQ6bqsco53xbutBH0g9Nb3cp+i7XARt8ypKZb2s6XQcpgMpV68bi22aoqfZ8cMun2y+4PWzWoJXsZX1ck6iQuIs/pU+iVVkaIZxJanw6N7OpUXv3HVz+GciCNXRjF2uIUuU2ZSsSa2nj3/VxZxTiJaKUw8+xI08ZKTaTVTV8oZTJbT6Xhd7qU2R2kc4xaseojqi1GClNH1GD+winc9vlCjukdUdn21mrvQu76MoSaYxbnpdB2zRWs6vG7HRn1tLMKwzqQVaeWA/IFllpcm4WzHYcsmUDCbk3ugA6QmAdGSgeCeaY+kRQrmIM7cLQIYvAgK1rVA3yDC+9A6Wmc9dos3PilMpEno6/R7bI7HevCEnL0t5wP+FtuBVtGY9qztDpT4bfYHQ0dYCAo6NpE3SKFkfRb0lCoa7HO71/ANRJ9kGSaRN2vhv1e+zT0R2CnzYYNo3Blox7U8TH4aalPtiLYEqMtZX6buzTAd5F7Ql25LIoyp8HwQBNTumd8g7xwg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(186003)(47076005)(107886003)(2906002)(336012)(7696005)(53546011)(478600001)(9686003)(40460700003)(110136005)(26005)(82740400003)(356005)(83380400001)(86362001)(54906003)(81166007)(55016003)(33656002)(70586007)(36860700001)(6506007)(70206006)(40480700001)(82310400005)(8676002)(4326008)(41300700001)(316002)(5660300002)(8936002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 06:47:06.8442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f58ea1-a551-4f20-f5b8-08dac21e37f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7597

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMeaciDfml6UgMzo0NQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQNCj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA3LzExXSB4ZW4vYXJtOiBpbXBsZW1lbnQg
RklYTUFQX0FERFIgZm9yIE1QVQ0KPiBzeXN0ZW1zDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAw
NC8xMS8yMDIyIDEwOjA3LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBGSVhNQVAgaXMgYSBzcGVjaWFs
IHZpcnR1YWwgYWRkcmVzcyBzZWN0aW9uIGZvciBYZW4gdG8gbWFwIHNvbWUNCj4gPiBwaHlzaWNh
bCByYW0gb3IgZGV2aWNlIG1lbW9yeSB0ZW1wb3JhcmlseSBpbiBpbml0aWFsaXphdGlvbiBmb3IN
Cj4gPiBNTVUgc3lzdGVtcy4gRklYTUFQX0FERFIgd2lsbCByZXR1cm4gYSB2aXJ0dWFsIGFkZHJl
c3MgYnkgaW5kZXgNCj4gPiBmb3Igc3BlY2lhbCBwdXJwb3NlIHBoeXMtdG8tdmlydCBtYXBwaW5n
IHVzYWdlLiBGb3IgZXhhbXBsZSwNCj4gPiBGSVhNQVBfQUREUihGSVhNQVBfQ09OU09MRSkgZm9y
IGVhcmx5IGNvbnNvbGUgbWFwcGluZyBhbmQNCj4gPiBGSVhNQVBfQUREUihGSVhNQVBfTUlTQykg
Zm9yIGNvcHlfZnJvbV9wYWRkci4NCj4gDQo+IFRvIG1lLCB3ZSBhcmUgYmVuZGluZyBxdWl0ZSBh
IGJpdCB0aGUgZGVmaW5pdGlvbiBvZiB0aGUgZml4bWFwLiBUaGVyZQ0KPiBhcmUgbm90IG1hbnkg
dXNlIG9mIHRoZSBGSVhNQVAgd2l0aGluIHRoZSBjb2RlIGFuZCBJIHRoaW5rIGl0IHdvdWxkDQo+
IHNpbXBseSBiZSBiZXR0ZXIgdG8gYWJzdHJhY3QgdGhlIHVzZSAob3IgcmVtb3ZpbmcgaXQgd2hl
biBwb3NzaWJsZSkgYW5kDQo+IGF2b2lkIGRlZmluaW5nIEZJWE1BUF9BRERSKCkgJiBjbyBmb3Ig
TVBVLg0KPiANCg0KSSBhZ3JlZSwgaWYgd2UgZG9uJ3QgbWluZCB0byBhZGQgc29tZSBDT05GSUdf
SEFTX01QVSBpbiBzb21lIGdlbmVyaWMgY29kZS4gDQpJIGFsc28gcHJlZmVyIHRoaXMgd2F5LiBG
cmFua2x5LCBJIHJlYWxseSB0aGluayBGSVhNQVAgaXMgYXdrd2FyZCBpbiBNUFUNClN5c3RlbS4N
Cg0KPiA+DQo+ID4gQnV0IGluIE1QVSBzeXN0ZW1zLCB3ZSBjYW4ndCBtYXAgcGh5c2ljYWwgYWRk
cmVzcyB0byBhbnkgdmlydHVhbA0KPiA+IGFkZHJlc3MuIFNvIHdlIHdhbnQgdGhlIGNvZGUgdGhh
dCBpcyB1c2luZyBGSVhNQVBfQUREUiB0byByZXR1cm4NCj4gPiB0aGUgaW5wdXQgcGh5c2ljYWwg
YWRkcmVzcyBpbiBNUFUgc3lzdGVtcy4gU28gaW4gTVBVIHZlcnNpb24sDQo+ID4gRklYTUFQX0FE
RFIgd2lsbCB0cmltIHBoeXNpY2FsIGFkZHJlc3MgdG8gUEFHRSBhbGlnbm1lbnQuIFRoaXMNCj4g
PiB3aWxsIHJldHVybiBhbiBvZmZzZXQgd2hpY2ggaXMgc2ltaWxhciB0byBNTVUgdmVyc2lvbiBG
SVhNQVBfQUREUi4NCj4gPiBCdXQgaXQncyBhIHBoeXNpY2FsIG9mZnNldCBnb3QgZnJvbSBpbnB1
dCBwaHlzaWNhbCBhZGRyZXNzLCBwbHVzDQo+ID4gdG8gYW4gb2Zmc2V0IGluc2lkZSBwYWdlICh3
aGljaCBpcyBhbHNvIGdvdCBmcm9tIHBoeXNpY2FsIGFkZHJlc3MNCj4gPiBtYXNrIHdpdGggUEFH
RV9NQVNLKS4gVGhlIGNhbGxlciBjYW4gcmV0dXJuIHRoZSBpbnB1dCBwaHlzaWNhbA0KPiA+IGFk
ZHJlc3MgZGlyZWN0bHkuDQo+ID4NCj4gPiBBcyBwbWFwIGRlcGVuZHMgb24gRklYQU1QLCBzbyB3
ZSBkaXNhYmxlIHBtYXAgZm9yIEFybSB3aXRoIE1QVQ0KPiA+IGVuYWJsZWQgc3lzdGVtcy4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0t
LQ0KPiA+ICAgeGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAyICstDQo+
ID4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnX21wdS5oIHwgIDIgKysNCj4gPiAg
IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9maXhtYXAuaCAgICAgfCAyNSArKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBi
L3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4gaW5kZXggYWMyNzYzMDdkNi4uMTQ1OGZmYTc3NyAx
MDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNo
L2FybS9LY29uZmlnDQo+ID4gQEAgLTE2LDcgKzE2LDcgQEAgY29uZmlnIEFSTQ0KPiA+ICAgCXNl
bGVjdCBIQVNfREVWSUNFX1RSRUUNCj4gPiAgIAlzZWxlY3QgSEFTX1BBU1NUSFJPVUdIDQo+ID4g
ICAJc2VsZWN0IEhBU19QRFgNCj4gPiAtCXNlbGVjdCBIQVNfUE1BUA0KPiA+ICsJc2VsZWN0IEhB
U19QTUFQIGlmICFIQVNfTVBVDQo+IA0KPiBJIGNhbid0IGZpbmQgYW55IGNoYW5nZSBvZiBtbS5j
IGluIHRoaXMgc2VyaWVzLiBTbyBzdXJlbHkgdGhpcyB3aWxsDQo+IGJyZWFrIHRoZSBidWlsZD8N
Cg0KWWVzLCBpbiBvdXIgaW50ZXJuYWwgdGVzdGluZywgb3BlbiBQTUFQIGZvciBNUFUgd2lsbCBj
YXVzZSBidWlsZGluZw0KZmFpbGVkLCBleGNlcHQgd2UgYWRkIHNvbWUgbmV3IHN0dWJzIGZvciBN
UFUgc3lzdGVtLg0KDQo+IA0KPiA+ICAgCXNlbGVjdCBJT01NVV9GT1JDRV9QVF9TSEFSRQ0KPiA+
DQo+ID4gICBjb25maWcgQVJDSF9ERUZDT05GSUcNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2NvbmZpZ19tcHUuaA0KPiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9jb25maWdfbXB1LmgNCj4gPiBpbmRleCA1MzBhYmI4MzAyLi5lZWU2MGRjZmZjIDEwMDY0NA0K
PiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jb25maWdfbXB1LmgNCj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnX21wdS5oDQo+ID4gQEAgLTI0LDQgKzI0
LDYgQEANCj4gPg0KPiA+ICAgI2RlZmluZSBIWVBFUlZJU09SX1ZJUlRfU1RBUlQgIFhFTl9WSVJU
X1NUQVJUDQo+ID4NCj4gPiArI2RlZmluZSBGSVhNQVBfQUREUihuKSAgICAgICAgIChfQVQocGFk
ZHJfdCwgbikgJiAoUEFHRV9NQVNLKSkNCj4gPiArDQo+ID4gICAjZW5kaWYgLyogX19BUk1fQ09O
RklHX01QVV9IX18gKi8NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2ZpeG1hcC5oDQo+IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2ZpeG1hcC5oDQo+ID4gaW5k
ZXggZDBjOWE1MmM4Yy4uMWUzMzg3NTllOSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vZml4bWFwLmgNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
Zml4bWFwLmgNCj4gPiBAQCAtNyw2ICs3LDggQEANCj4gPiAgICNpbmNsdWRlIDx4ZW4vYWNwaS5o
Pg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9wbWFwLmg+DQo+ID4NCj4gPiArI2lmbmRlZiBDT05GSUdf
SEFTX01QVQ0KPiA+ICsNCj4gPiAgIC8qIEZpeG1hcCBzbG90cyAqLw0KPiA+ICAgI2RlZmluZSBG
SVhNQVBfQ09OU09MRSAgMCAgLyogVGhlIHByaW1hcnkgVUFSVCAqLw0KPiA+ICAgI2RlZmluZSBG
SVhNQVBfTUlTQyAgICAgMSAgLyogRXBoZW1lcmFsIG1hcHBpbmdzIG9mIGhhcmR3YXJlICovDQo+
ID4gQEAgLTQ1LDQgKzQ3LDI3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IHZpcnRfdG9f
Zml4KHZhZGRyX3QgdmFkZHIpDQo+ID4NCj4gPiAgICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8N
Cj4gPg0KPiA+ICsjZWxzZQ0KPiA+ICsNCj4gPiArLyoNCj4gPiArICogRklYTUFQX0FERFIgd2ls
bCB0cmltIHBoeXNpY2FsIGFkZHJlc3MgdG8gUEFHRSBhbGlnbm1lbnQuDQo+ID4gKyAqIFRoaXMg
d2lsbCByZXR1cm4gYW4gb2Zmc2V0IHdoaWNoIGlzIHNpbWlsYXIgdG8gTU1VIHZlcnNpb24NCj4g
PiArICogRklYTUFQX0FERFIuDQo+ID4gKyAqIEZvciBleGFtcGxlOg0KPiA+ICsgKiBFQVJMWV9V
QVJUX1ZJUlRVQUxfQUREUkVTUyBpcyBkZWZpbmVkIGJ5Og0KPiA+ICsgKiAgICAgKEZJWE1BUF9B
RERSKEZJWE1BUF9DT05TT0xFKSArIFwNCj4gPiArICogICAgIChDT05GSUdfRUFSTFlfVUFSVF9C
QVNFX0FERFJFU1MgJiB+UEFHRV9NQVNLKSkNCj4gPiArICogV2l0aCBNUFUgdmVyc2lvbiBGSVhN
QVBfQ09OU09MRSBhbmQgRklYTUFQX0FERFIgZGVmaW5pdGlvbnMsDQo+ID4gKyAqIEVBUkxZX1VB
UlRfVklSVFVBTF9BRERSRVNTIGNhbiBiZSByZXN0b3JlIHRvDQo+ID4gKyAqIENPTkZJR19FQVJM
WV9VQVJUX0JBU0VfQUREUkVTUy4NCj4gPiArICogSW4gdGhpcyBjYXNlLCB3ZSBkb24ndCBuZWVk
IHRvIHVzZSAjaWZkZWYgTVBVIGluIHRoZSBjb2RlDQo+ID4gKyAqIHdoZXJlIGFyZSB1c2luZyBG
SVhNQVBfQUREUiB0byBtYWtlIHRoZW0gdG8gdXNlIHBoeXNpY2FsDQo+ID4gKyAqIGFkZHJlc3Mg
ZXhwbGljaXRpbHkuDQo+ID4gKyAqLw0KPiA+ICsjaWZkZWYgQ09ORklHX0VBUkxZX1VBUlRfQkFT
RV9BRERSRVNTDQo+ID4gKyNkZWZpbmUgRklYTUFQX0NPTlNPTEUgICAgICAgICBDT05GSUdfRUFS
TFlfVUFSVF9CQVNFX0FERFJFU1MNCj4gPiArI2VuZGlmDQo+ID4gKw0KPiA+ICsjZW5kaWYgLyog
Q09ORklHX0hBU19NUFUgKi8NCj4gPiArDQo+ID4gICAjZW5kaWYgLyogX19BU01fRklYTUFQX0gg
Ki8NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

