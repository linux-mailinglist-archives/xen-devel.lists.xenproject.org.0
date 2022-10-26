Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFE60D8FE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 03:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430303.681836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onVek-0006pR-V1; Wed, 26 Oct 2022 01:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430303.681836; Wed, 26 Oct 2022 01:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onVek-0006mW-Qx; Wed, 26 Oct 2022 01:56:34 +0000
Received: by outflank-mailman (input) for mailman id 430303;
 Wed, 26 Oct 2022 01:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NsSF=23=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onVej-0006mB-7u
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 01:56:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140083.outbound.protection.outlook.com [40.107.14.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68fa33c6-54d1-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 03:56:30 +0200 (CEST)
Received: from DB6PR0301CA0089.eurprd03.prod.outlook.com (2603:10a6:6:30::36)
 by AS8PR08MB9525.eurprd08.prod.outlook.com (2603:10a6:20b:61f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Wed, 26 Oct
 2022 01:56:28 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::b9) by DB6PR0301CA0089.outlook.office365.com
 (2603:10a6:6:30::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Wed, 26 Oct 2022 01:56:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 26 Oct 2022 01:56:27 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Wed, 26 Oct 2022 01:56:27 +0000
Received: from 4497f06e85dc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36AD46AA-150F-47E8-9F7C-80FAF72E8E6B.1; 
 Wed, 26 Oct 2022 01:56:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4497f06e85dc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 01:56:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9785.eurprd08.prod.outlook.com (2603:10a6:20b:606::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 01:56:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 01:56:10 +0000
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
X-Inumbo-ID: 68fa33c6-54d1-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Bzb7qUObggB1iV26vWEDD7xbKm2OXcAXbn6GCs5Jvk823Pq6LQVbjXk6vt5heXOeaDBurwcLyH0SNuwdI89pouupR0A4Jd6gbd+EEy7OfN5sR1YtxNESyMWjYowuk32/vUDWn9tO5PyZblD5l83O7YBycNc5zgOzNf7D+MgZYIr9hKY21LlWyJ2JglaCmH7qQiCvvvQ5eBc8LwYh82KymXoZl5LsLB3fpZBfgT6SKwvk5NT7cCwQ65ONNQ/TY22mA2RV+j3edu4CsaO1RRQ480pUizAT/nUIkalz4shLMdLZ4K3hvMwC7ZVvcVv7L8Y4+1OU+aQqUEq5MD2WoXGsvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+RhG1JO8jwhVrvB4DgFAccV0R2dNcyoZg9tnj5yBPE=;
 b=lByF+MIurCVd84v8n90IBmbspHcDFm10ZHLmML1t/XNmmRsetdOKetO9w+M7bfwHylB+mpksVk2eMquMPH/3oF71QsrZoVK9TeNLM1h8jk9RWMntkVmih9swJNzdgTkDZ3vMkaxTqQYoJFqSbOsfJckvAmX04bB/22TstRZRBbSycurTBgOa0keJZ/DGLYKq5tXyo4G4RFqlgJLJZmqrerQ+vdK8OLv41qtpmLM6/dvihjiowROR6y4+Rpp04+BzriKq+Sr20QyDN+0x+8FUexIFT1NnkW8hJ7E9ziHYxR6oNnFpycGKh1SOLFFlwj9yIKke4e3z6bNNkyQRJEgWZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+RhG1JO8jwhVrvB4DgFAccV0R2dNcyoZg9tnj5yBPE=;
 b=qLgv6FtmHBZ1jZyvU17LVuKVZLyCmAhGTjUpmcSIpJPtZ9iBFfFsm3LkEvgYDSpdeiRqx7H/WidSbRNDfy+h9o44gOSPIpr5Zr8szteSnT0TkIPkZa9N5Mj7N9vGIgklOzPHjq2Poup6YB4+r9A/oi+xESNAl2pdwa0vF0ssCeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8+YFz4NXH16KmuF6Y/oFS49+BmXzNZe3yUKDna+c1zShbTIn4tm/f5WdRX3AVPYngPYat3vjBY8YkTY7t4LcUuhSNZh17qVGz5D31DL64lLM1uh4Nm2ZClvnSpsarSYKmUJnHjMi6c9f/X6VeLm67ormiLuFsd4WLYopDPfqsJKxhZeG2AqHc03edclkv1hLvYyRaOWDeEG7ZhRJw20Wn+RBnfW3i00g9+RGISrQG4EFXVeGmfI0Cnqj1vKTUx98r+mvDo23Uc5+5UVcQQeFeKkJjn0ecfc7YBDd/dA2myKmTCqvR8WGG1hbn9WiZrOlbfE1uJG7qwl2K0BvGCRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+RhG1JO8jwhVrvB4DgFAccV0R2dNcyoZg9tnj5yBPE=;
 b=IuDKtP8XoZiLmnLPNzWNdlEuP2pcKLrdOB97lSZ0iu69Tror96ElRysDr+AwkXaEfGAeN5mxi5mZH8zG+vrI+T9OQ0Os5lH2kFEF7C7vFR0sOM82w4SntkTdKRSdcagkF+v5+nKHQFqcjVsUa8N8LW6LcHUPLYULMN9V9Fl+IHXEWq2yQxfy9qUqexljk2RnZtKrDd4Ky/gkDKDbDvmq4TXot988zAieUZqnSqY5WgamP21mIKBffcs6Lle7Hvnth/RDUwJ0bhQwLzMGwKrJZiZQMI6ExWVsluXZHP2yyWQja4dlPbkpUivCMVAEfUtct8RUWQnt1RJvAPJp8xidwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+RhG1JO8jwhVrvB4DgFAccV0R2dNcyoZg9tnj5yBPE=;
 b=qLgv6FtmHBZ1jZyvU17LVuKVZLyCmAhGTjUpmcSIpJPtZ9iBFfFsm3LkEvgYDSpdeiRqx7H/WidSbRNDfy+h9o44gOSPIpr5Zr8szteSnT0TkIPkZa9N5Mj7N9vGIgklOzPHjq2Poup6YB4+r9A/oi+xESNAl2pdwa0vF0ssCeA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "stefanos@xilinx.com"
	<stefanos@xilinx.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Andre Przywara <Andre.Przywara@arm.com>
Subject: RE: [XEN v2] GICv3: Emulate GICR_PENDBASER correctly for 32 bit
 guests
Thread-Topic: [XEN v2] GICv3: Emulate GICR_PENDBASER correctly for 32 bit
 guests
Thread-Index: AQHY598l3BDpzksR8Ui/iytPKb2rYq4fhckAgABmFoA=
Date: Wed, 26 Oct 2022 01:56:09 +0000
Message-ID:
 <AS8PR08MB799168455DA41BC0F789DE7E92309@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221024193002.57888-1-ayankuma@amd.com>
 <05c469e9-8d9a-76ac-016b-400b550dbb68@xen.org>
In-Reply-To: <05c469e9-8d9a-76ac-016b-400b550dbb68@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6B61026833079748B894674426D5DEC3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9785:EE_|DBAEUR03FT065:EE_|AS8PR08MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: 276acebc-b21e-4147-fdb3-08dab6f54b4a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y3htpyhRS5W0Si/T/fx9JRIvdiSnThfaeU1RLmNaXI9OEqXUXR4/MAopKKcjvODl69f9v5VezRj+Z0nKT1H54KHP3n6exD3J9r8dIgJ/lr7boR4TItAtNNhD1Gt4eUo9Xy2pGrnc+MOgo8FslEl+ShW8koyusoc0L3P7SYubP3JS+FbUp2x3qaYMcDE+obXTZioNpFzQsmbdvs9z0pClq6IpmGeoyKE8/4D1aTawjUBWbD25UDaYjArac5a7Of9L5RHJYDmrU7IW5mKephpPYTLYEme9i0n4SKwEM9JF+e6T+bTtF+hOTWMqn6g0HYKmBoakCtUT9tC6zLKkF0s9zIXMD8iEFg/lJBtqS/dD+0P9gtAaETds1NPl/an/CoK49zabLB5IlPQcWAz2JJa0SEhpDlc8dR1LodCcLoYqfSugJmYVDuD5XeJFH1o5wB4FgmPptfRHaS8+dgYeMMuyBVqygO0w3SoXx6YlcJnhGd/JmOeJhtiCGm4ROaYP9gh5TKTnT5xL+d8A6v3Oyr2lU1zRtcTdBSPIzVIZSEd/NZNqaf6rF6FM3KBXhyo1wgMZBzvAdBtrOZiCMsQxM36SymuH9OsqfT59asne82IDynL675gtz/hmaYjXIPXh5ix//FILGXZ9NFhAywAB6kwWjdXSbnIKNUi2Ud6GubcfXoMgxfTdmxhg6FFuY0eqDHeytw1tQ6HPHgIK7TCfaP5LKnQWikCIbAZikRaEN1a251KvDKqgKqMoItD847XwIPE8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199015)(2906002)(64756008)(4744005)(76116006)(66556008)(8676002)(52536014)(54906003)(316002)(66946007)(66446008)(41300700001)(4326008)(66476007)(71200400001)(5660300002)(33656002)(110136005)(55016003)(8936002)(478600001)(83380400001)(38070700005)(122000001)(38100700002)(6506007)(26005)(7696005)(86362001)(186003)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9785
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	321dd137-f3c3-4d9c-d0c3-08dab6f540bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QjOkDWVG4sVwvGrrkqTRO4RhedD7t46dpJBC49s3JT/WNwr8cX1gs5ndK2Dn0dHyyBi6LmdRIzfbNRo81WWedODcwh0bF1LGqrlbb1BsHJ7/6R+MQ4mDl8wSUQVWBX/L6Xzxo8GPpm27HEJgcxQUMfrHEIJlBF1r1h+fiLQVSAjXPx9j41OvDZJE+2+SZgrl7HhDYhkNEvxC+qty6gIA++zxcm5faV5vjWV1y9VCm46BHHviqeSZRMTjZRlt6rK32h4tjTYo4bQpCRD5UmhV87dQj2OzGyp4B2AiF/ss2fmqagr2mb6pujq003Ty909BnxkxAImPHmK4GZzoHuaNSCj1Kb4ji2u8r5G5sqoU5wMER+RKymxnuE6/9ltv1x+sGW1V+cBLLcayOU7h/ig4JsaD9MdBWwIEvvM3tKZStmOL5SOpxHsGchuT/NmsRfFntUXhYyfEPxA1ox+JVSJ4JuUnIMaSOrolwH0UoPnVTEuFcL97yf5UkoiXrsXemHn+0ZhpwX2z/hkb6D4sTfvQit8qbtJYP36JRigyPxWN4LWsoZU0nqxff1LjbcQs4cgu5By+WsQTQG3CYjBtEBYTF2Q5v+eF3zZNPtoomUQa3kqktUBdBgmhxkMmayGIXGZGsH2W9QO2fddRBmiDPh/UlGDcdTiFf62CpAyefPk2Oeg7S9kh5mVw5Rf6zEOhEg65bE+XAaz5rEZSX53s6CzO5QQybRCSN8dC5GVRi++G33B5R7+jiIikGksR8lmA2q7O/RYtJtC1dYlF+woX0VlI3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(2906002)(336012)(4744005)(26005)(9686003)(5660300002)(186003)(41300700001)(8936002)(356005)(81166007)(40480700001)(33656002)(55016003)(86362001)(82310400005)(40460700003)(83380400001)(47076005)(82740400003)(36860700001)(110136005)(54906003)(316002)(478600001)(70206006)(52536014)(8676002)(7696005)(6506007)(4326008)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 01:56:27.2638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 276acebc-b21e-4147-fdb3-08dab6f54b4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9525

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIHYyXSBHSUN2Mzog
RW11bGF0ZSBHSUNSX1BFTkRCQVNFUiBjb3JyZWN0bHkgZm9yIDMyIGJpdA0KPiBndWVzdHMNCj4g
DQo+ICgrSGVucnkpDQo+IA0KPiBIaSBBeWFuLA0KPiANCj4gQWRkaW5nIEhlbnJ5IGJlY2F1c2Ug
dGhpcyBpcyBzb21ldGhpbmcgd2UgcHJvYmFibHkgd2FudCB0byBmaXggaW4gWGVuDQo+IDQuMTcu
IEFGQUlVLCB0aGUgdmFsdWUgaXMgbm90IHVzZWQgYXQgYWxsIGluIFhlbiwgc28gdGhlIHJpc2sg
aXMgbW9zdGx5DQo+IHJldHVybmluZyBhIHdyb25nIHZhbHVlIHRvIGEgZG9tYWluIHVzaW5nIEdJ
Q3YzIElUUyAobm90IG9mZmljaWFsbHkNCj4gc3VwcG9ydGVkIGFuZCBvbmx5IGV4cG9zZSB0byBk
b20wIHNvIGZhcikuIFRoZXJlZm9yZSwgSSB3b3VsZCBzYXkgdGhpcw0KPiBzaG91bGQgYmUgT0sg
dG8gaW5nZXN0IGluIFhlbiA0LjE3Lg0KDQpUaGlzIHNvdW5kcyBnb29kIHRvIG1lICh3aXRoIHlv
dXIgY29tbWVudHMgcHJvcGVybHkgYWRkcmVzc2VkKToNCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVu
cnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQoN
Cg0K

