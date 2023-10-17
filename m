Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ADE7CB9DC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 06:54:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618026.961228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsc4O-00018N-7Q; Tue, 17 Oct 2023 04:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618026.961228; Tue, 17 Oct 2023 04:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsc4O-000153-4P; Tue, 17 Oct 2023 04:52:40 +0000
Received: by outflank-mailman (input) for mailman id 618026;
 Tue, 17 Oct 2023 04:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhkS=F7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsc4M-00014x-ES
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 04:52:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbadc114-6ca8-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 06:52:33 +0200 (CEST)
Received: from AS9PR04CA0113.eurprd04.prod.outlook.com (2603:10a6:20b:531::18)
 by DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 04:52:00 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:531:cafe::80) by AS9PR04CA0113.outlook.office365.com
 (2603:10a6:20b:531::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 04:52:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 04:51:59 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Tue, 17 Oct 2023 04:51:59 +0000
Received: from 7c9fc06d44bc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D88D0777-F4A7-460F-821F-5F9B9B0F907E.1; 
 Tue, 17 Oct 2023 04:51:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c9fc06d44bc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Oct 2023 04:51:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6511.eurprd08.prod.outlook.com (2603:10a6:102:12d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 04:51:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 04:51:47 +0000
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
X-Inumbo-ID: fbadc114-6ca8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+Hxw/LAMqk42mMNzntNzCelYYsqYo790/5WU4ZC2TI=;
 b=Zhted2+VHm7DIQb383LGfbJZhYCDvQQNSHRcYk5Ipe+P3gIXWVQofIXR4tnNaU+S8RI68Deh1YENXtK/D0zZ7fZhdog5TON1ke7aOu9qojDcHwG5qjzqMMkOFnYZf2S6jkAw4wFo5zGEj0bS24nvADmVfHku2Uih/ZFco9Lr8jU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 928f5e5ff5b6e737
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHZAsP9T/4YCZTi2Rh38gpmTUX7bvRqhSTYm3x6f5bWu7+FytxMaHHk2nzOpay2JkM1qfY8Ctlo9XySusaVmY7pLDJ9viizZy94yRjDHQaAm4m4LSNtKGAbOhFfdsbfiVsF7aOA9TB8M1x0W7PW5Zt7upQh1dEOmXpOvK+TQ+4OWeEZ1TrK+t5CwfY8VbtLfJ7NyU9Yb27q+/243RdQBmWitL65zfttGAI4B0CJRun0JbQENRptwCedE/CGDtUDcBrDMQ9uRkOQHpYjUBBP3KBQrMaBgmCs9KEkyEaAjDx8NUrui4owxOxgKrPtGUUPgzaOjPydDJHvORUL40BGOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+Hxw/LAMqk42mMNzntNzCelYYsqYo790/5WU4ZC2TI=;
 b=IUBS05otb2K3Ngz2D7lMeoXG7B1URnDnryXGeFEhTSirTxmKoHAnevSzAYuopt50UBGCsY4JUP1Sl43utzB7sIImYLNhoxy0cDmyMQk8RNA7byEawJaKGOV1Znt8Ng7WukdfsQ+b5ERdf9ygmQvWNyQ6aM6QXZsD3hclVTaGji4eaihFqtgE+VeabXnz3wDHetcccGZDSecw44pqnRqz6LLHdFHo27RNIK+7n9yYtsaK2shKgFYw3WnOPne04ciYl7uf9xoWc41hG/s65U/Tizuc6fKdFZZArNKCSpGCUx27PJFXsUJ7xYkyACBzPLqslKtr8d/7ei9OEcX0yLqMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+Hxw/LAMqk42mMNzntNzCelYYsqYo790/5WU4ZC2TI=;
 b=Zhted2+VHm7DIQb383LGfbJZhYCDvQQNSHRcYk5Ipe+P3gIXWVQofIXR4tnNaU+S8RI68Deh1YENXtK/D0zZ7fZhdog5TON1ke7aOu9qojDcHwG5qjzqMMkOFnYZf2S6jkAw4wFo5zGEj0bS24nvADmVfHku2Uih/ZFco9Lr8jU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Alexey Klimov <alexey.klimov@linaro.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, "leo.yan@linaro.org" <leo.yan@linaro.org>,
	Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Topic: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Index:
 AQHZ/dCmXXM/mYg9RESbVO2eUQWsBbBMHj+AgABWt4CAAAGnAIAAA6IAgAADAgCAAAYrgIAA7CcA
Date: Tue, 17 Oct 2023 04:51:47 +0000
Message-ID: <E83E6472-891E-45E6-923E-88C0DF69FAEA@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
 <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
In-Reply-To: <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6511:EE_|AM7EUR03FT017:EE_|DU2PR08MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: feb3da59-716d-4ef7-149b-08dbcecccc07
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Lfx3nzqkQufC7ClqYnlDs497ayE9wUIV/yOqvYw5CRKQBjAIRNRHE8uymYDmA2BuJtUG79NVW0PF4UewMLBvZNI47i69X7SNJt+Ni8JyN0vnU/tw2ZmHU/SS99nGksWNPb77NsQxk58ydgTFNqde5ENLYF4l5vvN47swwlZrFKK+OgGdLXyiZ2tT3CzbaeY1a5M6OEBcnOWJ5q5uDRFoEasFvB6qHCRvO//4NO2xjrWDGWxYEHNSmd5ruVAk0vZte/gIXCWBrdSEaIbfdfujolMSky+hwMhomCP5ypV12DmaGh0b0JL7dMXhj0gJn02S0J2AViKidACk9ade3KHmgT/n4LzJnxze8o7//loCmxNjJh71I1f9Guvxg5MhzN8qZ7m9gMPm5rRbU4gPPyNTYU2ZVj0VHc95sKIz+uO2dY//rlXfbBa/I7sgjqksY5a4ERwgzqBerC48N6RYhyvDzkpk3KBs5ZVx4uf5urM2Lvljn89whkbmFzxi3r9dsA5nqK/ZuTTTqOikUlKQfSHGwG4anEQEzQ5hApV87t1pn4jn/jJ09KAS+855GItprbWbX6w9YCj2tehcyWLn0jSFfWoPtFkk0idANM9yvgd1znVH/bBBDknrTD+TEPTmrJ5N60+ST8E5ISKfJTCfeUEzhRyQMSc4UVLtiUfb8ueoOTY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(41300700001)(76116006)(316002)(66946007)(38070700005)(86362001)(71200400001)(66476007)(38100700002)(53546011)(122000001)(110136005)(54906003)(6506007)(64756008)(6512007)(66556008)(91956017)(478600001)(6486002)(66446008)(83380400001)(2616005)(5660300002)(26005)(33656002)(8936002)(36756003)(8676002)(4326008)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1450B443329EC48B16D9673B1307197@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6511
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	544d3818-a66b-435d-3568-08dbceccc4eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d8jMYBn6QH3xfyItX3LUtUOx5FSbOzqjbQPDD4xH8RGpea1gFDm/4RZ8EUX7VPuabnGo+blj+qcvxH2X3u09lhd+2jlrQ3XYT9Wzs3g/eJX5hGpfpmoI/wMnIINv10eBNyAmCtR8+8b42JLB/Q5E1hqnGoZdj3ePxXcofTFgHKq6P71vOvCSDU9V04fSwFKoKCIdTVr1s0mi6y2x1ubqZ846AFv6GhuM6Pupdsw7XoNHkHqg+WmRgYYaUS/WeOwOwErz/KLKeIUKeDOyWTaQgDRxSfH+Iw6fSddu2GBiJeZgvl71PdknQpoLYvKIN5q2DFQss+4hWtWL/3yCxEjscVu6gPgneWf4DsRAtCe/eGTakVE2+3/Q76MWjtvTjmKCxRtHQhA3bn/UeS50qDppYnSJFljWaKKQAICyglgR/I7ZyX5KYbvyxWXWaeh5EYysiEMXdrJIFPbJBMZVY84XLZsvSxwoqFGk8nC4j2IdjqYCf7izwhhSNxLLO+IMPRapS249VLC9dwH6RBHLimD2OhMHRQLPv1X37J7DMGMw/0gjHxhYF9OL52vVmxmetGdarVUNgWsVM4I2rGIrvTAR53BxW83PMUE5jzLpTPCo6pXbL647PAtlAMIGLNPiuAK0Gj79nwSU7B8lden3XOUSdFm2Ydv7SK+qjzOrYeL8vzWVjTDzRSdeHqLAOZabboy7dkeNK78n1J9vAfGdc2EcXf6RmLLoNYKPoWfBxRJXQXqyEX9mU4pMG5SDcUq38MJ08Jojqwc4iKsuxqPhVc+6gw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(82310400011)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(6486002)(356005)(36756003)(81166007)(36860700001)(82740400003)(47076005)(83380400001)(26005)(6506007)(336012)(110136005)(70586007)(70206006)(2616005)(478600001)(54906003)(53546011)(316002)(2906002)(41300700001)(86362001)(8676002)(4326008)(6512007)(33656002)(5660300002)(8936002)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 04:51:59.3942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feb3da59-716d-4ef7-149b-08dbcecccc07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10037

SGkgSnVsaWVuLA0KDQo+IE9uIE9jdCAxNiwgMjAyMywgYXQgMjI6NDYsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gQ0MgSGVucnkNCg0KVGhhbmtzLg0KDQo+IEhp
IEFsZXhleSwNCj4gDQo+IE9uIDE2LzEwLzIwMjMgMTU6MjQsIEFsZXhleSBLbGltb3Ygd3JvdGU6
DQo+PiBPbiBNb24sIDE2IE9jdCAyMDIzIGF0IDE1OjEzLCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZh
bmNlbGx1QGFybS5jb20+IHdyb3RlDQo+Pj4gDQo+Pj4+PiBPbiAxNi8xMC8yMDIzIDA5OjQ0LCBN
aWNoYWwgT3J6ZWwgd3JvdGU6DQo+Pj4+Pj4gT24gMTMvMTAvMjAyMyAxNDoyNiwgTGVvIFlhbiB3
cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBPbiBBRExpbmsgQVZBIHBsYXRmb3Jt
IChBbXBlcmUgQWx0cmEgU29DIHdpdGggMzIgQXJtIE5lb3ZlcnNlIE4xIGNvcmVzKSwNCj4+Pj4+
Pj4gdGhlIHBoeXNpY2FsIG1lbW9yeSByZWdpb25zIGFyZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICBE
UkFNIG1lbW9yeSByZWdpb25zOg0KPj4+Pj4+PiAgICBOb2RlWzBdIFJlZ2lvblswXTogMHgwMDAw
ODAwMDAwMDAgLSAweDAwMDBmZmZmZmZmZg0KPj4+Pj4+PiAgICBOb2RlWzBdIFJlZ2lvblsxXTog
MHgwODAwMDAwMDAwMDAgLSAweDA4MDA3ZmZmZmZmZg0KPj4+Pj4+PiAgICBOb2RlWzBdIFJlZ2lv
blsyXTogMHgwODAxMDAwMDAwMDAgLSAweDA4MDdmZmZmZmZmZg0KPj4+Pj4+PiANCj4+Pj4+Pj4g
VGhlIFVFRkkgbG9hZHMgWGVuIGh5cGVydmlzb3IgYW5kIERUQiBpbnRvIHRoZSBoaWdoIG1lbW9y
eSwgdGhlIGtlcm5lbA0KPj4+Pj4+PiBhbmQgcmFtZGlzayBpbWFnZXMgYXJlIGxvYWRlZCBpbnRv
IHRoZSBsb3cgbWVtb3J5IHNwYWNlOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gIChYRU4pIE1PRFVMRVsw
XTogMDAwMDA4MDdmNmRmMDAwMCAtIDAwMDAwODA3ZjZmM2UwMDAgWGVuDQo+Pj4+Pj4+ICAoWEVO
KSBNT0RVTEVbMV06IDAwMDAwODA3ZjgwNTQwMDAgLSAwMDAwMDgwN2Y4MDU2MDAwIERldmljZSBU
cmVlDQo+Pj4+Pj4+ICAoWEVOKSBNT0RVTEVbMl06IDAwMDAwMDAwZmE4MzQwMDAgLSAwMDAwMDAw
MGZjNWRlMWQ1IFJhbWRpc2sNCj4+Pj4+Pj4gIChYRU4pIE1PRFVMRVszXTogMDAwMDAwMDBmYzVk
ZjAwMCAtIDAwMDAwMDAwZmZiM2Y4MTAgS2VybmVsDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBJbiB0aGlz
IGNhc2UsIHRoZSBYZW4gYmluYXJ5IGlzIGxvYWRlZCBhYm92ZSA4VEIsIHdoaWNoIGV4Y2VlZHMg
dGhlDQo+Pj4+Pj4+IG1heGltdW0gc3VwcG9ydGVkIGlkZW50aXR5IG1hcCBzcGFjZSBvZiAyVEIg
aW4gWGVuLiBDb25zZXF1ZW50bHksIHRoZQ0KPj4+Pj4+PiBzeXN0ZW0gZmFpbHMgdG8gYm9vdC4N
Cj4+Pj4+Pj4gDQo+Pj4+Pj4+IFRoaXMgcGF0Y2ggZW5sYXJnZXMgaWRlbnRpdHkgbWFwIHNwYWNl
IHRvIDEwVEIsIGFsbG93aW5nIG1vZHVsZSBsb2FkaW5nDQo+Pj4+Pj4+IHdpdGhpbiB0aGUgcmFu
Z2Ugb2YgWzB4MCAuLiAweDAwMDAwOWZmX2ZmZmZfZmZmZl0uDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBG
aXhlczogMWM3OGQ3NmI2NyAoInhlbi9hcm02NDogbW06IEludHJvZHVjZSBoZWxwZXJzIHRvIHBy
ZXBhcmUvZW5hYmxlL2Rpc2FibGUiKQ0KPj4+Pj4+IEkgZG9uJ3QgdGhpbmsgYSBmaXhlcyB0YWcg
YXBwbGllcyBoZXJlIGdpdmVuIHRoYXQgMlRCIHdhcyBqdXN0IGEgbnVtYmVyIHdlIGJlbGlldmVk
IGlzIGVub3VnaA0KPj4+Pj4+IGFuZCBhbGwgb2YgdGhpcyBpcyBwbGF0Zm9ybSBkZXBlbmRlbnQu
DQo+Pj4+Pj4gVGhpcyBjYW4gYmUgZHJvcHBlZCBvbiBjb21taXQgaWYgY29tbWl0dGVyIGFncmVl
cw0KPj4+Pj4gWGVuIG1heSBoYXZlIGJvb3RlZCBvbiB0aGF0IHBsYXRmb3JtIGJlZm9yZSBoYW5k
LiBTbyB0aGlzIHdvdWxkIGJlIGNvbnNpZGVyZWQgYSByZWdyZXNzaW9uIGFuZCB0aGVyZWZvcmUg
YSB0YWcgd291bGQgYmUgd2FycmFudC4NCj4+Pj4+IA0KPj4+Pj4gQUZBSUNULCB0aGUgY29tbWl0
IGlzIG9ubHkgcHJlc2VudCBvbiB0aGUgdXBjb21pbmcgNC4xOC4gU28gdGhlIHF1ZXN0aW9uIGlz
IHdoZXRoZXIgWGVuIDQuMTcgYm9vdGVkIG91dC1vZi10aGUtYm94IG9uIEFETGluaz8gSWYgdGhl
IGFuc3dlciBpcyB5ZXMsIHRoZW4gd2UgbmVlZCB0byBhZGQgYSBGaXhlcyB0YWcuIEJ1dCB0aGUg
Y29ycmVjdCBvbmUgd291bGQgYmUNCj4+Pj4+IA0KPj4+PiANCj4+Pj4gQFJhaHVsIG9yIEx1Y2E6
IGNvdWxkIHlvdSBnaXZlIGFuIGFuc3dlciBoZXJlID8NCj4+Pj4gSSBrbm93IHlvdSB1c2VkIFhl
biBvbiBhbiBBVkEgcGxhdGZvcm0gYnV0IHdhcyBpdCBib290aW5nIG91dCBvZiB0aGUgYm94ID8N
Cj4+PiANCj4+PiBJIGNhbuKAmXQgc2F5IGZvciBYZW4gNC4xNywgYnV0IG91ciBuaWdodGx5IGpv
YiBoYXMgcnVuIHN1Y2Nlc3NmdWxseSBvbiBBVkEgZm9yIHRoZSBjb21taXQgNzMwNDA2YWI4MTA5
NDExNWQ5ZmI1Y2EwMGJhOGQ1M2NlYzEyNzliMw0KPj4+IChkb2NzL21pc3JhOiBhZGQgZGV2aWF0
aW9ucy5yc3QgdG8gZG9jdW1lbnQgYWRkaXRpb25hbCBkZXZpYXRpb25zLikNCj4+PiANCj4+PiBX
ZSBhcmUgbm90IGFwcGx5aW5nIGFueSBwYXRjaCBmb3IgaXQgdG8gcnVuIG9uIEFWQS4NCj4+IE1v
c3QgbGlrZWx5IGl0IGlzIGJlY2F1c2UgeW91ciBVRUZJL0JJT1MgZmlybXdhcmUgaXMgMi54LCBm
b3IgaW5zdGFuY2UNCj4+IDIuMDQuMTAwLjA3Lg0KPj4gVGhpcyBmaXggaWYgZm9yIEFWQSBtYWNo
aW5lIHdpdGggb2xkZXIgVUVGSSBmaXJtd2FyZSAxLjA3LjMwMC4wMy4NCj4gDQo+IE9PSSwgd2h5
IG5vdCB1cGRhdGluZyB5b3VyIGZpcm13YXJlPyBJIHdhcyBleHBlY3RpbmcgdGhhdCBpdCB3b3Vs
ZCBhbHNvIGNvbnRhaW4gb3RoZXIgY3JpdGljYWwgZml4ZXMuDQoNCk5vdCBzdXJlIHdoYXQgaXMg
dGhlIHJlYXNvbiBmcm9tIEFsZXhleeKAmXMgc2lkZSwgYnV0IGZyb20gbXkgZXhwZXJpZW5jZSBv
Zg0KdXBkYXRpbmcgQVZBIGZpcm13YXJlLCBpdCBpcyBzb21ldGltZXMgdHJpY2t5IGFzIEkgcmVt
ZW1iZXIgSSBkaWQgNSBib2FyZHMNCnVzaW5nIHRoZSBzYW1lIHNldCBvZiB1cGdyYWRlIGluc3Ry
dWN0aW9ucyBidXQgb25lIGJvYXJkIHdhcyBicmlja2VkDQptYWdpY2FsbHkgZHVyaW5nIHRoaXMg
cHJvZ3Jlc3MgKEZ1bm55IHRoYXQgdGhlIHJlYXNvbiB3aHkgd2UgdXBncmFkZQ0KdGhlIGZpcm13
YXJlIHdhcyB0byBmaXggdGhpcyBpc3N1ZeKApikuIE9uY2UgdGhpcyBoYXBwZW5zLCB0aGUgb25s
eSBtZXRob2QgdG8NCnJlY292ZXIgaXMgdG8gaGF2ZSBhIGRlZGlwcm9nIG9yIHNvbWV0aGluZyBz
aW1pbGFyIHRvIHByb2dyYW0gdGhlIGZsYXNoLg0KSWYgdGhlcmUgaXMgbm8gaGFuZHkgdG9vbHMs
IHRoZW4gdGhlcmUgd291bGQgYmUgYSBwcm9ibGVt4oCmU28gSSB1bmRlcnN0YW5kDQpwZW9wbGUg
bWF5IGRvbuKAmXQgcmVhbGx5IHdhbnQgdG8gZG8gdGhlIHVwZ3JhZGluZywgYnV0IGluZGVlZCBJ
IGFsc28gcmVjb21tZW5kDQp0byB1cGdyYWRlIHRoZSBmaXJtd2FyZS4NCg0KPiANCj4gV2l0aCB0
aGlzIGluIG1pbmQsIEkgYW0gbm93IG1vcmUgaW4gdHdvIG1pbmQgdG8gYXNrIHRvIG1lcmdlIHRo
aXMgcGF0Y2ggaW4gWGVuIDQuMTguIE9uIG9uZSBoYW5kLCBJIHVuZGVyc3RhbmQgaXQgd2lsbCBo
ZWxwIHRvIGJvb3Qgb24gQVZBIG1hY2hpbmUgd2l0aCBhbiBvbGRlciBmaXJtd2FyZS4gQnV0IG9u
IHRoZSBvdGhlciBoYW5kIHRoaXMgaXMgY2hhbmdpbmcgdGhlIG1lbW9yeSBsYXlvdXQgcXVpdGUg
bGF0ZSBpbiB0aGUgcmVsZWFzZS4gVGhlIHJpc2sgc2VlbXMgbGltaXRlZCBiZWNhdXNlIFhlbiBp
cyBub3QgbG9hZGVkIGF0IHRoZSB0b3Agb2YgdGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSAodGhl
cmUgaXMgdGhlIGRpcmVjdG1hcCBhZnRlcndhcmRzKS4NCj4gDQo+IEhlbnJ5IChhcyB0aGUgcmVs
ZWFzZSBtYW5hZ2VyKSBhbmQgb3RoZXJzLCBhbnkgb3BpbmlvbnM/DQoNCkkgdGVzdGVkIHRoaXMg
c2VyaWVzIG9uIHRvcCBvZiB0b2RheeKAmXMgc3RhZ2luZyBpbiBvdXIgQ0kgYW5kIGl0IHNlZW1z
IHRoYXQgdGhpcw0Kc2VyaWVzIGlzIG5vdCBicmVha2luZyBhbnkgYm9hcmRzL2VtdWxhdG9ycyB3
ZSB1c2VkIGZvciB0ZXN0aW5nLCBzbzoNCg0KVGVzdGVkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5X
YW5nQGFybS5jb20+DQoNCkkgc2F3IHlvdSBhbmQgQmVydHJhbmQgaGFkIGEgc2xpZ2h0bHkgZGlm
ZmVyZW50IG9waW5pb24gb24gdGhpcyBhbmQgcHJvYmFibHkNCndlIG5lZWQgU3RlZmFub+KAmXMg
aW5wdXQgdG9vLCBBbnkgaWRlYXMgU3RlZmFubz8NCg0KQnV0IEkgcGVyc29uYWxseSB3b27igJl0
IGJsb2NrIHRoaXMgcGF0Y2gsIHNvIGlmIHRoZSBkaXNjdXNzaW9uIGlzIHNldHRsZWQgdG8NCm1l
cmdlIHRoaXMgdG8gNC4xOCwgZmVlbCBmcmVlOg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBX
YW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

