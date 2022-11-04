Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E192E619230
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437366.691702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrTA-0001Dh-Vk; Fri, 04 Nov 2022 07:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437366.691702; Fri, 04 Nov 2022 07:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrTA-0001AE-Qb; Fri, 04 Nov 2022 07:50:28 +0000
Received: by outflank-mailman (input) for mailman id 437366;
 Fri, 04 Nov 2022 07:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKjc=3E=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqrT9-0001A8-Lo
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:50:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57cc5878-5c15-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 08:50:25 +0100 (CET)
Received: from DB8P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::19)
 by GV1PR08MB7705.eurprd08.prod.outlook.com (2603:10a6:150:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Fri, 4 Nov
 2022 07:50:23 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::49) by DB8P191CA0009.outlook.office365.com
 (2603:10a6:10:130::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 07:50:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 07:50:22 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 04 Nov 2022 07:50:22 +0000
Received: from d9fefd09a3a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 092FC9F6-EDFA-4EDC-A078-C3B88C7FC8DA.1; 
 Fri, 04 Nov 2022 07:50:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9fefd09a3a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 07:50:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6195.eurprd08.prod.outlook.com (2603:10a6:20b:284::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 07:50:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5813.008; Fri, 4 Nov 2022
 07:50:14 +0000
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
X-Inumbo-ID: 57cc5878-5c15-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Zgk2x3/Ube8QIbjF8Xo4QnWHNL1W5gCs5qUyjVTevjdW8TVEKSehzLG/yuIAuFQgcHg92vONS1vXfKcvF0vFNNd8pFzwL240/VMwvZLQqLIkVKd7oOZn2BJGK4EOKembxSeDuncXMxpAQGzEyrZRWG0oItYgWC4wQ7E0PXG0LaAzlRs8L2Nw9cCHEWbVkhCRK+gSgvB+Ue5EdU4fdMJheG4ydRXf4elJDiTEso//jZbfpEky3McFMlcMW70d0t72AEALe32lZ7l1H7hpnf2PIQ1sgMDZ2SCBpCthTCabYFIl6IJC+ZJuL3W3h4LlcBSj7fXywtJMZgRwbzxC7hmsRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tr28D0lVckUdVYnULxk2x8HjYGl7wCoR+ujYrNYY4U=;
 b=jKfBMgMdFzFPrpQHlxl4nuB05xvLQrB42V1q+Z8W+RN2SGdgS0TX0pM+Mge8sO61RsS5kpXpqpgolKV5lY/VcJn2Gh+7j0k56ml5wVymQX3S5LznlrF7NsHwbcL6ew7mgVQOuq93Gx3yS9YlKv8c4QRrwBip/1d7ifrndgfldi/j05E2pRxh71S4YMSO92JXkgoA34k4zWJGRaJZL+OgwObvkaouRszj2z+GFcMf7+ygRXfT0fcE6ICbuTblM/ua0YjrquSx2aRK6kLClrSXHYx4Y1kLoscIWad6JI/zvZEf6MqHgVB1D16jXkOmZfxf0Cv6f/Njy4e+vCAFBo2ihw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tr28D0lVckUdVYnULxk2x8HjYGl7wCoR+ujYrNYY4U=;
 b=mBuTn4cwBByz9WNk3Y2NenI/iGaiSvEGOK/D9liZ5iJlp1a0Spn9xoG7lb5Ye4tL1EUHdIiF2geesfLEDCSMWzQ81Jb+1pb6NufJkY38M1L9gXvzGdwIRakjYXLe/g5xomxh4OTCAJwj1WPGjTZhGI2Em8QRUwc02V0LywDXn9E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr1ioL8xCjjdjAvZDpOm5lKUiK+E8scwAd+4EiB2rVYFSGhSYnccZpsYtG3CCh6+ZPlR/GETWxm6r6VgacjUsFcvgAdK8GpR5u1KsQTywv3DtOnj9IzXGrgiw4Bzmqs4gX72a3iM59BrJ/pPVRlV87s5lQgynzniDDiajvPiOLEUZGLUNSFFMzegQTpaTPhhgnlDNfw1MnGA53hKsATPOx7tD2omuo6krF2spn2KEAGp971deAha8ZRc+aSPkzRYnyId7aO/TxicnCPnfEGoHNIxbfV2DvGyDMMXPmblxCh2qRBrwHJXi/GEScbtm6k/xkqzq+9QuFSfRYM3maJCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tr28D0lVckUdVYnULxk2x8HjYGl7wCoR+ujYrNYY4U=;
 b=dfY9kT0rPLltG1TRE9ARjzRCdIdS6oJU9dwIxtQtbCyhHDCpeJ2kihhib7K4tInxytccoH5+eU6Tmli6AILlddg36FNmgqLFxaKteuD+gMc1RT308OBttg68pxLbuWXYJWia/bM/CoS/jJbgtbfFRFBp4zs6rlr6ZIXG+NfjyDo9mNfl0nTyioPNX2vB9qmGcMCXO0Tom7hSXz1a9WAHpibTh+pclZuv9DfrL9gUu4oHVeESRVbyasQ4RJfob+rbbslgmB+gLdipL0gTot6pg2KgSt7RP/ehJp+GYlDigI8XQkI13kn7MwA/yeTRCV35rJTy2FEymd+m+J/T4H/Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tr28D0lVckUdVYnULxk2x8HjYGl7wCoR+ujYrNYY4U=;
 b=mBuTn4cwBByz9WNk3Y2NenI/iGaiSvEGOK/D9liZ5iJlp1a0Spn9xoG7lb5Ye4tL1EUHdIiF2geesfLEDCSMWzQ81Jb+1pb6NufJkY38M1L9gXvzGdwIRakjYXLe/g5xomxh4OTCAJwj1WPGjTZhGI2Em8QRUwc02V0LywDXn9E=
From: Henry Wang <Henry.Wang@arm.com>
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "mengxu@cis.upenn.edu"
	<mengxu@cis.upenn.edu>
Subject: RE: [PATCH-for-4.17 v3] xen/sched: migrate timers to correct cpus
 after suspend
Thread-Topic: [PATCH-for-4.17 v3] xen/sched: migrate timers to correct cpus
 after suspend
Thread-Index: AQHY7svnH5/QyAssMEyjfYS0Wh4IB64uZiWAgAAAQXA=
Date: Fri, 4 Nov 2022 07:50:14 +0000
Message-ID:
 <AS8PR08MB79912AF4BEC094E1EE690E93923B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221102150035.4885-1-jgross@suse.com>
 <5321a4ce8c3b450c89938aae90d57d191b3791fa.camel@suse.com>
In-Reply-To: <5321a4ce8c3b450c89938aae90d57d191b3791fa.camel@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 10039125A4E2924C84DDB7598FA734B2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6195:EE_|DBAEUR03FT019:EE_|GV1PR08MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fcc1447-b987-439d-5208-08dabe393a6f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HXZ2Nti0CAsbnw99oc/7njcXZJAWHgM4Oyq2NpIiG9Ng4tkfMo44DL5xE9nHZiPKjmwg39x8JTi9hEZUgL9a//NPYD0iIikGdrhtTXk8zAyH4sNHXYWE+h9tfrUAHWICRU7OoESCDHWabGdSNKDeog6j/EDB9zEbsPhX9R49pow+eSEbASjNsne8q980MH6ILb9ubOL8ApQQgnYU75+G70uEScJXDNilsX59cq1TvXenIpuR90MtCDz1kq6AGi9OPGsGvuMgcULB9wxvSlVsUWqHufiwWYWQUviAcs9ypzw/AxN3n0AAlVPeBJOJ20NXmeZEcekJlP7ErxLGyvHYMtfBttRtAMelHcd1gBJDvBWD5UWYq/hYbulAccTxESvGOxcNa3R0Co69zyFqUAoJuKr+AmwQmG9juNlbRiJJ6bp2LqzccmhCWwh2JW1jga3kpfZcP7eEg2FptB2GeShqRo9LNjZPKuWfegJ7iCPfXE8XOA95a7LqWgXxD2R/Em5V+nKOsGlm4fumvZhkqaLJd/banjAYo1QPUkaNDfExwsNgssuzWytiaDCD0uqKVfnq/ObAteZX0wPs8PmHftwFCVIU/Bw2+Go+5jey2NGhuQevax36htHARzfhmNo0/y7cA0AaFMU/L1xYZyohYf/CJPe/y1BWSED3mYHlya5qLJWXRx0o4HhyEgVNdtVbgzmeDnC625+aV3Q05KiZiEIOPE7H2IENGBmlecn2I/BsZIs7MJ5NS3+f1jf38PwhOTSZKYpC51gDZ46HOAetzYBGDQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199015)(33656002)(38070700005)(66476007)(66446008)(8936002)(64756008)(55016003)(54906003)(66556008)(71200400001)(4326008)(66946007)(76116006)(316002)(8676002)(478600001)(110136005)(52536014)(83380400001)(41300700001)(5660300002)(15650500001)(186003)(7696005)(9686003)(66574015)(26005)(38100700002)(86362001)(122000001)(6506007)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6195
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fb0ac59-2a0f-47f0-e2ca-08dabe39358c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zUSwh+enMNFACnObGx57d0S7BP04n1NziITMqpbQ3YsnBoQAi8s1rjmKdrhmiE8v1KuBM4WyHgJgkeCsiltMlzG7jXlqJiIBpIkaV+28ci1DL37sUn/PjRbcGrZMwyM/CNY5vPrt2oa7oVmvEh23ygJlWrIQb44eCkW8ksSmt088x120033wsD7RK8XU1p13DbVmgc0jxg5CWOLbmBxTVyqP7TlgCtTnVni5g1WQ8wbP3vP2BmS0hY84VTmxIf9hJZbmLCWpyijT/WWNJ2DFfu/3zd1aRwYyKMouK5ya+0qE6huZnve7oGfNYF6UuRWWoBRXHdDhSJYlyhzRFdS6tYK0dwTXX6LUDkjqCCFS+S/Jian5Yub8zEFmC4QUGkreg+ohiiALi7M24U/6NhcXcXrPmXOnOPXQHWWjh5/MGAb09yYtV95PFcTbT/sc4aOGWazIKhGIMHbjn3FOI7p0rv77szoYpazykwFQ8cHJnY/900v9+y9uhbyVGLbIe1nVtiwfdCz7SBufdKtoyhv7+tV1cvK42u1QvwOxSxcc2sXks2WIzoYXgG9skX4U+xdsh5AIKJxV1eGQIvYNleZZ8boNgd0fn7TVt/1GO8S+9TURfJZryRnaLlo4e97g2W7yoNdFkTO5rUd4BicDcbl3aLxtsTKWSg0K2nB+yOgpKopikVtNJpdbtMVRZ8egvFVzfK3LULK8io9Cq5SNk+p6Mrkjp+uDrS5nzygelOtuJNAqx9jTk+zS17IcgYROdFwKRu1CEuZtjO5quS65YTrM9Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(6506007)(186003)(336012)(2906002)(15650500001)(40460700003)(110136005)(70586007)(82740400003)(107886003)(70206006)(7696005)(4326008)(55016003)(41300700001)(40480700001)(52536014)(8676002)(33656002)(82310400005)(83380400001)(8936002)(54906003)(47076005)(478600001)(66574015)(316002)(26005)(9686003)(86362001)(356005)(36860700001)(81166007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 07:50:22.8977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcc1447-b987-439d-5208-08dabe393a6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7705

SGkgSnVlcmdlbiwNCg0KPiBPbiBXZWQsIDIwMjItMTEtMDIgYXQgMTY6MDAgKzAxMDAsIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6DQo+ID4gVG9kYXkgYWxsIHRpbWVycyBhcmUgbWlncmF0ZWQgdG8gY3B1
IDAgd2hlbiB0aGUgc3lzdGVtIGlzIGJlaW5nDQo+ID4gc3VzcGVuZGVkLiBUaGV5IGFyZSBub3Qg
bWlncmF0ZWQgYmFjayBhZnRlciByZXN1bWluZyB0aGUgc3lzdGVtDQo+ID4gYWdhaW4uDQo+ID4N
Cj4gPiBUaGlzIHJlc3VsdHMgKGF0IGxlYXN0KSB0byB2aXNpYmxlIHByb2JsZW1zIHdpdGggdGhl
IGNyZWRpdA0KPiA+IHNjaGVkdWxlciwNCj4gPiBhcyB0aGUgdGltZXIgaXNuJ3QgaGFuZGxlZCBv
biB0aGUgY3B1IGl0IHdhcyBleHBlY3RlZCB0byBvY2N1ciwgd2hpY2gNCj4gPiB3aWxsIHJlc3Vs
dCBpbiBhbiBBU1NFUlQoKSB0cmlnZ2VyaW5nLiBPdGhlciBtb3JlIHN1YnRsZSBwcm9ibGVtcywN
Cj4gPiBsaWtlDQo+ID4gdW5pbnRlcnJ1cHRlZCBlbG9uZ2F0ZWQgdGltZSBzbGljZXMsIGFyZSBw
cm9iYWJsZS4gVGhlIGxlYXN0IGVmZmVjdA0KPiA+IHdpbGwgYmUgd29yc2UgcGVyZm9ybWFuY2Ug
b24gY3B1IDAgcmVzdWx0aW5nIGZyb20gbW9zdCBzY2hlZHVsaW5nDQo+ID4gcmVsYXRlZCB0aW1l
ciBpbnRlcnJ1cHRzIGhhcHBlbmluZyB0aGVyZSBhZnRlciBzdXNwZW5kL3Jlc3VtZS4NCj4gPg0K
PiA+IEFkZCBtaWdyYXRpbmcgdGhlIHNjaGVkdWxpbmcgcmVsYXRlZCB0aW1lcnMgb2YgYSBzcGVj
aWZpYyBjcHUgZnJvbQ0KPiA+IGNwdQ0KPiA+IDAgYmFjayB0byBpdHMgb3JpZ2luYWwgY3B1IHdo
ZW4gdGhhdCBjcHUgaGFzIGdvbmUgdXAgd2hlbiByZXN1bWluZw0KPiA+IHRoZQ0KPiA+IHN5c3Rl
bS4NCj4gPg0KPiA+IEZpeGVzOiAwNzYzY2QyNjg3ODkgKCJ4ZW4vc2NoZWQ6IGRvbid0IGRpc2Fi
bGUgc2NoZWR1bGVyIG9uIGNwdXMNCj4gPiBkdXJpbmcgc3VzcGVuZCIpDQo+ID4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiA+IFRlc3RlZC1ieTogTWFy
ZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpDQo+ID4gPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xh
Yi5jb20+DQo+ID4NCj4gQWNrZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5j
b20+DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4N
Cg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg==

