Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C674625294
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 05:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442307.696393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otLhX-0002Xm-EE; Fri, 11 Nov 2022 04:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442307.696393; Fri, 11 Nov 2022 04:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otLhX-0002Vs-BL; Fri, 11 Nov 2022 04:31:35 +0000
Received: by outflank-mailman (input) for mailman id 442307;
 Fri, 11 Nov 2022 04:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cVjv=3L=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1otLhU-0002Vm-Uy
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 04:31:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2053.outbound.protection.outlook.com [40.107.105.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b68d6ff9-6179-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 05:31:31 +0100 (CET)
Received: from DB8PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:10:be::48)
 by DU2PR08MB9964.eurprd08.prod.outlook.com (2603:10a6:10:499::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 04:31:26 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::d) by DB8PR03CA0035.outlook.office365.com
 (2603:10a6:10:be::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 11 Nov 2022 04:31:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 04:31:26 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 11 Nov 2022 04:31:25 +0000
Received: from aff93b07dbb3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BC1FD9C-E779-45B3-A18F-A219FE485371.1; 
 Fri, 11 Nov 2022 04:31:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aff93b07dbb3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 04:31:15 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by PA4PR08MB7667.eurprd08.prod.outlook.com (2603:10a6:102:264::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Fri, 11 Nov
 2022 04:31:13 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 04:31:12 +0000
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
X-Inumbo-ID: b68d6ff9-6179-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b0hNZuwOyXL3aNpKYGT3qfLgnRpQMi7Wil+skqhxU/LDUTccjj4qS4ZIaNXndEOGNSQuG1Inrt+pjWWUrNYJfvBOhVL8MYX7lqnk2QCIL3mUVFT+CK6YWdQ6cHW7+fy4f5e7t5qZCBF2imPo+xGKHwNSLzgdDArS435PBDCrUqme/RUjHLyupCxls8xZE2SLAeciwrFQUEOmXB35EHV6WiovWuweXDwTGvLBcHleeb9axw7+DxKmcK6SuJudS+IH1/F9wxkcyCFuj21h4r+vL9oCZ8w987K1kxx/mTFu0RxKtouBXnmLLv1p1iJL5piz49Ciko7M89Q+5jLeYPuTXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq3sN+1jEDS2xker+jK8CP5AAX7J6XYXi5NGFWGOaPk=;
 b=Fmg/Y1ctblKGP3KKFOi3JD/DKhWxRk+atqKR4mt8YeWz2JJQ9lm2OhPmew0F6xy9yT6S/3NkyI/By43XOn0sszHNyIeDwTBTUGnRuIR3+a/t38JczE4UzaZ8lA1BuIdSLHCwiDfWQHKJsV0o8XweM5bWV8iGolaK/T2o6beDTHYhW4XHUKv+lxwRboWPZO5Rc7BEjWZl/BZ/HJzv1ypyAK/hrgkWYCa9UUstNfn0OBzP4uUtWUyeuudglISI44OKMPHTyX7gFJ3NyFAI3vicNAOg8rzbJ3FlcY5S2xFaqEaslaw8O1zLOvb2PemNBgzwRc6Zc0yXPCfeaRez3acdLw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yq3sN+1jEDS2xker+jK8CP5AAX7J6XYXi5NGFWGOaPk=;
 b=Kof4cYuM+Ppv2h5O0qp05pPu23dNZaQfMSEZ35XTYIp93jA/obcbGPM+upuSCDJNwLRaoiM7wBc4BEbjOnNxvNIQLCNbRAjGi3/5jFu+DGasu5s3/WzU5o6O/HE7eKCMLcULTiXOYpfar+grYcmB6lerSecywW9gubdC9bNqE7c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAlD8NYdAXrigkJy4MrEZ7Kl6Q8Hq+zgZQlux5hy/CnZQ4TQlA0SAyjP1dXoMAeu7lRj27XWbtmKY99o1jKVIPwKdQ2iM82SbfGQfsyQiuAQ5itmhdoRqCmzjH/dEUhHb1AmHASfz5QjbnYPpCDA+SCA6EIg9Fr0SkX2ORN8+crozzfhRh8vswXnJSJD5VNwKTKB5+V5B0JTZkaf+LEoBBz1Z/4+Dp2tUhdxI7omJhtnoKFHaJnHLpMtAA0ZPrLFe0MdwtnqrwOSthL3aaTa68QCXTqYcWrCsSc1Px7P+zFOIADz8zaApNP6Q05d7oMZZcSfjPpxO9Ord50uVThKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq3sN+1jEDS2xker+jK8CP5AAX7J6XYXi5NGFWGOaPk=;
 b=REmLpxetysRhvPkG0FV+BuWADumGTVxPD7kn+XJDIRAQNcgOsaoVPIRSUHKVqZ3qk/KU4pZ7SxtLTDjOSESWwGgc2c6MnnUhz+WfKKZBri64MnuCQYlkPyYOVgKuMXRG6FRdx1kp6oYfly0TAEjUBUMn9BPg1BOFXm5PA/tXX8r+50GD0a27hys76IlrITuaX7cbpCp1I3OXv8KqFjUdgnOXEo36+ZK9/9I1f82Zk4CIq8XQa/BhcHhGowEqNILVkAzHeAFuMmDDOIwnxF6NHEHGVwfB25cXDSqFKXshoug1YxZYmFSQnPKVmw6QLl5nSB1uNM3a8XCK5XJUwAhs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yq3sN+1jEDS2xker+jK8CP5AAX7J6XYXi5NGFWGOaPk=;
 b=Kof4cYuM+Ppv2h5O0qp05pPu23dNZaQfMSEZ35XTYIp93jA/obcbGPM+upuSCDJNwLRaoiM7wBc4BEbjOnNxvNIQLCNbRAjGi3/5jFu+DGasu5s3/WzU5o6O/HE7eKCMLcULTiXOYpfar+grYcmB6lerSecywW9gubdC9bNqE7c=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>
Subject: RE: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Topic: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Index: Adj0C3U97KqJOGXWTaWwFEv08mPlLwAAvb+AAAFgduAAAlWjgABJlSiAABB0itA=
Date: Fri, 11 Nov 2022 04:31:12 +0000
Message-ID:
 <AS8PR08MB76964D9E2CF5FD8D1BB1A60592009@AS8PR08MB7696.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com>
 <AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <f650683a-c2e6-e282-b32c-52151341ecfb@amd.com>
 <alpine.DEB.2.22.394.2211101231210.50442@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211101231210.50442@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FD6E4A1A982D8D4B92319F9467166F27.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|PA4PR08MB7667:EE_|DBAEUR03FT050:EE_|DU2PR08MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 8005b0c6-cee6-430e-afef-08dac39d9872
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GcZTs4Zjpdv8wNMGVEzuVqUTQkxTs+YV8rosj8sLHf109AxZaKf4DWhv27s+RXkhGQMG6ZI8wekIIl+ExQ2CPzfDawozOuqrpN3XPgrIH+rq0af1nBL8P+dvnBWHYI/ZgeW/Fe1RYA43f+wsJRY/lcK1bPu1Zsnli0fdoJMVLGceWSxA7uA2t91WowRiND0EkN7Fsgc/qg1Jfd/3VuHdMhT9ZGXNMJj/iBXJfVyD68DCP6VIZifCv66xC9bO4ttHRVSHFzwckMrnxUPFgre0XVIp+WlfkgF+sLFy8quP6cI39O9/l72LqRzwd7t74o6v+TENtTcZRhyGYHs7yaURNIafJhuTnBSayNgM4CNL3Zp+5ptC1Tu499Ju3QHqYc6XTqBYT4ne9jBeqU36Maf6XREyB+H2QyoHr2ZyMxpr+JLwh2+u1URRJhYwV6/bsK9dUk4bQk6V6YfTCg39IBs/6dPoIkd8WtL3AAKFwLBB1xnIRCgrtPXAXodIi0zw/pEqZXD36QXsg5X14UKYDN8S+RX8ymSARYG9friHVJ5ITvutxT0h0W8HpsNH3hSvpA2+2Mngi9whc+VmYZftL+f7BVwao+PU6m71lxdJ9pUva9SZWVWyyPWcydlY5hdFrZXSBEmZBhq0XY7QFInp1+ONpwJTC8qQkkDPPETo0+y0z3xT+hJ9s4gEFwIk9ZkoGZL1bqntDCWC+cWnY7UKWLcHIP+e0cXVsSBO3waD9j6EgxsMqiGnfwz3askXNLENrVC7pC22fIsjn15mfbdxiO1Heg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199015)(52536014)(186003)(66899015)(38100700002)(316002)(55016003)(54906003)(45080400002)(110136005)(122000001)(86362001)(38070700005)(33656002)(7696005)(8936002)(83380400001)(2906002)(6506007)(26005)(53546011)(9686003)(41300700001)(478600001)(8676002)(64756008)(5660300002)(71200400001)(76116006)(66946007)(66446008)(66476007)(4326008)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7667
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1923b02-8dc6-4cde-84dd-08dac39d907c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YpFgCSijMgZtXZpn2jZX6NTJzlXnm0JVmL2KKetD5korLOpcQubXaglIBHXwP5jQ8t2tC9Z4c/OM44niYQvxF1Z7v8iWc45t3N0djM5PjKPIrqPnsEop3ELCv12Ed838J81VpOIKmxb045+A5ge5uSa8yl98Xd3Iv/nfx4i9UQwhZQSD2v0L93Z80nFEXnPpcQOpuj9cT8hvu3kLENx9CDwyCRBdIeBce0VWviMnie9kYPkoCRw233pgMGl6zsf5cyXoHtyKyPXbJt/T2h51gKE7pyeg5YdfEt29iIIUzp7TmSZH4Z1JOErERqKLnvfEZMzzQo+WIijqY1JQ+Wry/NFQPSryKJGBVtTNTaWwZBiHrzUC8x4WEg7TA6b3GqovLyBMf6awiQHemTpWBpuPAMwAyhhyCc44n/8s9dswnrynpuF5YDJm3g0gWRtHxa5pWE/qntX6qY2XthDc7Zg2pW1Y09eszUC+D8MRblBycrbdPN1s6xLej9lSQwW0F8LJ3APK4NTQwZyxKnTdQnNee8iitHPNihTvFJTx3j+FGTediMb+gtozv9lpZudkiY24UJNEhvQv7fgZQ1+BEa6YLh5op3ZbqDlS6kkIrpCmNZbXJvHPXzcP4gx0CFyMZcbgBawVedfZI5j/42pCrp/n26IuDQJbqLMKUj0h5pmfOZsaZwax51ALVHEAISKtps2QdZU/0KcXRO5kG1VFErvOkwgu8WEoElGkh1GU3ti3pigO9ZP/Pj1m9o+Dh/hp+SGbaUKud1uhryerSQoOIUr5sA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(82740400003)(66899015)(45080400002)(36860700001)(83380400001)(110136005)(54906003)(40460700003)(9686003)(47076005)(4326008)(8676002)(2906002)(33656002)(70206006)(70586007)(26005)(478600001)(7696005)(40480700001)(81166007)(6506007)(356005)(316002)(41300700001)(53546011)(336012)(52536014)(5660300002)(8936002)(86362001)(55016003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:31:26.1281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8005b0c6-cee6-430e-afef-08dac39d9872
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9964

SGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIg
MTEsIDIwMjIgNDozMyBBTQ0KPiBUbzogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4NCj4gQ2M6IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgV2VpDQo+IENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBCZXJ0cmFu
ZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBqdWxpZW5AeGVuLm9yZzsg
c3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogWGVuIEFybSB2cGwwMTEgVUFS
VCB3aWxsIGNhdXNlIHNlZ21lbnRhdGlvbiBmYXVsdCBpbiBMaW51eA0KPiBndWVzdA0KPiANCj4g
T24gV2VkLCA5IE5vdiAyMDIyLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+ID4gSGkgSmlhbWVpLA0K
PiA+DQo+ID4gT24gMDkvMTEvMjAyMiAwOToyNSwgSmlhbWVpIFhpZSB3cm90ZToNCj4gPiA+DQo+
ID4gPg0KPiA+ID4gSGkgTWljaGFs77yMDQo+ID4gPg0KPiA+ID4gQmVsb3cgbG9nIGNhbiBiZSBn
b3Qgd2hlbiBzdGF0aW5nIHRoZSBsaW51eCBndWVzdC4gSXQgc2F5cyA5YzA5IGlzIHNic2EuDQo+
IEFuZCA5YzA5IGlzIGFsc28gb3V0cHV0DQo+ID4gPiAgaW4gYm9vdGxvZ2QgZXJyb3IgbWVzc2Fn
ZToNCj4gPiA+IFNlcmlhbDogQU1CQSBQTDAxMSBVQVJUIGRyaXZlcg0KPiA+ID4gOWMwYjAwMDAu
dWFydDogdHR5QU1BMCBhdCBNTUlPIDB4OWMwYjAwMDAgKGlycSA9IDEyLCBiYXNlX2JhdWQgPSAw
KQ0KPiBpcyBhIFBMMDExIHJldjINCj4gPiA+IHByaW50azogY29uc29sZSBbdHR5QU1BMF0gZW5h
YmxlZA0KPiA+ID4gOWMwOTAwMDAuc2JzYS11YXJ0OiB0dHlBTUExIGF0IE1NSU8gMHg5YzA5MDAw
MCAoaXJxID0gMTUsIGJhc2VfYmF1ZA0KPiA9IDApIGlzIGEgU0JTQQ0KPiA+ID4NCj4gPg0KPiA+
IFhlbiBiZWhhdmlvciBpcyBjb3JyZWN0IGFuZCB0aGlzIHdvdWxkIGJlIExpbnV4IGZhdWx0IHRv
IHRyeSB0byB3cml0ZSB0bw0KPiBETUFDUiBmb3IgU0JTQSBVQVJUIGRldmljZS4NCj4gPiBETUFD
UiBpcyBqdXN0IGFuIGV4YW1wbGUuIElmIHlvdSB0cnkgdG8gcHJvZ3JhbSBlLmcuIHRoZSBiYXVk
cmF0ZSAodGhyb3VnaA0KPiBMQ1IpIGZvciBWUEwwMTEgaXQgd2lsbA0KPiA+IGFsc28gcmVzdWx0
IGluIGluamVjdGluZyBhYm9ydCBpbnRvIHRoZSBndWVzdC4gU2hvdWxkIFhlbiBzdXBwb3J0IGl0
PyBOby4gVGhlDQo+IHJlYXNvbiB3aHkgaXMgdGhhdA0KPiA+IGl0IGlzIG5vdCBzcGVjIGNvbXBs
aWFudCBvcGVyYXRpb24uIFNCU0Egc3BlY2lmaWNhdGlvbiBkaXJlY3RseSBzcGVjaWZpZXMNCj4g
d2hhdCByZWdpc3RlcnMgYXJlIGV4cG9zZWQuDQo+ID4gSWYgTGludXggdHJpZXMgdG8gd3JpdGUg
dG8gc29tZSBvZiB0aGUgbm9uZS1zcGVjIGNvbXBsaWFudCByZWdpc3RlcnMgLSBpdCBpcyBpdHMN
Cj4gZmF1bHQuDQo+IA0KPiBZZWFoLCB3ZSBuZWVkIHRvIGZpeCBMaW51eC4NCj4gDQo+IEZZSSB0
aGlzIGlzIG5vdCB0aGUgZmlyc3QgYnVnIGluIExpbnV4IGFmZmVjdGluZyB0aGUgc2JzYS11YXJ0
IGRyaXZlcjoNCj4gdGhlIGlzc3VlIGlzIHRoYXQgdGhlIHBsMDExIGRyaXZlciBhbmQgdGhlIHNi
c2EtdWFydCBkcml2ZXIgc2hhcmUgdGhlDQo+IHNhbWUgY29kZSBpbiBMaW51eCBzbyBpdCBoYXBw
ZW5zIHNvbWV0aW1lcyB0aGF0IGEgcGwwMTEtb25seSBmZWF0dXJlDQo+IGNyZWVwcyBpbnRvIHRo
ZSBzYnNhLXVhcnQgZHJpdmVyIGJ5IG1pc3Rha2UuDQoNClRoYW5rcyBmb3IgeW91ciBjb25maXJt
IGFib3V0IHRoaXMuIEluIHRoYXQgY2FzZSwgSSB3aWxsIGNoZWNrIHRoZSBMaW51eCBjb2RlIHRv
IHNlZSB3aHkgdGhpcyBoYXBwZW5zIGFuZCBob3cgdG8gZml4IGl0Lg0KDQpCZXN0IHdpc2hlcw0K
SmlhbWVpIFhpZQ0KPiANCj4gDQo+ID4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+PiBGcm9tOiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiA+ID4+IFNl
bnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgOSwgMjAyMiAzOjQwIFBNDQo+ID4gPj4gVG86IEppYW1l
aSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KPiA+ID4+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1
aXMNCj4gPiA+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsganVsaWVuQHhlbi5vcmc7IHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gPiA+PiBTdWJqZWN0OiBSZTogWGVuIEFybSB2cGwwMTEg
VUFSVCB3aWxsIGNhdXNlIHNlZ21lbnRhdGlvbiBmYXVsdCBpbiBMaW51eA0KPiA+ID4+IGd1ZXN0
DQo+ID4gPj4NCj4gPiA+PiBIaSBKaWFtZWksDQo+ID4gPj4NCj4gPiA+PiBPbiAwOS8xMS8yMDIy
IDA4OjIwLCBKaWFtZWkgWGllIHdyb3RlOg0KPiA+ID4+Pg0KPiA+ID4+Pg0KPiA+ID4+PiBIaSBh
bGwsDQo+ID4gPj4+DQo+ID4gPj4+IFdoZW4gdGhlIGd1ZXN0IGtlcm5lbCBlbmFibGVzIERNQSBl
bmdpbmUgd2l0aA0KPiA+ID4+ICJDT05GSUdfRE1BX0VOR0lORT15IiwgTGludXggQU1CQSBQTDAx
MSBkcml2ZXIgd2lsbCBhY2Nlc3MgUEwwMTENCj4gPiA+PiBETUFDUiByZWdpc3Rlci4gQnV0IHRo
aXMgcmVnaXN0ZXIgaGF2ZSBub3QgYmVlbiBzdXBwb3J0ZWQgYnkgdnBsMDExIG9mDQo+IFhlbi4N
Cj4gPiA+PiBYZW4gd2lsbCBpbmplY3QgYSBkYXRhIGFib3J0IGludG8gZ3Vlc3QsIHRoaXMgd2ls
bCBjYXVzZSBzZWdtZW50YXRpb24gZmF1bHQNCj4gb2YNCj4gPiA+PiBndWVzdCB3aXRoIHRoZSBi
ZWxvdyBtZXNzYWdlOg0KPiA+ID4+IEkgYW0gcXVpdGUgY29uZnVzZWQuDQo+ID4gPj4gVlBMMDEx
IGltcGxlbWVudHMgU0JTQSBVQVJUIHdoaWNoIG9ubHkgaW1wbGVtZW50cyBzb21lIHN1YnNldCBv
Zg0KPiBQTDAxMQ0KPiA+ID4+IG9wZXJhdGlvbnMgKFNCU0EgVUFSVCBpcyBub3QgUEwwMTEpLg0K
PiA+ID4+IEFjY29yZGluZyB0byBzcGVjIChTQlNBIHZlci4gNi4wKSwgdGhlIFNCU0FfVUFSVCBk
b2VzIG5vdCBzdXBwb3J0DQo+IERNQQ0KPiA+ID4+IGZlYXR1cmVzIHNvIFhlbiBjb2RlIGlzIGZp
bmUuDQo+ID4gPj4gV2hlbiBYZW4gZXhwb3NlcyB2cGwwMTEgZGV2aWNlIHRvIGEgZ3Vlc3QsIHRo
aXMgZGV2aWNlIGhhcyAiYXJtLHNic2EtDQo+IHVhcnQiDQo+ID4gPj4gY29tcGF0aWJsZSBhbmQg
bm90ICJ1YXJ0LXBsMDExIi4NCj4gPiA+PiBMaW51eCBkcml2ZXIgImFtYmEtcGwwMTEuYyIgc2hv
dWxkIHNlZSB0aGlzIGNvbXBhdGlibGUgYW5kIGFzc2lnbg0KPiBwcm9wZXINCj4gPiA+PiBvcGVy
YXRpb25zIChzYnNhX3VhcnRfcG9wcyBpbnN0ZWFkIG9mIGFtYmFfcGwwMTFfcG9wcykgdGhhdCBk
byBub3QNCj4gZW5hYmxlDQo+ID4gPj4gRE1BLg0KPiA+ID4+IE1heWJlIHRoZSBpc3N1ZSBpcyB3
aXRoIHlvdXIgY29uZmlndXJhdGlvbj8NCj4gPiA+Pg0KPiA+ID4+IH5NaWNoYWwNCj4gPiA+Pg0K
PiA+ID4+PiBVbmhhbmRsZWQgZmF1bHQgYXQgMHhmZmZmZmZjMDA5NDRkMDQ4DQo+ID4gPj4+IE1l
bSBhYm9ydCBpbmZvOg0KPiA+ID4+PiBFU1IgPSAweDk2MDAwMDAwDQo+ID4gPj4+IEVDID0gMHgy
NTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0KPiA+ID4+PiBTRVQgPSAwLCBGblYg
PSAwDQo+ID4gPj4+IEVBID0gMCwgUzFQVFcgPSAwDQo+ID4gPj4+IEZTQyA9IDB4MDA6IHR0YnIg
YWRkcmVzcyBzaXplIGZhdWx0DQo+ID4gPj4+IERhdGEgYWJvcnQgaW5mbzoNCj4gPiA+Pj4gSVNW
ID0gMCwgSVNTID0gMHgwMDAwMDAwMA0KPiA+ID4+PiBDTSA9IDAsIFduUiA9IDANCj4gPiA+Pj4g
c3dhcHBlciBwZ3RhYmxlOiA0ayBwYWdlcywgMzktYml0IFZBcywgcGdkcD0wMDAwMDAwMDIwZTJl
MDAwDQo+ID4gPj4+IFtmZmZmZmZjMDA5NDRkMDQ4XSBwZ2Q9MTAwMDAwMDAzZmZmZjgwMywgcDRk
PTEwMDAwMDAwM2ZmZmY4MDMsDQo+ID4gPj4gcHVkPTEwMDAwMDAwM2ZmZmY4MDMsIHBtZD0xMDAw
MDAwMDNmZmZhODAzLA0KPiBwdGU9MDA2ODAwMDA5YzA5MGYxMw0KPiA+ID4+PiBJbnRlcm5hbCBl
cnJvcjogdHRiciBhZGRyZXNzIHNpemUgZmF1bHQ6IDk2MDAwMDAwIFsjMV0gUFJFRU1QVCBTTVAN
Cj4gPiA+Pj4gTW9kdWxlcyBsaW5rZWQgaW46DQo+ID4gPj4+IENQVTogMCBQSUQ6IDEzMiBDb21t
OiBib290bG9nZCBOb3QgdGFpbnRlZCA1LjE1LjQ0LXlvY3RvLXN0YW5kYXJkDQo+ICMxDQo+ID4g
Pj4+IHBzdGF0ZTogNjA0MDAwYzUgKG5aQ3YgZGFJRiArUEFOIC1VQU8gLVRDTyAtRElUIC1TU0JT
IEJUWVBFPS0tKQ0KPiA+ID4+PiBwYyA6IHBsMDExX3N0b3BfcngrMHg3MC8weDgwDQo+ID4gPj4+
IGxyIDogdWFydF90dHlfcG9ydF9zaHV0ZG93bisweDQ0LzB4MTEwDQo+ID4gPj4+IHNwIDogZmZm
ZmZmYzAwOTk5YmJhMA0KPiA+ID4+PiB4Mjk6IGZmZmZmZmMwMDk5OWJiYTAgeDI4OiBmZmZmZmY4
MDIzNGFjMzgwIHgyNzogZmZmZmZmODAyMmY1ZDAwMA0KPiA+ID4+PiB4MjY6IDAwMDAwMDAwMDAw
MDAwMDAgeDI1OiAwMDAwMDAwMDQ1NTg1NDAxIHgyNDoNCj4gMDAwMDAwMDAwMDAwMDAwMA0KPiA+
ID4+PiB4MjM6IGZmZmZmZjgwMjFiYTQ2NjAgeDIyOiAwMDAwMDAwMDAwMDAwMDAxIHgyMTogZmZm
ZmZmODAyMWEwZTJhMA0KPiA+ID4+PiB4MjA6IGZmZmZmZjgwMjE5OGY4ODAgeDE5OiBmZmZmZmY4
MDIxYTBlMWEwIHgxODogMDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4+PiB4MTc6IDAwMDAwMDAwMDAw
MDAwMDAgeDE2OiAwMDAwMDAwMDAwMDAwMDAwIHgxNToNCj4gMDAwMDAwMDAwMDAwMDAwMA0KPiA+
ID4+PiB4MTQ6IDAwMDAwMDAwMDAwMDAwMDAgeDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjoNCj4g
MDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4+PiB4MTE6IDAwMDAwMDAwMDAwMDAwMDAgeDEwOiAwMDAw
MDAwMDAwMDAwMDAwIHg5IDoNCj4gZmZmZmZmYzAwODcxYmExNA0KPiA+ID4+PiB4OCA6IGZmZmZm
ZmMwMDk5ZGUyNjAgeDcgOiBmZmZmZmY4MDIxYTBlMzE4IHg2IDogMDAwMDAwMDAwMDAwMDAwMw0K
PiA+ID4+PiB4NSA6IGZmZmZmZmMwMDkzMTVmMjAgeDQgOiBmZmZmZmZjMDA5NDRkMDM4IHgzIDog
MDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4+PiB4MiA6IGZmZmZmZmMwMDk0NGQwNDggeDEgOiAwMDAw
MDAwMDAwMDAwMDAwIHgwIDogMDAwMDAwMDAwMDAwMDA0OA0KPiA+ID4+PiBDYWxsIHRyYWNlOg0K
PiA+ID4+PiBwbDAxMV9zdG9wX3J4KzB4NzAvMHg4MA0KPiA+ID4+PiB0dHlfcG9ydF9zaHV0ZG93
bisweDdjLzB4YjQNCj4gPiA+Pj4gdHR5X3BvcnRfY2xvc2UrMHg2MC8weGNjDQo+ID4gPj4+IHVh
cnRfY2xvc2UrMHgzNC8weDhjDQo+ID4gPj4+IHR0eV9yZWxlYXNlKzB4MTQ0LzB4NGMwDQo+ID4g
Pj4+IF9fZnB1dCsweDc4LzB4MjIwDQo+ID4gPj4+IF9fX19mcHV0KzB4MWMvMHgzMA0KPiA+ID4+
PiB0YXNrX3dvcmtfcnVuKzB4ODgvMHhjMA0KPiA+ID4+PiBkb19ub3RpZnlfcmVzdW1lKzB4OGQw
LzB4MTIzYw0KPiA+ID4+PiBlbDBfc3ZjKzB4YTgvMHhjMA0KPiA+ID4+PiBlbDB0XzY0X3N5bmNf
aGFuZGxlcisweGE0LzB4MTMwDQo+ID4gPj4+IGVsMHRfNjRfc3luYysweDFhMC8weDFhNA0KPiA+
ID4+PiBDb2RlOiBiOTAwMDA4MyBiOTAxZjAwMSA3OTQwMzhhMCA4YjAwMDA0MiAoYjkwMDAwNDEp
DQo+ID4gPj4+IC0tLVsgZW5kIHRyYWNlIDgzZGQ5M2RmMTVjMzIxNmYgXS0tLQ0KPiA+ID4+PiBu
b3RlOiBib290bG9nZFsxMzJdIGV4aXRlZCB3aXRoIHByZWVtcHRfY291bnQgMQ0KPiA+ID4+PiAv
ZXRjL3JjUy5kL1MwN2Jvb3Rsb2dkOiBsaW5lIDQ3OiAxMzIgU2VnbWVudGF0aW9uIGZhdWx0IHN0
YXJ0LXN0b3AtDQo+ID4gPj4gZGFlbW9uDQo+ID4gPj4+IEluIFhlbiwgdnBsMDExX21taW9fd3Jp
dGUgZG9lc24ndCBoYW5kbGUgRE1BQ1IgLiBBbmQga2VybmVsIGRvZXNuJ3QNCj4gPiA+PiBjaGVj
ayBpZiBwbDAxMV93cml0ZSBleGVjdXRlcyBzdWNlc3NmdWxseSBpbiBwbDAxMV9kbWFfcnhfc3Rv
cCAuIFNvDQo+IHN1Y2gNCj4gPiA+PiBzZWdtZW50YXRpb24gZmF1bHQgb2NjdXJzLg0KPiA+ID4+
PiBzdGF0aWMgaW5saW5lIHZvaWQgcGwwMTFfZG1hX3J4X3N0b3Aoc3RydWN0IHVhcnRfYW1iYV9w
b3J0ICp1YXApDQo+ID4gPj4+IHsNCj4gPiA+Pj4gICAgICAgICAvKiBGSVhNRS4gIEp1c3QgZGlz
YWJsZSB0aGUgRE1BIGVuYWJsZSAqLw0KPiA+ID4+PiAgICAgICAgIHVhcC0+ZG1hY3IgJj0gflVB
UlQwMTFfUlhETUFFOw0KPiA+ID4+PiAgICAgICAgIHBsMDExX3dyaXRlKHVhcC0+ZG1hY3IsIHVh
cCwgUkVHX0RNQUNSKTsNCj4gPiA+Pj4gfQ0KPiA+ID4+Pg0KPiA+ID4+PiBJIHRoaW5rIHdlIHNo
b3VsZCBwcmV2ZW50IHN1Y2ggc2VnbWVudGF0aW9uIGZhdWx0LiBXZSBoYXZlIGNoZWNrZWQNCj4g
dGhlDQo+ID4gPj4gUEwwMTEgc3BlYywgaXQgc2VlbXMgdGhlcmUgaXMgbm90IGFueSByZWdpc3Rl
ciBiaXQgY2FuIGluZGljYXRlIERNQQ0KPiBzdXBwb3J0DQo+ID4gPj4gc3RhdHVzIG9mIFBMMDEx
LiBXZSBtaWdodCBoYXZlIHR3byBvcHRpb25zOg0KPiA+ID4+PiAxLiBPcHRpb24jMSBpcyB0byBh
ZGQgRE1BIHN1cHBvcnQgZm9yIHZwbDAxMSwgYnV0IHRoaXMgaXMgbm90IHRyaXZpYWwuDQo+ID4g
Pj4+IDIuIE9wdGlvbiMyIGlzIHRvIGlnbm9yZSB0aGUgd3JpdGUgdG8gRE1BQ1IsIGFuZCByZXR1
cm4gMCBmb3IgRE1BQ1INCj4gcmVhZA0KPiA+ID4+IGluIHZwbDAxMS4gQnV0IHRoaXMgb3B0aW9u
IG5lZWQgY28td29yayB3aXRoIGtlcm5lbCwgYmVjYXVzZSBjdXJyZW50DQo+IExpbnV4DQo+ID4g
Pj4gUEwwMTEgZHJpdmVyIGFzc3VtZSB0aGUgd3JpdGUgb3BlcmF0aW9uIHdpbGwgbmV2ZXIgYmUg
ZmFpbGVkLCBhbmQgd2lsbA0KPiBub3QNCj4gPiA+PiBmYWxsYmFjayB0byBuby1ETUEgbW9kZSwg
d2hlbiBYZW4gcmV0dXJuIDAgZm9yIERNQSBlbmFibGVkIGJpdCBpbg0KPiBETUFDUi4NCj4gPiA+
Pj4NCj4gPiA+Pj4gSG93IGRvIHlvdSB0aGluayBhYm91dCBpdD8gIEFueSBzdWdnZXN0aW9uIGFi
b3V0IGl0IGlzIHdlbGNvbWUuDQo+IFRoYW5rcy4NCj4gPiA+Pj4NCj4gPiA+Pj4gQmVzdCB3aXNo
ZXMNCj4gPiA+Pj4gSmlhbWVpIFhpZQ0KPiA+ID4+Pg0KPiA+DQo=

