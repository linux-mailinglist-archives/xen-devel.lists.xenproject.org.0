Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6751E605945
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 10:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426274.674601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQWn-0005Hn-Si; Thu, 20 Oct 2022 08:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426274.674601; Thu, 20 Oct 2022 08:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQWn-0005FU-OZ; Thu, 20 Oct 2022 08:03:45 +0000
Received: by outflank-mailman (input) for mailman id 426274;
 Thu, 20 Oct 2022 08:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIjd=2V=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1olQWm-0005FM-4q
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 08:03:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b64ecf75-504d-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 10:03:42 +0200 (CEST)
Received: from AS8PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:310::24)
 by AM9PR08MB6100.eurprd08.prod.outlook.com (2603:10a6:20b:287::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 08:03:40 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::b4) by AS8PR04CA0019.outlook.office365.com
 (2603:10a6:20b:310::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Thu, 20 Oct 2022 08:03:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Thu, 20 Oct 2022 08:03:40 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Thu, 20 Oct 2022 08:03:40 +0000
Received: from e8341c58fe65.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC0F9BCA-DC26-46C2-9ABD-15A1540442F2.1; 
 Thu, 20 Oct 2022 08:03:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8341c58fe65.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 08:03:33 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by PAXPR08MB6720.eurprd08.prod.outlook.com (2603:10a6:102:130::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 08:03:31 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d793:e6d8:6250:d00c]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d793:e6d8:6250:d00c%6]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 08:03:31 +0000
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
X-Inumbo-ID: b64ecf75-504d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gfPIVoupecmNMA61ZyMDScmO5aqCRuoXKaAjUneccnnR5klN//hmKc7Ie0y9X/zlAwBz6T768Yc+sTZNYQ7+PwhliYjrCqPYL9STunwDAGoDWFXJZfhBHJ+c6AkVH1bcLyGZFGeLUfU3uWdo8V1WalSSCdv58pE+X6fSdHvsGzoVz6kBBo/XTjW1hHZHiu1pHXeQ4ZR8n4iP7u/ymH3iPWJeJtFC5OmhTt5mPSpkw2ZjZm8o4fH8YfsombtK2pRR0sZx4+/fZ7bH9vhFIB+/MoYawhY3ajRo4n6TZ2DJzZfQqum0M4L+SwJzBEshc9Jwj+FyLuy+yvATx+KUN+rYQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSxYXp92YlagzFFnQkaaPPPaDO8PHE5v8f/k8Fq6jTc=;
 b=HV+wVMpNQqVueWClX8cxTA1YjNb44xCHlsPUPEm16UjzTNfHtjkcZwAvJHXGoaP1yQnahw3vMrUtke/OUvKv0sC1XWO/Kb+JEq/keuTaAPwJBq6s1W6MbCUBXydX3sQIAc4t6J9JqLpJar6hUyPszDetoofK7UErGUOC8I2v9WNICyFfpewxVFy1EG5Bhm5/UfMzTXGeoW9Y1T/G9O0BPPWknS7va7aut4wlc+dkVLXnOTHDvL3ACF7a8/bfpgUiKz2TZWc0foCsZpmtzxYLtpTVs4SzhwrUO9/rDMiHvoOp5Zu/yRVyQYDoNig6QMjYaE82agoS3NlDQMsiEj7pZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSxYXp92YlagzFFnQkaaPPPaDO8PHE5v8f/k8Fq6jTc=;
 b=wkKm57uE3QtdzdUZ1YQvGrVXud4YJ3jDrQi8BG5LdPU+WdG4pUiYrFIQG8AYBegAbUry0UPEv4jN+W/8Auiup8/kIPPaJy3XTkm1PkTqPvvzJUGonRkkhwfM/VMKkfWwYaLphFCpVnV+EtX8EMSASQURUExcyuVcRAXR5Ql5ag8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nl3BzI28FOiN88PrDWAPGzhLP5qQ0NrfDgvQO1kbeE1OyHhIGWROkxnddOJfQGZGIYFcjy50IsCrILPZyWEu+JreH24FbHlb0eJ8WLWsx9KvHuP/Bmqy/LdSJH7Clu09LLEbhDJFnE26Fj6j4OaPcmfNUSGCPygawcXQ4cNsgk0WfSWO9aX+d2AcFDWvqgdSkiyRTyWuZvJQ4UEnr/YoGrvMeHzMXm42uZ/KyqYpN7PlJKEXmzM07T6n8V1xG36uEeGSzcSzE24AkzV3d0RD7rn5dX1lgY7yEH508BzGrtaJoHDv8IYtDGvAYw/+/tLmSSGy4q0wpbr/v0+kEJ5vVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSxYXp92YlagzFFnQkaaPPPaDO8PHE5v8f/k8Fq6jTc=;
 b=B0cfMMgmZybpYh3K5kHvD+5zdNhDmJMwksA9yeQQo46AjBiXb2DtZbvUWeoynjf5jd28WFL3+D26d/+Z/uOkmTC0p6ycqS2+clizbnvjZBNfdm7DuenlN87N3RTE5vTejuChsj5YHJoS38b73efTpWugIFVFjqVsfZwINx0AmVGXLZjwO2EEzhucbjk5DKLS1bPamF7tmuXN2TKRA0Y+b9yLBl2ACmxHxyZXuPOyjBv73bmqLlimyqi3xsnrctNm1VkE6dXhrqEMTkmd/B4+CuJzA9u//3U57NbeJhCgdGXAJLALylxZdvNmIKqouXVubunQhl52X9HFPcm+nwtPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSxYXp92YlagzFFnQkaaPPPaDO8PHE5v8f/k8Fq6jTc=;
 b=wkKm57uE3QtdzdUZ1YQvGrVXud4YJ3jDrQi8BG5LdPU+WdG4pUiYrFIQG8AYBegAbUry0UPEv4jN+W/8Auiup8/kIPPaJy3XTkm1PkTqPvvzJUGonRkkhwfM/VMKkfWwYaLphFCpVnV+EtX8EMSASQURUExcyuVcRAXR5Ql5ag8=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH v3 05/10] automation: Add Arm containers to containerize
 script
Thread-Topic: [PATCH v3 05/10] automation: Add Arm containers to containerize
 script
Thread-Index: AQHY0lZFu/mKHMVlEk6rDAaZCITsX64Ws3HQgABK2QCAAAFz0IAADTKAgAABtvA=
Date: Thu, 20 Oct 2022 08:03:31 +0000
Message-ID:
 <AS8PR08MB76965761992D481299A7F0E9922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
 <20220927094727.12762-6-michal.orzel@amd.com>
 <AS8PR08MB7696D8C9D2239CC9ED2FE08F922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <bc41f3a0-27ec-8bbe-a087-125acc20df2f@amd.com>
 <AS8PR08MB769676050B41BCEDCA3F2891922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <e0e0d4af-54e0-6dee-2f01-99bb5d31d346@amd.com>
In-Reply-To: <e0e0d4af-54e0-6dee-2f01-99bb5d31d346@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 086B72B8A37B2C4493F8AAC284F2D792.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|PAXPR08MB6720:EE_|AM7EUR03FT041:EE_|AM9PR08MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd534e6-7ec1-4b1e-0ff3-08dab271999a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qbpIq+PULakANcrV/v4M72F3xThbVvcNhB1elVNILz4yZ2Rhu3PLP59VTAW9x5tcZRTojex4quSX2eBZZrnP14As/bSC9OBez8Be8sS1eiDdZH5DJxYn6RFOe3IV+MLPmGMVCuPC09AI/gI+z/l9cL9CmaKeLSKYtAiZ7bsWhyfa1+F8qA8tmOttkKEJFPCZ9VfO4ygTZXi9YV9hajCadXiA2jNVjzq4ZE9CVH/MVUu9uGEo8oP4OXBOp39S5NpEgVLLVLS4sIGDfdqBoUxPOHC1WkESps9mi+dBJhZ16uQ/n12JocIRL027tXVjDnvqUItwuXzJJs3jJbyLF2K/7H+CghzExZvxETTweM3gpyxjSnBYs4qyxEa4Y+8bkX8q0Wmz+cftt7/0pPIoxVxBm/NTToT0+pHkwLHRaZVMsAukJgzC2eIe0xzrb+gqsVYwumwJ9bK9L2wb3pt0WdQmhA3zgLC0iC2q7SrAtxKoJ/sRDtvCD9SL5TRET3/DnutjmbgKw5E9DSOjdB+2Qqq/9kZhUwKoDXaFYknpLEuq8Wz196GVgQL7D8/SH5HSoP0m705BxS9sUOIw8bYnr29998eAAUcTkClfzQVPc5dg3iNlkviptTzKs3aMnRb4i3Ah7epszqRA8CcwVo587NTl10fPdcdvbwSo2VuqAm9cUVC8mCe0XwoZ/fovFPpR0EwO2mp+G/X2VSkliiNB/GddpKShh4aMSEwL9cb3CN+Hda29zYWxUZA+OAPDlVM4i5F5D+LmSKPpMvZJIer5hFsX5N1iNjjI8m3F9nE6KKzyAn8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199015)(9686003)(7696005)(83380400001)(52536014)(5660300002)(71200400001)(26005)(84970400001)(53546011)(6506007)(478600001)(316002)(66556008)(110136005)(54906003)(66446008)(66946007)(4326008)(41300700001)(86362001)(76116006)(186003)(64756008)(8936002)(55016003)(33656002)(66476007)(2906002)(38070700005)(8676002)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6720
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3b9496e-1587-432f-7a43-08dab271941f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DRqEcuEaCoRs2sKrp9YAzv1+TcavKsP7b03Km9EOhJGiFDkRjr/HvK82MuaNYLKxV9pXv7tzc4v8FCT7/shaOQlxVXn3x3URwZ5DSGkDMSvDYTeXBvAOtevTp7eNDzPThk1P9aSopH3C3Ol+36x7t+RjyhF5Gjq+05lglQ9GsHcPXDoPGrG9Eksh8IpHKC8TJ1q3o3RyCLlW7feWqdUp4x/S8ROtBu0/qWmX2gtbM1gn4OaoN115aT/wPqJxUiZdGXxxwM5BZdO/raFoA17hItq6kcrXNsRYy7poZSzHKhV1QPp8mTnBoFJcPrBvPIX4HZQc4+t/lZIZSTj6ahT3ZmA6CMa93QmT97PwVDRWBPfZWku34mWgNh0XS1CP9meAxkkX7u69serYJyAlIZrFldeQVZBrSBuiSij+nbxwHlfOERDsIgqOb1ye3rDe55A6ldONLImU4uk/GhkQha+9iWHh2jhfH2UWKZdUYcRak2zRboBdDJfBDk9dndGjGXq/LV1kc8GjiDquaRbsXVa7Hj1zlEGGlGUOtAszMxS6qm/qzXc0FGgizvWH1Hp6F2uKttuR2jAEUEhaHsJBwdVCLmkrYd0zz2WdclGuKuU2M1cNXEL/Kb3UB4PBystux6+Upq6rDFHY+VcTSQFwUevpJHrLqxDAlGKGEBCzi8j7tSixihhkD/H1uaW6tWpraMD5EnL6OYcAR3jAbHae5mPZEOzZQaY0kU/N12mlOynP59H0AyFzm5Wtl6fJN4DkwVigeaFYtpR+1iSQUWExSuj5bcr+TKylYiqybXaY4RyDcGs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(47076005)(336012)(186003)(84970400001)(55016003)(40480700001)(33656002)(107886003)(2906002)(356005)(81166007)(86362001)(40460700003)(82740400003)(82310400005)(83380400001)(70586007)(6506007)(7696005)(53546011)(36860700001)(26005)(9686003)(316002)(41300700001)(70206006)(8676002)(4326008)(478600001)(110136005)(54906003)(5660300002)(8936002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 08:03:40.3624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd534e6-7ec1-4b1e-0ff3-08dab271999a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6100

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVy
IDIwLCAyMDIyIDM6NTIgUE0NCj4gVG86IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT47
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogRG91ZyBHb2xkc3RlaW4gPGNh
cmRvZUBjYXJkb2UuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA1LzEwXSBhdXRvbWF0aW9uOiBBZGQg
QXJtIGNvbnRhaW5lcnMgdG8NCj4gY29udGFpbmVyaXplIHNjcmlwdA0KPiANCj4gSGkgSmlhbWVp
LA0KPiANCj4gT24gMjAvMTAvMjAyMiAwOToxMywgSmlhbWVpIFhpZSB3cm90ZToNCj4gPg0KPiA+
DQo+ID4gSGkgTWljaGFsLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4+IFNlbnQ6
IFRodXJzZGF5LCBPY3RvYmVyIDIwLCAyMDIyIDI6NTkgUE0NCj4gPj4gVG86IEppYW1laSBYaWUg
PEppYW1laS5YaWVAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+
PiBDYzogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPjsgU3RlZmFubyBTdGFiZWxs
aW5pDQo+ID4+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDA1LzEwXSBhdXRvbWF0aW9uOiBBZGQgQXJtIGNvbnRhaW5lcnMgdG8NCj4gPj4gY29u
dGFpbmVyaXplIHNjcmlwdA0KPiA+Pg0KPiA+PiBIaSBKaWFtZWksDQo+ID4+DQo+ID4+IE9uIDIw
LzEwLzIwMjIgMDU6MDAsIEppYW1laSBYaWUgd3JvdGU6DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IEhp
IE1pY2hhbCwNCj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+
PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3Jn
PiBPbiBCZWhhbGYNCj4gT2YNCj4gPj4+PiBNaWNoYWwgT3J6ZWwNCj4gPj4+PiBTZW50OiBUdWVz
ZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjIgNTo0NyBQTQ0KPiA+Pj4+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gPj4+PiBDYzogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxA
YW1kLmNvbT47IERvdWcgR29sZHN0ZWluDQo+ID4+Pj4gPGNhcmRvZUBjYXJkb2UuY29tPjsgU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+Pj4+IFN1YmplY3Q6
IFtQQVRDSCB2MyAwNS8xMF0gYXV0b21hdGlvbjogQWRkIEFybSBjb250YWluZXJzIHRvDQo+ID4+
IGNvbnRhaW5lcml6ZQ0KPiA+Pj4+IHNjcmlwdA0KPiA+Pj4+DQo+ID4+Pj4gU2NyaXB0IGF1dG9t
YXRpb24vc2NyaXB0cy9jb250YWluZXJpemUgbWFrZXMgaXQgZWFzeSB0byBidWlsZCBYZW4NCj4g
d2l0aGluDQo+ID4+Pj4gcHJlZGVmaW5lZCBjb250YWluZXJzIGZyb20gZ2l0bGFiIGNvbnRhaW5l
ciByZWdpc3RyeS4gVGhpcyBzY3JpcHQgaXMNCj4gPj4+PiBjdXJyZW50bHkgbWlzc2luZyB0aGUg
aGVscGVycyB0byBzZWxlY3QgQXJtIGNvbnRhaW5lcnMsIHNvIHBvcHVsYXRlIHRoZQ0KPiA+Pj4+
IG5lY2Vzc2FyeSBlbnRyaWVzLg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFs
IE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gPj4+PiBBY2tlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+Pj4+IC0tLQ0KPiA+Pg0KPiA+
Pj4NCj4gPj4+IFtKaWFtZWkgWGllXQ0KPiA+Pj4gSSB3b25kZXIgaWYgYW4gZGVmYXVsdCBjb250
YWluZXIgZm9yIGFybSBjYW4gYmUgYWRkZWQuIEZvciBleGFtcGxlLCAgaWYNCj4gPj4+ICAiQ09O
VEFJTkVSPWFybTY0IGF1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUgYmFzaCIsDQo+ID4+
PiAgc2V0IHRoZSBkZWZhdWx0IENPTlRBSU5FUiBhcyAicmVnaXN0cnkuZ2l0bGFiLmNvbS94ZW4t
DQo+ID4+IHByb2plY3QveGVuL2FscGluZTozLjEyLWFybTY0djgiDQo+ID4+Pg0KPiA+Pg0KPiA+
PiBJdCBjYW4gYmUgYWRkZWQgZG9pbmcgdGhlIGZvbGxvd2luZzoNCj4gPj4NCj4gPj4gZGlmZiAt
LWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUNCj4gPj4gYi9hdXRvbWF0aW9u
L3NjcmlwdHMvY29udGFpbmVyaXplDQo+ID4+IGluZGV4IDBmNDY0NWM0Y2NjYi4uYjM5NWJkMzU5
ZWNmIDEwMDc1NQ0KPiA+PiAtLS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplDQo+
ID4+ICsrKyBiL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUNCj4gPj4gQEAgLTI1LDcg
KzI1LDcgQEAgZGllKCkgew0KPiA+PiAgQkFTRT0icmVnaXN0cnkuZ2l0bGFiLmNvbS94ZW4tcHJv
amVjdC94ZW4iDQo+ID4+ICBjYXNlICJfJHtDT05UQUlORVJ9IiBpbg0KPiA+PiAgICAgIF9hbHBp
bmUpIENPTlRBSU5FUj0iJHtCQVNFfS9hbHBpbmU6My4xMiIgOzsNCj4gPj4gLSAgICBfYWxwaW5l
LWFybTY0djgpIENPTlRBSU5FUj0iJHtCQVNFfS9hbHBpbmU6My4xMi1hcm02NHY4IiA7Ow0KPiA+
PiArICAgIF9hbHBpbmUtYXJtNjR2OHxfYXJtNjQpIENPTlRBSU5FUj0iJHtCQVNFfS9hbHBpbmU6
My4xMi0NCj4gYXJtNjR2OCIgOzsNCj4gPj4gICAgICBfYXJjaGxpbnV4fF9hcmNoKSBDT05UQUlO
RVI9IiR7QkFTRX0vYXJjaGxpbnV4OmN1cnJlbnQiIDs7DQo+ID4+ICAgICAgX3Jpc2N2NjQpIENP
TlRBSU5FUj0iJHtCQVNFfS9hcmNobGludXg6cmlzY3Y2NCIgOzsNCj4gPj4gICAgICBfY2VudG9z
NykgQ09OVEFJTkVSPSIke0JBU0V9L2NlbnRvczo3IiA7Ow0KPiA+Pg0KPiA+PiBUaGUgcXVlc3Rp
b24gaXMgd2hldGhlciBpdCB3b3VsZCBiZSBiZW5lZmljaWFsLiBBZnRlciBhbGwgeW91IHdvdWxk
IHN0aWxsDQo+IG5lZWQNCj4gPj4gdG8NCj4gPj4gdHlwZSBDT05UQUlORVI9YXJtNjQsIHdoZXJl
YXMgYXQgdGhlIG1vbWVudCwgeW91IG5lZWQgdG8gdHlwZQ0KPiA+PiBDT05UQUlORVI9YWxwaW5l
LWFybTY0djguDQo+ID4+IFRCSCBJJ20gbm90IHN1cmUgaXQgaXMgaW1wcm92aW5nIGFueXRoaW5n
ICg/KS4NCj4gPj4NCj4gPj4gfk1pY2hhbA0KPiA+IFtKaWFtZWkgWGllXQ0KPiA+IEkgYW0gbm90
IHN1cmUgYWJvdXQgdGhpcyBlaXRoZXIuICBJIGFkZGVkIHNvbWV0aGluZyBsaWtlIGJlbG93IGYg
dG8gcnVuIGl0IG9uDQo+IGFybTY0IG1hY2hpbmUuICAgQnV0IGl0ICBkaWRuJ3QgdGFrZSAicnVu
bmluZyBjb250YWluZXIgZm9yIGEgZGlmZmVyZW50DQo+IGFyY2hpdGVjdHVyZSIgaW50byBjb25z
aWRlcmF0aW9uLg0KPiA+DQo+IFNvIHlvdXIgcXVlc3Rpb24gaXMgbm90IGFib3V0IGFkZGluZyBk
ZWZhdWx0IGNvbnRhaW5lciB3aGVuIHNlbGVjdGluZw0KPiBDT05UQUlORVI9YXJtNjQsIGJ1dCBh
ZGRpbmcNCj4gYSBkZWZhdWx0IG9uZSB3aGVuIHJ1bm5pbmcgb24gYXJtNjQgcGxhdGZvcm0uIFJp
Z2h0IG5vdywgdGhlIGRlZmF1bHQgb25lDQo+IGlzIGRlYmlhbjpzdHJldGNoDQo+IChpZiB5b3Ug
ZG9uJ3QgdHlwZSBDT05UQUlORVI9IGF0IGFsbCkuIERvIEkgdW5kZXJzdGFuZCBpdCByaWdodCB0
aGF0IHlvdQ0KPiB3b3VsZCBsaWtlIHRoZSBzYW1lDQo+IGJlaGF2aW9yIHdoZW4gcnVubmluZyBv
biBhcm02NCBwbGF0Zm9ybSAoY3VycmVudGx5LCBpdCB3b3VsZCBhbHNvIHNlbGVjdA0KPiBkZWJp
YW46c3RyZXRjaCk/DQo+IFNvIHRoYXQgd2hlbiBleGVjdXRpbmc6DQo+IC4vYXV0b21hdGlvbi9z
Y3JpcHRzL2NvbnRhaW5lcml6ZSAuLi4NCj4gaXQgd291bGQgYXV0b21hdGljYWxseSBzZWxlY3Qg
YWxwaW5lLWFybTY0djg/DQo+IA0KWWVzLCB0aGlzIGlzIHdoYXQgSSBtZWFuLg0KPiANCj4gPiAt
LS0gYS9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplDQo+ID4gKysrIGIvYXV0b21hdGlv
bi9zY3JpcHRzL2NvbnRhaW5lcml6ZQ0KPiA+IEBAIC0xOCw2ICsxOCwxMiBAQCBkaWUoKSB7DQo+
ID4gICAgICBleGl0IDENCj4gPiAgfQ0KPiA+DQo+ID4gKyMgVGhlcmUgYXJlIHR3byBjb250YWlu
ZXJzIHRoYXQgY2FuIHJ1biBvbiBhYXJjaDY0LCB1bnN0YWJsZSBhbmQgYWxwaW5lLg0KPiA+ICsj
IFNldCB0aGUgZGVmYXVsdCBjb250YWluZXIgdG8gYWxwaW5lIGZvciBhYXJjaDY0DQo+ID4gK2lm
IFtbICQodW5hbWUgLW0pID0gImFhcmNoNjQiICYmIC16ICR7Q09OVEFJTkVSfSBdXTsgdGhlbg0K
PiBUaGUgb3V0cHV0IGZyb20gYHVuYW1lIC1tYCBmb3IgYXJtNjQgY2FuIGJlIGFhcmNoNjQgYW5k
IGFybTY0Lg0KPiANCj4gPiArICAgIENPTlRBSU5FUj0iYWxwaW5lIg0KPiA+ICtmaQ0KPiA+ICsN
Cj4gPiAgIw0KPiA+ICAjIFRoZSBjYWxsZXIgaXMgZXhwZWN0ZWQgdG8gb3ZlcnJpZGUgdGhlIENP
TlRBSU5FUiBlbnZpcm9ubWVudA0KPiA+ICAjIHZhcmlhYmxlIHdpdGggdGhlIGNvbnRhaW5lciB0
aGV5IHdpc2ggdG8gbGF1bmNoLg0KPiA+IEBAIC00MSw2ICs0NywxMSBAQCBjYXNlICJfJHtDT05U
QUlORVJ9IiBpbg0KPiA+ICAgICAgX29wZW5zdXNlLXR1bWJsZXdlZWR8X3R1bWJsZXdlZWQpDQo+
IENPTlRBSU5FUj0iJHtCQVNFfS9zdXNlOm9wZW5zdXNlLXR1bWJsZXdlZWQiIDs7DQo+ID4gIGVz
YWMNCj4gPg0KPiA+ICsjIENvbnRhaW5lcnMgZm9yIGFhcmNoNjQgaGF2ZSBhIHN1Zml4ICItYXJt
NjR2OCINCj4gPiAraWYgW1sgJCh1bmFtZSAtbSkgPSAiYWFyY2g2NCIgXV07IHRoZW4NCj4gPiAr
ICAgIENPTlRBSU5FUj0iJHtDT05UQUlORVJ9LWFybTY0djgiDQo+ID4gK2ZpDQo+IFRoaXMgaXMg
bm90IG5lZWRlZC4gQ09OVEFJTkVSIGNhbiBiZSBzZWxlY3RlZCBvbiB0aGUgZmlyc3QgY2hlY2sg
YW5kIGxldA0KPiBjYXNlL2VzYWMgYmxvY2sNCj4gdG8gZGV0ZXJtaW5lIHRoZSBmdWxsIHBhdGgg
dG8gY29udGFpbmVyLg0KPiANCj4gPiArDQo+ID4gICMgVXNlIHRoaXMgdmFyaWFibGUgdG8gY29u
dHJvbCB3aGV0aGVyIHJvb3Qgc2hvdWxkIGJlIHVzZWQNCj4gPiAgY2FzZSAiXyR7Q09OVEFJTkVS
X1VJRDB9IiBpbg0KPiA+ICAgICAgXzEpICAgdXNlcmFyZz0gOzsNCj4gPg0KPiA+DQo+ID4gQmVz
dCB3aXNoZXMNCj4gPiBKaWFtZWkgWGllDQo+ID4NCj4gPg0KPiANCj4gV2hhdCB5b3UgYXJlIGFz
a2luZyBmb3IgY2FuIGJlIGRvbmUgaW4gYSBzaW1wbGVyIHdheS4gVGhlIGZvbGxvd2luZyBpcw0K
PiBlbm91Z2g6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5l
cml6ZQ0KPiBiL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUNCj4gaW5kZXggMGY0NjQ1
YzRjY2NiLi40ZTdlOGJiNDhlM2EgMTAwNzU1DQo+IC0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9j
b250YWluZXJpemUNCj4gKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZQ0KPiBA
QCAtMTgsNiArMTgsMTEgQEAgZGllKCkgew0KPiAgICAgIGV4aXQgMQ0KPiAgfQ0KPiANCj4gKyMg
U2VsZWN0IGRlZmF1bHQgY29udGFpbmVyIHdoZW4gcnVubmluZyBvbiBhcm02NCBtYWNoaW5lLg0K
PiAraWYgWyAteiAiJHtDT05UQUlORVJ9IiBdICYmIHVuYW1lIC1tIHwgZ3JlcCAtcUUgJ2FhcmNo
NjR8YXJtNjQnOyB0aGVuDQo+ICsgICAgQ09OVEFJTkVSPSJhbHBpbmUtYXJtNjR2OCINCj4gK2Zp
DQo+ICsNCj4gICMNCj4gICMgVGhlIGNhbGxlciBpcyBleHBlY3RlZCB0byBvdmVycmlkZSB0aGUg
Q09OVEFJTkVSIGVudmlyb25tZW50DQo+ICAjIHZhcmlhYmxlIHdpdGggdGhlIGNvbnRhaW5lciB0
aGV5IHdpc2ggdG8gbGF1bmNoLg0KPiANCj4gfk1pY2hhbA0KWWVhaCwgSSBhZ3JlZSB3aXRoIHRo
aXMgIGltcGxlbWVudGF0aW9uLiANCg0KQmVzdCB3aXNoZXMNCkppYW1laSBYaWUNCg0KDQo=

