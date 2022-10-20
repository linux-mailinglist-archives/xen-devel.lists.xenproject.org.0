Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1314605820
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 09:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426235.674540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olPk8-0005V8-Fy; Thu, 20 Oct 2022 07:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426235.674540; Thu, 20 Oct 2022 07:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olPk8-0005SK-CQ; Thu, 20 Oct 2022 07:13:28 +0000
Received: by outflank-mailman (input) for mailman id 426235;
 Thu, 20 Oct 2022 07:13:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIjd=2V=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1olPk6-0005SD-4p
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 07:13:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae934fd8-5046-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 09:13:22 +0200 (CEST)
Received: from FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::10)
 by AS8PR08MB7912.eurprd08.prod.outlook.com (2603:10a6:20b:52b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 07:13:11 +0000
Received: from VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::da) by FR3P281CA0165.outlook.office365.com
 (2603:10a6:d10:a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.18 via Frontend
 Transport; Thu, 20 Oct 2022 07:13:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT021.mail.protection.outlook.com (100.127.144.91) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Thu, 20 Oct 2022 07:13:11 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Thu, 20 Oct 2022 07:13:10 +0000
Received: from 6cf0697e2da6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4E00039-58F1-4459-9878-3F8C5F6673B2.1; 
 Thu, 20 Oct 2022 07:13:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6cf0697e2da6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 07:13:05 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by DB9PR08MB7794.eurprd08.prod.outlook.com (2603:10a6:10:399::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 20 Oct
 2022 07:13:02 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d793:e6d8:6250:d00c]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d793:e6d8:6250:d00c%6]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 07:13:02 +0000
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
X-Inumbo-ID: ae934fd8-5046-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KQ8XhryxlTP/ucCbHUvPRh3rxe/38UY/a5WF887xJtGYCFvqL/ZCHLaaPaOGrxnkM4pvMDqzUi4U7dt+3OI3ZaQScFW7iiOuasCEZh4Tt4phjYQH/8WIJlEh0L3eWrLasguPmhfsdUxqm+2iKSt29uEDNA/RfjACmzURf7/ZmfK2NQpnj2RFyMc/FNQo+XHKNdtjdsfZtVAkqdypKv+mzNEVZTyoVbr6KG2Hg5nPHhRHP+/xZ6FJALA8tSGXBkXABwnkB7Aq2d4T2ZdRCT7RR4Zow6YMgTJKujSUo+2UHbOYn8/nPdd7V2KaWrmhL43uOOv4ZaLEEmHUByQ5j0MsEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyKUoMVuybSfdp647m3UxF7ky7nzDGlllppVmGA5Hsk=;
 b=bvwKa6Tlqzqystg5Q97COCVKi+C0rOCVLYbFbLlkavZxECn6NgPGndxPiJZ47kifbOFn2uOPKHYV6+1HS7vTL8uBWR3G+Wl+UE/ShLXYF8WGi0hEmrJHURqOVHZtolvdqdG9uSBJryUvyECj4yXsacKBJSSPUv5LCvoVi+jCb+cb9xqWd0cC6n01EWPpa+l5mMvRQLtFpxOkZT4NlZSRc/3nQK8XuMt/IKjxE3HcNBZCy0k9VDo1TD6o0sPVGFJDLyiOKozspdA+ee5KLrFOsFmxhcZRvADhXNLoz8O6Mdi2N4p+ZDtzqZaM0pmTDDgW7aOF7f2zyRzm39XKjjQzSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyKUoMVuybSfdp647m3UxF7ky7nzDGlllppVmGA5Hsk=;
 b=YzkF2tyOyjt+3HMu3DUWsN04Wp9MEGAlDh9VL0HMsBXyvBRZO61hMuye/3rW7cYfcP3IWTSUegTs9K/0RvTD3FeoBn/gk9VUqYT6fEpUXnK7M8oU0ZgjP8T8SnikGHNu3PVcutmS62uwgZBaaN5v+d49vKfh3R1SMn+FN3k4PCU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkljyGTTI7CCCgt0Kld2zNEeCSqrwKd1IPO8VQNPVDyhG8fXVu0KXwv4/uIj58hREHWFObcSH13cSnAhNfcNVHtn4E5IXVN8RhdwEs0BQYPMLgIKemqrU2nzdulE9bwVoZvKJLXKRzo+kDi47VlSmyebKQQE2+fE1Lu8RpA7CWxW7Ych+c7R/8g4Rc3FHB5BtsrJYU6lzrj9zM6d+eSdbHScSC8kdnBOsPCZCtGauBMiX5d4MWl10Rn6nLZgNMhi4+QZAHUZ4qy63+uGK8ftzdaJKNJ4YdPhN/ASCN4GuEaNr2Rxv7MXUR03W//lQInHlaCktbB4SiglGrFPsj4i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyKUoMVuybSfdp647m3UxF7ky7nzDGlllppVmGA5Hsk=;
 b=gBPclVpJw6hzHfevuTLBPHIQ6Z3sjh/6jLYpqFvbowqXSvbUSVxcp/FG9559naskmFfjdxxveQLzrQsHz5RY6dkdzlloij6VwAToMZK/IvwieDAEZ2wXwnBhCkQmjewUB+srbF5dfW9Bd1VgLD1Sa/57FjT1Tss6HM0mdkLGrd0F0AaTm2PneEmpULGJ1oXLYDAYIfFI40OhoytaCbnPzHngxpC0YTofGT6O/9OFXAI3a734qmaS9kT7N9QlKENG1Epz55dJxHt1iyLBu5RaqEyVLWnuMV4wyinH8/jYEY1gTaIt5HQML5rCK0tsvAsoojUAg188oY0OrPTEYI8Ccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyKUoMVuybSfdp647m3UxF7ky7nzDGlllppVmGA5Hsk=;
 b=YzkF2tyOyjt+3HMu3DUWsN04Wp9MEGAlDh9VL0HMsBXyvBRZO61hMuye/3rW7cYfcP3IWTSUegTs9K/0RvTD3FeoBn/gk9VUqYT6fEpUXnK7M8oU0ZgjP8T8SnikGHNu3PVcutmS62uwgZBaaN5v+d49vKfh3R1SMn+FN3k4PCU=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH v3 05/10] automation: Add Arm containers to containerize
 script
Thread-Topic: [PATCH v3 05/10] automation: Add Arm containers to containerize
 script
Thread-Index: AQHY0lZFu/mKHMVlEk6rDAaZCITsX64Ws3HQgABK2QCAAAFz0A==
Date: Thu, 20 Oct 2022 07:13:02 +0000
Message-ID:
 <AS8PR08MB769676050B41BCEDCA3F2891922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
 <20220927094727.12762-6-michal.orzel@amd.com>
 <AS8PR08MB7696D8C9D2239CC9ED2FE08F922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <bc41f3a0-27ec-8bbe-a087-125acc20df2f@amd.com>
In-Reply-To: <bc41f3a0-27ec-8bbe-a087-125acc20df2f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CFA5B327AFA34147A0B8048A9BF68C90.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|DB9PR08MB7794:EE_|VI1EUR03FT021:EE_|AS8PR08MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f624a2-b16d-4dc7-6d78-08dab26a8c24
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fAiu6ikI9VcUr88CIz0Ho2l6E+ggQsqQDFTXdoL8KkxYPfpwKXykjI4zD2NMkuxw0zs8+u9L3vlQq3FdtOAOs9TE4XVarwcaQepv+wkjKX2ra8KVpZ7mo9eLc9ieNHjYGXoCIKNNThl8hcvHCVF6JwkUnQr2inCVB/YnY23vfldYScKjtHlk7fNx3yZGGpRGoeMbSS5faUO5hzxH4tzLYlZGONw9pAAAzMrMAoSD4zkBD+kF2eYAvVRLrMD/65iiG9PUR4Xm601UB+DQydOFdsVfwwZtDgZH5J9gm+3h3e1oGswZy6MTYfSFyjwrRQew8V794FRiUZKdSA4vl1MmG7sPUyFxEvCuQeAhkFWanoZk5cozoepbj9KFw+5MV5Na/lt87mvZ0x8CgxNaFKFYVOIUX3os9yGsWepz0QXiuCh+n/eFB1mkc+LQyGdRYEf8EbqCgCME5LbqKqFFsCD/Sm/26cscNBD4CwteJfqhhWefBMDubT+LFGkzLjC9cvb5gBB6m1OYF0pS6WxB5cbIV06oqNth2D5gg8WxiAwelb7ckQzB1+Rof+fDmHDYrHSTSq0l0D1pFC/eyxL9RgmrGfL6qVeN6mbez4knyu2cwAr3WiOjmtX+W/efQReWZtmtJ2bKux+zSulw9W8JvUezVr80XNwG/A1rY6Zdn/IzRA1Lomd93FsPPPT75C4FqNK1tAR2QJAhd8IWDRSBUMN8pfIDhQL5ZLBtzw7kgVHwdWUe5lrtUuBYI5hhT9JclsuZBS5oz8FNvOB3MTq1Ekg6UNk3lclfwJUypke5b9F5ml0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199015)(66446008)(84970400001)(316002)(110136005)(66476007)(76116006)(64756008)(55016003)(4326008)(41300700001)(66556008)(38100700002)(8676002)(54906003)(71200400001)(7696005)(33656002)(66946007)(122000001)(38070700005)(186003)(53546011)(26005)(478600001)(86362001)(6506007)(9686003)(83380400001)(2906002)(52536014)(5660300002)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7794
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f124069a-f591-425d-74d4-08dab26a86d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s6zSVsVyvx1rjg8KFJA4OJFUZzdRpin5LZ8sSghuS3iN2UY6bC5uLU2tkzUCJuEadY8PWE8hw1NH0hjenl/eWQjZOv2vx/Y5WuJeuMDfQ3rG5wSxZDvGL1HjSoiipHGWKAfpDu35tUzn+tchEWBKvgGRhG1TGe/cRGmmEc/Zyy5EvdlpvzL+TYdQkTtjps2F7tLWGPWjslslOQcgttqdxokpgQxHoOWf4ymogeaQGTxPTmW6jPCOL6cTHftKxJ4boKt4X77TyGuRWw+S7pKDcS2W4crmAOnM9spnBDKKns+y797h0qi5v/LtPb16e1S4BB+o6t0mB2zetH1gJD4eZzvoJX4NeNekhDt1dO0mbVLGpmI3d5jEQ96Ai6cw9SIM9Hi5Cvijbyy/YjHl9GcoOyOYhGqLDFRMqgC02ih5UpJRjMYuEKqz3QyfLmEsE6quTwP0809DvLzn3P/zD4f2SqP4C0UmVJtpuJ8LyXCuHNFSp2QnEdRB1DceoC0HuGUk58UF9GHYY+3LHih97WFeWMqePL7BjM3WVTJUQMwabhfJYsvhnDyKUZtwdzk1J3oFWDRfBxyfb885BahCAFhaYcAiwXOxLnWvh5/1b/NWzmpl+FbiHe0oe/3DBzSla1EgpXDmYyrz5a9ZS4EoDPhL3NMYvtxx6/xisy3eYU0oboOeet8mUJoieaGiCi9EWVNnFmxqS7smnZ166Sq5SMEleZbXvYosl4xX7UrdiHPPuP2mt1yjPwnLPS+0YX1ogX8D6No+65eKvAVg5T/A0RLzGm7tn6ZKy1030JdhH/1yOKU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(81166007)(356005)(47076005)(9686003)(52536014)(86362001)(5660300002)(6506007)(8676002)(8936002)(41300700001)(26005)(70206006)(70586007)(53546011)(7696005)(40480700001)(4326008)(55016003)(40460700003)(2906002)(336012)(110136005)(82310400005)(54906003)(33656002)(186003)(316002)(36860700001)(107886003)(84970400001)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 07:13:11.2727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f624a2-b16d-4dc7-6d78-08dab26a8c24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7912

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVy
IDIwLCAyMDIyIDI6NTkgUE0NCj4gVG86IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT47
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogRG91ZyBHb2xkc3RlaW4gPGNh
cmRvZUBjYXJkb2UuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA1LzEwXSBhdXRvbWF0aW9uOiBBZGQg
QXJtIGNvbnRhaW5lcnMgdG8NCj4gY29udGFpbmVyaXplIHNjcmlwdA0KPiANCj4gSGkgSmlhbWVp
LA0KPiANCj4gT24gMjAvMTAvMjAyMiAwNTowMCwgSmlhbWVpIFhpZSB3cm90ZToNCj4gPg0KPiA+
DQo+ID4gSGkgTWljaGFsLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5v
cmc+IE9uIEJlaGFsZiBPZg0KPiA+PiBNaWNoYWwgT3J6ZWwNCj4gPj4gU2VudDogVHVlc2RheSwg
U2VwdGVtYmVyIDI3LCAyMDIyIDU6NDcgUE0NCj4gPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiA+PiBDYzogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT47
IERvdWcgR29sZHN0ZWluDQo+ID4+IDxjYXJkb2VAY2FyZG9lLmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPj4gU3ViamVjdDogW1BBVENIIHYzIDA1
LzEwXSBhdXRvbWF0aW9uOiBBZGQgQXJtIGNvbnRhaW5lcnMgdG8NCj4gY29udGFpbmVyaXplDQo+
ID4+IHNjcmlwdA0KPiA+Pg0KPiA+PiBTY3JpcHQgYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5l
cml6ZSBtYWtlcyBpdCBlYXN5IHRvIGJ1aWxkIFhlbiB3aXRoaW4NCj4gPj4gcHJlZGVmaW5lZCBj
b250YWluZXJzIGZyb20gZ2l0bGFiIGNvbnRhaW5lciByZWdpc3RyeS4gVGhpcyBzY3JpcHQgaXMN
Cj4gPj4gY3VycmVudGx5IG1pc3NpbmcgdGhlIGhlbHBlcnMgdG8gc2VsZWN0IEFybSBjb250YWlu
ZXJzLCBzbyBwb3B1bGF0ZSB0aGUNCj4gPj4gbmVjZXNzYXJ5IGVudHJpZXMuDQo+ID4+DQo+ID4+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4+
IEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+
ID4+IC0tLQ0KPiANCj4gPg0KPiA+IFtKaWFtZWkgWGllXQ0KPiA+IEkgd29uZGVyIGlmIGFuIGRl
ZmF1bHQgY29udGFpbmVyIGZvciBhcm0gY2FuIGJlIGFkZGVkLiBGb3IgZXhhbXBsZSwgIGlmDQo+
ID4gICJDT05UQUlORVI9YXJtNjQgYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZSBiYXNo
IiwNCj4gPiAgc2V0IHRoZSBkZWZhdWx0IENPTlRBSU5FUiBhcyAicmVnaXN0cnkuZ2l0bGFiLmNv
bS94ZW4tDQo+IHByb2plY3QveGVuL2FscGluZTozLjEyLWFybTY0djgiDQo+ID4NCj4gDQo+IEl0
IGNhbiBiZSBhZGRlZCBkb2luZyB0aGUgZm9sbG93aW5nOg0KPiANCj4gZGlmZiAtLWdpdCBhL2F1
dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUNCj4gYi9hdXRvbWF0aW9uL3NjcmlwdHMvY29u
dGFpbmVyaXplDQo+IGluZGV4IDBmNDY0NWM0Y2NjYi4uYjM5NWJkMzU5ZWNmIDEwMDc1NQ0KPiAt
LS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplDQo+ICsrKyBiL2F1dG9tYXRpb24v
c2NyaXB0cy9jb250YWluZXJpemUNCj4gQEAgLTI1LDcgKzI1LDcgQEAgZGllKCkgew0KPiAgQkFT
RT0icmVnaXN0cnkuZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4iDQo+ICBjYXNlICJfJHtDT05U
QUlORVJ9IiBpbg0KPiAgICAgIF9hbHBpbmUpIENPTlRBSU5FUj0iJHtCQVNFfS9hbHBpbmU6My4x
MiIgOzsNCj4gLSAgICBfYWxwaW5lLWFybTY0djgpIENPTlRBSU5FUj0iJHtCQVNFfS9hbHBpbmU6
My4xMi1hcm02NHY4IiA7Ow0KPiArICAgIF9hbHBpbmUtYXJtNjR2OHxfYXJtNjQpIENPTlRBSU5F
Uj0iJHtCQVNFfS9hbHBpbmU6My4xMi1hcm02NHY4IiA7Ow0KPiAgICAgIF9hcmNobGludXh8X2Fy
Y2gpIENPTlRBSU5FUj0iJHtCQVNFfS9hcmNobGludXg6Y3VycmVudCIgOzsNCj4gICAgICBfcmlz
Y3Y2NCkgQ09OVEFJTkVSPSIke0JBU0V9L2FyY2hsaW51eDpyaXNjdjY0IiA7Ow0KPiAgICAgIF9j
ZW50b3M3KSBDT05UQUlORVI9IiR7QkFTRX0vY2VudG9zOjciIDs7DQo+IA0KPiBUaGUgcXVlc3Rp
b24gaXMgd2hldGhlciBpdCB3b3VsZCBiZSBiZW5lZmljaWFsLiBBZnRlciBhbGwgeW91IHdvdWxk
IHN0aWxsIG5lZWQNCj4gdG8NCj4gdHlwZSBDT05UQUlORVI9YXJtNjQsIHdoZXJlYXMgYXQgdGhl
IG1vbWVudCwgeW91IG5lZWQgdG8gdHlwZQ0KPiBDT05UQUlORVI9YWxwaW5lLWFybTY0djguDQo+
IFRCSCBJJ20gbm90IHN1cmUgaXQgaXMgaW1wcm92aW5nIGFueXRoaW5nICg/KS4NCj4gDQo+IH5N
aWNoYWwNCltKaWFtZWkgWGllXSANCkkgYW0gbm90IHN1cmUgYWJvdXQgdGhpcyBlaXRoZXIuICBJ
IGFkZGVkIHNvbWV0aGluZyBsaWtlIGJlbG93IGYgdG8gcnVuIGl0IG9uIGFybTY0IG1hY2hpbmUu
ICAgQnV0IGl0ICBkaWRuJ3QgdGFrZSAicnVubmluZyBjb250YWluZXIgZm9yIGEgZGlmZmVyZW50
IGFyY2hpdGVjdHVyZSIgaW50byBjb25zaWRlcmF0aW9uLg0KDQotLS0gYS9hdXRvbWF0aW9uL3Nj
cmlwdHMvY29udGFpbmVyaXplDQorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXpl
DQpAQCAtMTgsNiArMTgsMTIgQEAgZGllKCkgew0KICAgICBleGl0IDENCiB9DQoNCisjIFRoZXJl
IGFyZSB0d28gY29udGFpbmVycyB0aGF0IGNhbiBydW4gb24gYWFyY2g2NCwgdW5zdGFibGUgYW5k
IGFscGluZS4NCisjIFNldCB0aGUgZGVmYXVsdCBjb250YWluZXIgdG8gYWxwaW5lIGZvciBhYXJj
aDY0DQoraWYgW1sgJCh1bmFtZSAtbSkgPSAiYWFyY2g2NCIgJiYgLXogJHtDT05UQUlORVJ9IF1d
OyB0aGVuDQorICAgIENPTlRBSU5FUj0iYWxwaW5lIg0KK2ZpDQorDQogIw0KICMgVGhlIGNhbGxl
ciBpcyBleHBlY3RlZCB0byBvdmVycmlkZSB0aGUgQ09OVEFJTkVSIGVudmlyb25tZW50DQogIyB2
YXJpYWJsZSB3aXRoIHRoZSBjb250YWluZXIgdGhleSB3aXNoIHRvIGxhdW5jaC4NCkBAIC00MSw2
ICs0NywxMSBAQCBjYXNlICJfJHtDT05UQUlORVJ9IiBpbg0KICAgICBfb3BlbnN1c2UtdHVtYmxl
d2VlZHxfdHVtYmxld2VlZCkgQ09OVEFJTkVSPSIke0JBU0V9L3N1c2U6b3BlbnN1c2UtdHVtYmxl
d2VlZCIgOzsNCiBlc2FjDQoNCisjIENvbnRhaW5lcnMgZm9yIGFhcmNoNjQgaGF2ZSBhIHN1Zml4
ICItYXJtNjR2OCINCitpZiBbWyAkKHVuYW1lIC1tKSA9ICJhYXJjaDY0IiBdXTsgdGhlbg0KKyAg
ICBDT05UQUlORVI9IiR7Q09OVEFJTkVSfS1hcm02NHY4Ig0KK2ZpDQorDQogIyBVc2UgdGhpcyB2
YXJpYWJsZSB0byBjb250cm9sIHdoZXRoZXIgcm9vdCBzaG91bGQgYmUgdXNlZA0KIGNhc2UgIl8k
e0NPTlRBSU5FUl9VSUQwfSIgaW4NCiAgICAgXzEpICAgdXNlcmFyZz0gOzsNCg0KDQpCZXN0IHdp
c2hlcw0KSmlhbWVpIFhpZQ0KDQoNCg==

