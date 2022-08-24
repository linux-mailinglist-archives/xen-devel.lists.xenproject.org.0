Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D957559FD5D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392758.631312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrUE-0000Zy-Pi; Wed, 24 Aug 2022 14:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392758.631312; Wed, 24 Aug 2022 14:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrUE-0000Xm-M2; Wed, 24 Aug 2022 14:36:06 +0000
Received: by outflank-mailman (input) for mailman id 392758;
 Wed, 24 Aug 2022 14:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQrUD-0000Xg-Cg
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:36:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14fb6039-23ba-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 16:36:04 +0200 (CEST)
Received: from DB6PR07CA0013.eurprd07.prod.outlook.com (2603:10a6:6:2d::23) by
 DBBPR08MB4411.eurprd08.prod.outlook.com (2603:10a6:10:cb::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.19; Wed, 24 Aug 2022 14:36:01 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::1f) by DB6PR07CA0013.outlook.office365.com
 (2603:10a6:6:2d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 24 Aug 2022 14:36:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 14:36:00 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Wed, 24 Aug 2022 14:36:00 +0000
Received: from 4e1c201872db.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1142A714-E4A1-4120-A2A0-1CDF8D592FBF.1; 
 Wed, 24 Aug 2022 14:35:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e1c201872db.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 14:35:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6625.eurprd08.prod.outlook.com (2603:10a6:20b:357::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 14:35:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 14:35:46 +0000
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
X-Inumbo-ID: 14fb6039-23ba-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=J2MJKd5fWKrCqZl2t7F2nogZS3OrYGLYHhVCFcb5eNQhVle4gvOTS1riPJ6Sz95bKgeWtC0tKRTdf90r2hoeZiybrkRBwcvmgat4gGHhFcH4ZGTUUnEfMv9melOub3sqQiSp3wQkwlBzNLr/B74N2G23wJGUSJdrA8hXEbYKStgWjltdLUOGbjjz+CCdYY6vsutRq+wdlyfQCyQOct7vjiNN9BfDntCbjDuXIKD0a6hpD/iYKX0UI8N/+3WLaS5rRIQmFxrD2+NbihCBI+BjCuEpRMV2QnyqJxb8G12CzRL9h4vCRFCYgCSW8SBfyPO/zj+2PmIY4aR/BREUaJIn1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmB7EnF6gTxsol9oyR8+nGZ90B+sbww2CPO0d3E1iSQ=;
 b=WAbY9RPvTQF2fvu3YCLDTJfxOO9h3YIYhc9kcP3LA5DevT474iaSHPl4OmKUQYoHLHyWUt2OuDTYK73Q3X0sDema+PsmvZPcYGrGzeQfQQcWkuzOJIYzztIcm/G+no3X4BjKIMMX99HuCUK1yMoxtGQyaZsCvzYZuB8EBPvAt9XZfvaDyeLgmyVkWjoc3WH/TYYgQ1aE06PIbjzn2Dt3wyCbAkm/Kt1y0mspdKKdtvOe7GUB2148cJZ1DGV+wSIWBMdurOs3yeAqZ2dAwVwzhppzfg9SLbm5+ScLWyjD9B3+XbrE8bKINz237ipMl1oZGpL3EYXtv4RBx8bxHMRLng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmB7EnF6gTxsol9oyR8+nGZ90B+sbww2CPO0d3E1iSQ=;
 b=VIfFKsoCRQLXSCVonvSdUBeO50fH7p9y5EOnVYK6rhWDQ2g3l8znFj9RfHsfukz3fPCzPMc/G3fWBi7HxhF6SPGcL6SMXV53lzXnxfJnx8BwArJSKoiKeETk5mugoB+r1tGpayRg9y5O+f2vcuoRGM2k5FdtGOXFQMxsz4uMNWA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bac1b0e91aefa273
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mrwq+j50pKQDtQqEiZ5B18ahfQw19QUiHJhyB0eWRKcZX9cKm1obg0MBX6YVSuidrcV6Tpuab5Z4hOKAp6j67QRSOUG2kD4c6y2gfnOhL9fcrwOObaMuG34GFiQ2D4Y9fRlqwKEU3pumbdd3fAhCJ704OL3XPiSMIPHUDQCIpMT8EX9jB0Z0QDvMnoDgR6RsrjPju3t+RszJNjQgfy6ZU0aSNNgzPlJsBq8p5d8BBW0y4DUHgEQCVar12Ueu9WDwp/qI73cz/3Yp0r6IqgTj3VjbmSTh97OQ9F8nfofDLcfPbk6aqReMT3yAPyMPkB0cZ6hE4sNF/3yvZw8g1rLJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmB7EnF6gTxsol9oyR8+nGZ90B+sbww2CPO0d3E1iSQ=;
 b=aMNP8WC1ICxEezbN0kYWsIW5ciWzvQxcJKAVDuG6oT5zekaLpHARRQXZkweOT9QycFu//YLpBiYJMrBHLqMSqXwfkdWYjtl75lDKExBBGrvrdIiA/K6b8D9XUnc15cfes2CB2PwgkUff1RstyaJLw7WNwdmWAzJ2ivDu/0c4cmK7SrympHmyUhOjsCLifxFf7hpJNSXtpfUj30D1UyXffVPHSXqAbDlDj8Kj7ymLjjhtzRtOQTo/IniAM4ztUqbOybPj62bBbtjL1YYAdxvIYyUpaQdcStfTKSUzMRhIOER3VQtmggpAx+Y5G3nM2I2u5H8Epb3giKHrAMpY/B+gQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmB7EnF6gTxsol9oyR8+nGZ90B+sbww2CPO0d3E1iSQ=;
 b=VIfFKsoCRQLXSCVonvSdUBeO50fH7p9y5EOnVYK6rhWDQ2g3l8znFj9RfHsfukz3fPCzPMc/G3fWBi7HxhF6SPGcL6SMXV53lzXnxfJnx8BwArJSKoiKeETk5mugoB+r1tGpayRg9y5O+f2vcuoRGM2k5FdtGOXFQMxsz4uMNWA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Vipul Suneja <vsuneja63@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: Re: Porting xen on rpi4
Thread-Topic: Porting xen on rpi4
Thread-Index: AQHYt8SgkyOonJ7Wl0ezDHN7orB+v62+Hg2A
Date: Wed, 24 Aug 2022 14:35:46 +0000
Message-ID: <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com>
References:
 <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
In-Reply-To:
 <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 35b7abd2-3230-4ed6-94f3-08da85ddf709
x-ms-traffictypediagnostic:
	AM8PR08MB6625:EE_|DBAEUR03FT024:EE_|DBBPR08MB4411:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TAZEgTDK/TYgvujakBhkXH6U3Wn/qSzOh95o0aJYfkaSlCdhiK0lmOdXY8kmvZ501y2Rtw0/2wztee2kSV8ddiygx56dC5Uh3JXg47NrN+lefm3L5pksBovW6AoM4amAYjN22vBqV8ehjZk439o0GpSJX0KV1v+uZ3KDS4jF9Sl0kDNFgo8aW2tT3nSwPm9riEJKzviTaelAxpITWNVfYnT4BZH1/iZq7oKT3R2oGV6kbLgWt3KoRVs/0ISAxCZoEh3O8MeXKZKLejiIyY2lqdqDPhI2eqF/pCWt/iGEjDwtkTmA9hiceZQX9Nd1jpF7hiR3VwTSjs6VtCrfbM3Gi2LkRThsPUvMjDhNM7JIlqE+j4Krh7UmqVlqRhkaUyC59pJufA8AxLkRIIrkf0Xv+nikajvUhRjq8IhmZnofnbOM9dYvrHFflMNVPm4lGPPGB3XFP8fIrQkKn22ug3c+L+RK/js8DGUly3PcSNEmN0bF6pz2d+wY+CNeChH7XBGVIBZR+YqF3IyKqLzLU0D9t8E+LPUs7Alsa6FCtmHrwpWbByQUEZTkOaRnpUyzhjZ1O5nyOYQSR75pTSQYXlyiSoHSuVKdBLAJ3gUnq+ytVOHAo0vNZhU3eekH7pGm40PPOfm38ey9YWWZZ7saPwWka/bAORR1JV0k5usudRYo1D2EqZk5uyyDBZ4a8BkD3fk/QOjcomiMSY4wRf8IN1sOxHu3AdS/EaeVILQHyffR4x+Ou97cqENR2vOTBy+3Ro/2byjaVEXC0ufqiSrpebfBvp/Wi9poH3ktjXf/vsN+3WI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(6486002)(38070700005)(86362001)(66556008)(66476007)(66946007)(91956017)(76116006)(4326008)(8676002)(64756008)(8936002)(66446008)(2616005)(5660300002)(41300700001)(33656002)(478600001)(186003)(316002)(6506007)(26005)(36756003)(53546011)(38100700002)(6916009)(54906003)(6512007)(122000001)(71200400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DC13989748EC642835EBE91B82A1440@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6625
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c1a099b8-33f9-4e3d-80df-08da85ddee7a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jtFi2dZW3MEyCa8XQwE2mEQ2AOECxCcJgJ9c3wyNvcP9/2geYYwLZ/ldqegVx2S5pnIsLaNOLfG51VQnT8lMp3CkMeWoY0o/BpvqsrbwpCTdhuRXURBaBnYO8j454DWxv6zU/WzcM1soUJlFcPeTC4xTUxWv+3FpWA6nJNfWpbsX3dx1QjG3x4QHesiu/JgZm8/rlQA/S00HDuGpZwFuzAzkJKPB0JmpDa0L3rm8/H1oezcgeYLm09+52/CkRLgZeLEwVjL7lv99543KCpDHC2bILR4Sd15hv0GUyk5R163FUtME3lCbqoa8fc5/rOD0DZA34lHB2pIx5r+ibv1daCyevav/q3j5CL1Cpik/wWBZr9Kl1om2CFa4WKTNN26B4eJsES2NI8C3JZ/YhHW2ENYgr0b6SMt1Wj1NhT98eYTa+yEc07M8WOTUPX9PmOwkLtiEZt2+tBPxHs8P+LdGAsZYUn5S8vJyoYtILhz2a/mY1nMZDt23tQs5Ybyo89NpkNmvTRAtq+QPZg7IlfJF04leTNeCdM2rNShWLA6BKfodgj/tgAH0do3Uesz0t222spXaWVG3+hZs2IOBgxeGujFZThioEhJSTvGyp230be4NnQ9uNJAPNeuIqMmlfUn9tzfCEU0D5HyyO9jy6o51+DcZ4UfUsTwGLx9kSEtklcRWZ3EtW6SU63+jz5zV7YOdsSK4zq6zbh8gf+DUzWu7eiokSoqzpTp9aYfeNQV7rI886YOzcopfQ/RSWXhDRCMcCp/HocOWx9HkPP53kmJykw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966006)(36840700001)(40470700004)(70586007)(4326008)(8936002)(8676002)(70206006)(82740400003)(86362001)(36756003)(54906003)(81166007)(33656002)(36860700001)(356005)(82310400005)(186003)(6512007)(26005)(47076005)(478600001)(41300700001)(6506007)(6486002)(5660300002)(40460700003)(336012)(316002)(40480700001)(53546011)(2616005)(2906002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:36:00.5213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b7abd2-3230-4ed6-94f3-08da85ddf709
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4411

SGkgVmlwdWwsDQoNCj4gT24gMjQgQXVnIDIwMjIsIGF0IDE1OjE2LCBWaXB1bCBTdW5lamEgPHZz
dW5lamE2M0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBJIGFtIHBvcnRpbmcg
eGVuIGh5cGVydmlzb3Igb24gcnBpNCB3aXRoIHlvY3RvIGtpcmtzdG9uZSBzb3VyY2VzLiBGb2xs
b3dlZCB0aGUgYmFzaWMgc3RlcHMgdG8gYnVpbGQgeGVuLWltYWdlLW1pbmltYWwgJiB4ZW4tZ3Vl
c3QtaW1hZ2UtbWluaW1hbC4gSSBjb3VsZCBmbGFzaCBzZCBjYXJkIHdpdGggeGVuIG1pbmltYWwg
aW1hZ2UgJiBjb3VsZCBzZWUgZG9tMCB1cC4gSSBjb3BpZWQgIkltYWdlIiwgInhlbi1ndWVzdC1p
bWFnZS1taW5pbWFsIiAuZXh0MyBmaWxlICYgZ3Vlc3QuY2ZnIHRvICIvaG9tZS9yb290Ii4gQWZ0
ZXIgdGhhdCBjcmVhdGVkIGEgYnJpZGdlIHdpdGggYmVsb3cgc3RlcDoNCj4gDQo+IGtpbGxhbGwg
LVNJR1VTUjIgdWRoY3BjDQo+IGJyY3RsIGFkZGJyIHhlbmJyMA0KPiBicmN0bCBhZGRpZiB4ZW5i
cjAgZXRoMA0KPiBraWxsYWxsIHVkaGNwYw0KPiB1ZGhjcGMgLVIgLWIgLXAgL3Zhci9ydW4vdWRo
Y3BjLnhlbmJyMC5waWQgLWkgeGVuYnIwIA0KPiANCj4gQ291bGQgc2VlIHRoZSB4ZW5icjAgaW50
ZXJmYWNlIHVwLg0KPiBBZnRlciB0aGF0IHdoaWxlIG1vdW50aW5nIHRoZSBndWVzdCBmaWxlIHN5
c3RlbSBpdCBzaG93cyBubyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5IGJ1dCB0aGUgZmlsZSBpcyBh
bHJlYWR5IHRoZXJlLg0KPiANCj4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJy
eXBpNC02NDp+IyBscyAtbA0KPiBbMjM6NDA6MTVdIDxHdWVzdDkwNDY+IC1ydy1yLS1yLS0gICAg
MSByb290ICAgICByb290ICAgICAgMjQ2NTIyODggTWFyICA5IDEyOjM2IEltYWdlDQo+IFsyMzo0
MDoxNV0gPEd1ZXN0OTA0Nj4gLXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgICAg
IDI0NyBNYXIgIDkgMTI6MzcgZ3Vlc3QxLmNmZw0KPiBbMjM6NDA6MTVdIDxHdWVzdDkwNDY+IC1y
dy1yLS1yLS0gICAgMSByb290ICAgICByb290ICAgICA4NjgyMjA5MjggTWFyICA5IDEyOjM5IHhl
bi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02NC5leHQzDQo+IFsyMzo0MDoxNV0g
PEd1ZXN0OTA0Nj4gcm9vdEByYXNwYmVycnlwaTQtNjQ6fiMgY2htb2QgMDc3NyB4ZW4tZ3Vlc3Qt
aW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0Mw0KPiBbMjM6NDA6MTVdIDxHdWVzdDkw
NDY+IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jIGxzIC1sDQo+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0
Nj4gLXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAyNDY1MjI4OCBNYXIgIDkgMTI6
MzYgSW1hZ2UNCj4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiAtcnctci0tci0tICAgIDEgcm9vdCAg
ICAgcm9vdCAgICAgICAgICAgMjQ3IE1hciAgOSAxMjozNyBndWVzdDEuY2ZnDQo+IFsyMzo0MDox
NV0gPEd1ZXN0OTA0Nj4gLXJ3eHJ3eHJ3eCAgICAxIHJvb3QgICAgIHJvb3QgICAgIDg2ODIyMDky
OCBNYXIgIDkgMTI6MzkgeGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4
dDMNCj4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBpNC02NDp+IyBsb3Nl
dHVwIC9kZXYvbG9vcDAgeGVuLWd1ZXN0LWltYWdlLW1pbmltYWwtcmFzcGJlcnJ5cGk0LTY0LmV4
dDMNCj4gWzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiBsb3NldHVwOiB4ZW4tZ3Vlc3QtaW1hZ2UtbWlu
aW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiBb
MjM6NDA6MTVdIDxHdWVzdDkwNDY+IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jIGxvc2V0dXAgL2Rl
di9sb29wMCAvaG9tZS9yb290L3hlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02
NC5leHQzDQo+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gbG9zZXR1cDogL2hvbWUvcm9vdC94ZW4t
Z3Vlc3QtaW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MzogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQ0KPiBbMjM6NDA6MTVdIDxHdWVzdDkwNDY+IHJvb3RAcmFzcGJlcnJ5cGk0LTY0
On4jDQo+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gcm9vdEByYXNwYmVycnlwaTQtNjQ6fiMNCj4g
WzIzOjQwOjE1XSA8R3Vlc3Q5MDQ2PiByb290QHJhc3BiZXJyeXBpNC02NDp+Iw0KPiBbMjM6NDA6
MTVdIDxHdWVzdDkwNDY+IHJvb3RAcmFzcGJlcnJ5cGk0LTY0On4jIGxvc2V0dXAgL2Rldi9sb29w
MCAvaG9tZS9yb290L3hlbi1ndWVzdC1pbWFnZS1taW5pbWFsLXJhc3BiZXJyeXBpNC02NC5leHQz
DQo+IFsyMzo0MDoxNV0gPEd1ZXN0OTA0Nj4gbG9zZXR1cDogL2hvbWUvcm9vdC94ZW4tZ3Vlc3Qt
aW1hZ2UtbWluaW1hbC1yYXNwYmVycnlwaTQtNjQuZXh0MzogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeQ0KDQpXaHkgZG8geW91IHdhbnQgdG8gbW91bnQgdGhlIGZpbGUgc3lzdGVtID8NCg0KQW55
d2F5IHRoaXMgaXMgbm90IHJlbGF0ZWQgdG8gWGVuLCBJIGd1ZXNzIHlvdSBjb3VsZCBzdGFydCB3
aXRob3V0IHhlbiBhbmQgc3RpbGwgbm90IG1hbmFnZSB0byBtb3VudCB0aGUgZmlsZSBsaWtlIHRo
YXQgKGxpbnV4IGNvbmZpZ3VyYXRpb24gaXNzdWUgPykNCg0KV2hhdCBpcyB0aGUgY29udGVudCBv
ZiB5b3UgZ3Vlc3QuY2ZnDQpIb3cgZG8geW91IHdhbnQgdG8gcGFzcyB0aGUgZ3Vlc3Qgcm9vdCBm
aWxlIHN5c3RlbSA/DQoNCllvY3RvIHNob3VsZCBhY3R1YWxseSBnZW5lcmF0ZSBhbiBpbWcgZmls
ZSBhbmQgeW91IGNvdWxkIHVzZSBpdCBieSBoYXZpbmcgc29tZXRoaW5nIGxpa2UgdGhpcyBpbiB5
b3VyIGd1ZXN0LmNmZzoNCmRpc2s9WyJmaWxlOi9ob21lL3Jvb3QvZ3Vlc3QxLmltZyx4dmRhLHfi
gJ1dDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQW55IGlucHV0IG9uIHRoaXMgaXNzdWUg
d2lsbCBiZSByZWFsbHkgaGVscGZ1bCwgZXhwZWN0aW5nIHlvdXIgcmVzcG9uc2UuDQo+IA0KPiBU
aGFua3MgJiBSZWdhcmRzLA0KPiBWaXB1bCBLdW1hcg0KDQo=

