Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A560F3ED
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431003.683421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzRh-0007g1-Rr; Thu, 27 Oct 2022 09:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431003.683421; Thu, 27 Oct 2022 09:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzRh-0007bl-OM; Thu, 27 Oct 2022 09:45:05 +0000
Received: by outflank-mailman (input) for mailman id 431003;
 Thu, 27 Oct 2022 09:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB4N=24=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onzRf-0007G5-F9
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:45:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07637543-55dc-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 11:45:02 +0200 (CEST)
Received: from AM5PR0202CA0003.eurprd02.prod.outlook.com
 (2603:10a6:203:69::13) by AS8PR08MB8249.eurprd08.prod.outlook.com
 (2603:10a6:20b:53f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 27 Oct
 2022 09:44:59 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::81) by AM5PR0202CA0003.outlook.office365.com
 (2603:10a6:203:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Thu, 27 Oct 2022 09:44:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.19 via Frontend Transport; Thu, 27 Oct 2022 09:44:58 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Thu, 27 Oct 2022 09:44:58 +0000
Received: from 28f4353d5a90.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2263CF60-E684-47B1-922B-62AC8E5024CA.1; 
 Thu, 27 Oct 2022 09:44:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28f4353d5a90.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Oct 2022 09:44:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB8128.eurprd08.prod.outlook.com (2603:10a6:10:381::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 09:44:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Thu, 27 Oct 2022
 09:44:50 +0000
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
X-Inumbo-ID: 07637543-55dc-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hqC6Z40JBzfNsq1NMqYxSwKw4osoTUh6oad1EwlgK0j9ubfVtwZOLIO+sCrq1hsjrB6dPJ1FPTc8wgjePSVEUqg3vlyVt4tFWmwh5rP9JQi2p+Zaf2/JrXSRqzUdtC2UCJm3/VQTUc72ajeaOQ4qK1OYLaETLSMT+dyWnmrr5XFeZUDwSwF3kroMg8duXHxZZkAq7VHjmpkMf4m5v14BbXLbuqmkbasP+HXv4oCj5CHwTnhKNrNm8Tuvm92745wv9rDLXgfjZXRJmTgMYVN+RmcveomJcLTZ20IAIduHTkwvKK7p91jkOZ2sif5WeLTAdsHm5r6z8xlu3lWbgNdhCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GqDSzTcP9Tts7cKFiO7kcYHKfFCWgvBLgGLUVOukqQ=;
 b=DGTjJqE8mTPWiVKMJyNIlRCGOAQ6HTIUBbLoMBnktZ1QILXVkimJqrkjfKo4rswBQTtq5FWNVKq8lnG2+fet0nJmvI+tjkq8X0JXcY37bWxgowCMO7i5ZDsFZ69jZgshAy34noG/bAZul1ROXX2NAQUWbt+llphcZPQCRk8yAeSqtm5WhSwHzyHV6f7JlwuF/ZhwQJtuM5/PAFNxVtQYO2bi1Bw10Ke/pEfEcpBGMTDNDEybXFPqr9wIk+IJHrV/g4NIMZlwo6xqoWwwb/xDzbnR74qZk0cTmLFlUAGiLg7GR0MR6eStPtAkJVFNgixlH7nHTQ/GLfYCb+Qvr6XPgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GqDSzTcP9Tts7cKFiO7kcYHKfFCWgvBLgGLUVOukqQ=;
 b=VEz7XawOY/CbWggX+1hxKLcrTsJ6s2l0hhs2rq2LnLVcG4LCv67yWdUBFqeI2h4IxqhkaEvOk92jAK13s8Z68Cd581W1N+AbFlb5tEMXoTSU1fQkryGajEArI1WObM24T/PzYx19hQt3n5ETm+hddBOC/4ubDsFdLFc5u9iviwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPPhgXrLR7EJYowQukxbE5TH9FAJoDochKVUi+I8IeZRdEr9w0Iw5s6f7BgKdZgAp2I5fGi+Nq6+ftTV2H4oFG7gCS3zSnzorFyRP3zl+5dXE30BfQZ1DBix1UWZFWkILt4xYaBlH/FyTRcecorqmUdiQ88OdEZzCq+u3dmeqWaQGa8JeKoUnkkdUOuynuijO2vahhqIbBqDzvRx00ZtAHH/DYigayEUDi9OI/TtI/0IFz1ghu6en4t+Z+Pt54tN3Ae4Nz0rj11Y0R7J8U59PYZJyRNROQcSZwUC341znS5Sbqgmgh8g/FK+gO4VHPNK4KMOHwPwF6hn4XqkcRx8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GqDSzTcP9Tts7cKFiO7kcYHKfFCWgvBLgGLUVOukqQ=;
 b=E1u4Vy4mSEJe2MW+ON7Ik3Fkuw0CUy76GlscGoStsrybt0vLjqJOEuBfRZnpLSTDyF/3UZhoEaWp26t81iGx4kWaQJmp+4FW00zh2u/vg5IlyZ3c9jdkIoBjVF+vrSp66LnRYI6S9y9eCn2Irhl6Ib5F0IhgvP6Y6eHkOfJAwes3/D/uwaHZRQ+l5lJZT89dvoVIAw/YV87LYB+BVievUErzYTSDRq7/icbPPHLmqYZzbDRo7nS3gQ383o3Gick4mUZO08rvc99vxE1y2bvV6u/Y3yfkfbjmUxwk3zujEs26c4UWRYakO9SdemITSJKPNTe/LTGUmlvnaKnsvIKORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GqDSzTcP9Tts7cKFiO7kcYHKfFCWgvBLgGLUVOukqQ=;
 b=VEz7XawOY/CbWggX+1hxKLcrTsJ6s2l0hhs2rq2LnLVcG4LCv67yWdUBFqeI2h4IxqhkaEvOk92jAK13s8Z68Cd581W1N+AbFlb5tEMXoTSU1fQkryGajEArI1WObM24T/PzYx19hQt3n5ETm+hddBOC/4ubDsFdLFc5u9iviwo=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH][4.17?] x86: also zap secondary time area handles during
 soft reset
Thread-Topic: [PATCH][4.17?] x86: also zap secondary time area handles during
 soft reset
Thread-Index: AQHY3s/RhJ2DvtQvW0uB7kvty9Hpsq4iE7bg
Date: Thu, 27 Oct 2022 09:44:50 +0000
Message-ID:
 <AS8PR08MB79919E113D8FB00AE19B711B92339@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <c80390e6-b9c2-e15a-b513-ec97e8329ad8@suse.com>
In-Reply-To: <c80390e6-b9c2-e15a-b513-ec97e8329ad8@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 90C4D06E9F6D7F44B033D4BD9AD50C79.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB8128:EE_|AM7EUR03FT031:EE_|AS8PR08MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 7888f957-465a-4626-311d-08dab7ffe97a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L3g6/wYuzQM1/61PBL61FvbFHLXS9O4JU0Rd8SdoVoOuVjwFUjlWohCVYJ0UomsGtXXG7twUZ780Pd/e0a62NHtVdlHQahrVWoO7hMOyv6qMrVM44NQpIRXGL7b3/6kaLJCccfEG1OJp+trzBBAW8HbnToGjgeWOSOWp5GqYVw27AJ6hAI8XdC7Liq0nwIavOQAHLcBBJ/S5jTl4UII8CjboXoXs9jTvd6DuOvWiBSuDLrSeYq/VkgPHu8VaMIAgNSrdnw/OeEcIj8InJmpz37w/Aak4ZIJC6yyP/JPRbHTOfLniHj9zQ0J9uSS4ov6QcxXsVsNHE7EUL4yjLMtIXzajuAEDra3bHNLsKcpqkboBgJ/WZsacSl9YNjSYLZ2EaVWSaA57H2w+2Jw+/DWewQg2JDlTkFTidRBzC3ckNd618mNm2mZE6zt1MDpe9lce4srlCGOwTHRMxtWaAKJvOYel+xnr2nu1VjbnEJ+yAITEUC4u19BctugEfF4ZahoCYrReQeH0PP/Vh5A6UbLCdey6sBo8u+cN4y8FMEtL3ohD88Q2E18WuS4Q716Sp28k1Ttfc3yZ39Xnudl4f0L6ZNrbwXfJS+xl93g/NcRcIZoPIH6ZZyOZRkNLEO7RCKusiEd5XSmtYAvarU80v5ktLSNpoMyyfbJoSfxNsGaUuo9L/oKvsevHJUSSD4uuZCYWLUwzZcnBA/wKVH+3/diFbFR+5lXRMb6bFAM/Oq1JoBNe1CrIcejy7FSelxTaar58jC5oQreFcZlaw8O4PXyzag==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(478600001)(71200400001)(83380400001)(86362001)(41300700001)(9686003)(54906003)(8936002)(26005)(66446008)(66476007)(66556008)(33656002)(4326008)(6506007)(52536014)(8676002)(7696005)(76116006)(64756008)(66946007)(4744005)(186003)(2906002)(5660300002)(110136005)(316002)(122000001)(38100700002)(55016003)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8128
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	252d9b88-c510-4366-d15b-08dab7ffe471
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RXR8rDn/WHvjZuMFV0A9pjwzqkJEk+4uIp+C3QTQb9Ucj4QlKasS+ZvV9fc+hfULxXmMpPmwS/stfILUhPMrefHYbEr5d2tChxdI4JCQ1R9nH6j6tKRyjMEmJ5/rX2jPau3MbGzF4gkNLx0NU+LFwZFlAEa00oBFzPtKUuRj+V/8W5LuJvivjPMoE48m3nSfsp2TLGqwaX43qX7VuwIOvHgrmjTZoTsBGhxKDrY4TBSZj6QohFZSW03eTFY4JB+W5QK+tIE6aT8Zh89TVI8kb7mZ2uCL3e6xbTTiSq8ugV3dMUVy0dTeFd7cYYx7HIctKsTcmuIChwuY31YWAM1dGBh7FiQbWm7FhvvgThlCYJRQesgwRXTFW9Up7W9WUI41jT8GO4r7w8f1MeBcE92Z7dgF5cpr05MgawV4bG5TfOXc4s1aB7NoGYczVtg7lXvSwhZ9IajPb/GXK6GLmq7/ZLmeZKl5APtPpOQLrJSk+k8kXzx5Me5BFmNz6jUTaQk4oLuDubVZ5/JUiRyCK2MrL3J3WmOf+Q0jveZ3hxnrbIL91rBxvtW+g3U4FTqlCyS2wbk8XLrc6PtJhQoiLgCFgU1bV6oAbLTpdSs98duqpsjywZgba+Phyia3My9mcYvYe0VaEN5IyN1khLlukclZ9xjECcwQxCTI083oHOqYBkq3L+AHC1Kgm6Yfv6b8MFFdVxXKTXGGGOfwxS6V7jXWwoMxAj4c6UTIR3dQ1Irgx9MnWyiZ7Dd+YpXjp1JpsXH2WEMWwsXsYoblMhEGgEzXgw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(81166007)(336012)(478600001)(47076005)(2906002)(40480700001)(4326008)(107886003)(356005)(186003)(82740400003)(6506007)(8936002)(4744005)(36860700001)(33656002)(316002)(40460700003)(8676002)(5660300002)(52536014)(41300700001)(83380400001)(110136005)(9686003)(86362001)(70206006)(55016003)(54906003)(7696005)(70586007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 09:44:58.7364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7888f957-465a-4626-311d-08dab7ffe97a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8249

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXVs0LjE3P10geDg2OiBh
bHNvIHphcCBzZWNvbmRhcnkgdGltZSBhcmVhIGhhbmRsZXMgZHVyaW5nDQo+IHNvZnQgcmVzZXQN
Cj4gDQo+IEp1c3QgbGlrZSBkb21haW5fc29mdF9yZXNldCgpIHByb3Blcmx5IHphcHMgcnVuc3Rh
dGUgYXJlYSBoYW5kbGVzLCB0aGUNCj4gc2Vjb25kYXJ5IHRpbWUgYXJlYSBvbmVzIGFsc28gbmVl
ZCBkaXNjYXJkaW5nIHRvIHByZXZlbnQgZ3Vlc3QgbWVtb3J5DQo+IGNvcnJ1cHRpb24gb25jZSB0
aGUgZ3Vlc3QgaXMgcmUtc3RhcnRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVu
cnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0K

