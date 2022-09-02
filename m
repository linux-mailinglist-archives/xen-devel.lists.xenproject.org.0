Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0E5AA61B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397207.637696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTwxX-0007yh-7X; Fri, 02 Sep 2022 03:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397207.637696; Fri, 02 Sep 2022 03:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTwxX-0007wX-4I; Fri, 02 Sep 2022 03:03:07 +0000
Received: by outflank-mailman (input) for mailman id 397207;
 Fri, 02 Sep 2022 03:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTwxW-0007wR-19
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:03:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2e203e2-2a6b-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 05:03:03 +0200 (CEST)
Received: from DB6PR0802CA0047.eurprd08.prod.outlook.com (2603:10a6:4:a3::33)
 by DB9PR08MB7536.eurprd08.prod.outlook.com (2603:10a6:10:304::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 03:03:01 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::89) by DB6PR0802CA0047.outlook.office365.com
 (2603:10a6:4:a3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 03:03:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:03:01 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 02 Sep 2022 03:03:01 +0000
Received: from 50fe2378898e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B8B40D6-F81E-4EF7-A80C-170BCA451B82.1; 
 Fri, 02 Sep 2022 03:02:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50fe2378898e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:02:50 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU2PR08MB7327.eurprd08.prod.outlook.com (2603:10a6:10:2e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 03:02:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 03:02:46 +0000
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
X-Inumbo-ID: c2e203e2-2a6b-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qfh6K46Gp6JhQJDaR6jXyMB1CqOyf++EfiUUI/GLWYQaOmRId4FmBIphqwWzSa7+N2cpu9OgXFAYJPleszUAFRz64mkUw69Nn04Nil1v3vnEkc28PLoaa9zUja01Ry9q0OSvRKO/zHblp9zhwxRoafheYYVjkKeu7W0GRqRXtZzIDcIKAXFwo2HvggGE9Yb1w88+RuUHITNoxcaCl9o9EuEfGIYO2ekZ11f2WIq7LQaGVtJCfG4Jo10K9mQDsSJjd7GMtBtA9xdq5rDE1NdCZGpUXhOunH+2ufAi/lgCaCJxytU2SNeSlaljzTyVWq5yNNPpGfTpeGduY7JjGNPhDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2YK5W2c0+o6jMVXpn2NDPqx4MigGfzXG59s+OIzKNk=;
 b=WsTUgEuGixDe7tfEPhaymkpv68dvUR/X+HhNkKvp37hqu1oDP2BYz/DOkoHxHn0irP8avQwMsj5uGyq/VMlt5i4za5dz80lgil2jtUVrj4atSyGyKHDWoYAMY8wvEnwfkk8yZHpZoXk1ASCSilvT0XzJnEISbnJGAC5395PK7vM+O6ojWKURrjW2iSMBErSKmve21BiuP4xs1jyDvROVU9EXry9iiJtzedMdlBUCeOdiouJteowYN/u5OcciUD6+hpgzhH6HWjxA0SUtud8TFG4ntytxJ3m+w6WFylz0JE4CHX56BKSZCxtfOdT7yvkC3b9Yn9reJ1Xsb17weNjhtw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2YK5W2c0+o6jMVXpn2NDPqx4MigGfzXG59s+OIzKNk=;
 b=ALeXvsux7xnikyncx4MY/KcnKW6Mbk47qhc2BOpZ3lIQl8cnBNOAMkGz8THTeklItBU0QbPW3HTy70OI60fn5ELVAe0sWE9nostEE4PxHDxZEy8YlJsNuuvwAr2ItlxcGkyVRNMVdhtaVUSQy9VWKSP8aNsC33m/V9NFsoRicCI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr1mvuaIECnte4B48EQDAAxrcz1EqDP4WVtsWhK6lemNQLNg3z7KeuVMginJE1Q+q1zHoRg5eW87iDo52JgCXcxfyt8pSShT+NCYFAxeOz9Q5EmBV4JYJ8J7qjZEWBg/gHs8pdbZbq3CVGg5d4hIVEUlA/ubgsrR+mYvH4WgEq0niktfIxItbeuetugZvRtDeubfvLk+TpwetSbSt75sHi9DNDRq3C+JoFG6qTdnYwA+tfcFHLsuZ9EcAcSRlk9TIP29abTDsLlD3q6Pc0ffKMcNWTQa4n8/9H9SYP0qzxxxE8at1n4GZgm20pc+FYR+vocdOLgy+udvJOvnyiZalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2YK5W2c0+o6jMVXpn2NDPqx4MigGfzXG59s+OIzKNk=;
 b=XczaPO0uxioQJ+2JFXfnQN7A3y39JQzEtCwj8C0GuncyhthNb6DpruV66t2atIvPRMDzKOlDsFb3rTPhE8xUt2qbsCRGfKpg2Zmsw8N+H64j9xmtuxisSOYI5IF9w5JtO/oXvo8j+ZrjoAfsy7eqtXC84Cre2ootWZrccfyCKzzRIrhGMY6cBmyebfp99R5xpSiFSbdf1VWsx76fN99mxUKJHPE1JlXFzCbyXrRfcIoAMOCHbQ7Xk5NQGDbv1eAO+KJJWivybpa6Wa5uep+AEGmKCKI+6K1+lZ+MCB6NQAmI7K88xotvocNiNzHPLOqwoNRD+IOquMies2/BcS6jKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2YK5W2c0+o6jMVXpn2NDPqx4MigGfzXG59s+OIzKNk=;
 b=ALeXvsux7xnikyncx4MY/KcnKW6Mbk47qhc2BOpZ3lIQl8cnBNOAMkGz8THTeklItBU0QbPW3HTy70OI60fn5ELVAe0sWE9nostEE4PxHDxZEy8YlJsNuuvwAr2ItlxcGkyVRNMVdhtaVUSQy9VWKSP8aNsC33m/V9NFsoRicCI=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugxTCtO4LgrkGJKD3tY8acia3KwCgAgAAJ8YCAABHIAIAABy8AgACKuYCAAA6DsA==
Date: Fri, 2 Sep 2022 03:02:46 +0000
Message-ID:
 <PAXPR08MB74203A415B8F56B83B20B7739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2209011003570.2375071@ubuntu-linux-20-04-desktop>
 <fc0706f6-7635-6b0d-811a-c3ed41f481fc@xen.org>
 <alpine.DEB.2.22.394.2209011849040.3931@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209011849040.3931@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3825349A336EFC4A9ACDAA841306AAA6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d70ff47b-0206-45e3-7b6b-08da8c8fa5af
x-ms-traffictypediagnostic:
	DU2PR08MB7327:EE_|DBAEUR03FT009:EE_|DB9PR08MB7536:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kbnC+2hf4As0b6O7Ah+rQz8YItj8PR+wy3r5EFD3iRCS0h9TtSCpVS5K4kkWhbHfnTwChLi1+kLEnzU2qYTtqp2QtLPG88HeeBqnJVATAx5cqLGgy4QiuSsKK2TC1MhnpCCvy5+Rki4l/8u8IARso/hDIX0wNyeE9bSIvvddx6nxI6PnGEApbNIoueogzi8cJRFiuAQiqrpFZhG648AGCnAGU9UIvMm5FghG7hveZLXy7HgWkeP07k3CxD4cOkUtWETiBEKNx4dEZFyh9Mp7tOe+bvsaZovrn1ou6PKy2qeLJecw/hhEjDlEGki32tfwHRsSF/ZANlaoxSH4yAx/QlPPLZ4ZYp/SWNZ2XoflJdhE0Ol6N5T7gi5z1cPLi0Y4HIuJZxzH1x79+RbKDsItjYdKQPAbD0R6IC4f+WTPGL4w4uRA1asKaxCCC0xNvG66XlSunXqaHbf8W4L47+pBJDZcHCTLQoWRwFOz3Wf7vYj2r2j0cQCBmBD2AEs9sjcWo1DD/bEDsKKSgAkGg2PQ14E97lrfBo3KnuaHbNz6iA/s9cGCgrJchd3G3FtNa7V+RBx2NIPp4gDfQRTtSCGZy4F2/FYbG/jOHBZZpoxACZO0izFrlIpHnHISnzF+vtBbL0ADv71Se8X6ES2y+rNaDAGOhfBoDCer2e+l6jDqgna8f81pypuMe8AB8oAMAwCZAw+L0IiEUjxd49YirCzp71GreO+pwk1ZR889w3uJQZXZ3NY0FE7+9ay/LV0ymDhZGjZaJaklsfwgDQQBNOK2Tg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(53546011)(55016003)(6506007)(7696005)(54906003)(316002)(86362001)(478600001)(9686003)(41300700001)(110136005)(38100700002)(122000001)(186003)(83380400001)(38070700005)(71200400001)(66476007)(66556008)(8676002)(4326008)(66446008)(64756008)(33656002)(8936002)(66946007)(2906002)(52536014)(5660300002)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7327
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ed802d5-bd84-42c6-2d4a-08da8c8f9d0c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2BFqGsg+JBhhNn4G+oPVhQlT2eGc6OhkVUSZKWHcNTlDCM7Z2NdKxaXYogu3MM0NI1Z96xlD1gaufFJkfPTfr1Crx8+Ortx+xd2LHOgoaGpUxzL2k9ooXmf4ettvdYyBfUB7m2cQhzYPeQLRoHhVhkPxIZNYMriy79znv+nKMkaYycm9U76AkcQcVMi2TMSdojY/itXqNgVmVyhhtA/e+7+NLK6pmef1VYD51Y9rDeO8ZeAnijY2uvIOHCu0TRnT0q3iLGDgTg+IQcdE1LuHaFaEFpobz2PwSgsWZi5/xhZF5gcn7RaFOkrOtbSo2BVB8JlUCvuPL/TfQgCdhDl52e95HeJJmlGdhyLNZeL+oKY9zR2pWt7FqrnoSsGA1lPJOUHvi7OediLfNknXu4bc8+N02dCvzh38b0hZtwMTXhRLOHflIXTkMrAx4ckU1XE2vlXlEyzPwsfsi8wz/eaTqBs/GtvJmiQiPx5sXg+s8lFuYhV69hhSEWt6/88a+sPYLLclRC2XwCZhYi9+XYdSrA/npGmXWTuu/Yt9ef/HHPRzVSpdbJ15BKkNshAIX43lVQ/9Ad2Urva7WSXQEqefSk2Wh6YfJ2BQj8AT0dCxAkIm+HPG3lpgSEjNKwBAGhYsbu8HsYJd7F9+j6OUbNgariVSl7xXa1TCpCMhFD+NLlRnsVxYOVQuPiiB77vpjOKhAsRxEc1U4PocGOpyg81sR3VIJIhDZRiywrTJNnkqZajF4SlLHZ5jzyh79ehAEWk8PCV9N4wIxlQFXesp4GnewQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(36840700001)(40470700004)(46966006)(5660300002)(36860700001)(83380400001)(9686003)(40480700001)(55016003)(8676002)(40460700003)(478600001)(70586007)(26005)(4326008)(82740400003)(2906002)(33656002)(70206006)(53546011)(356005)(47076005)(86362001)(107886003)(52536014)(316002)(82310400005)(110136005)(81166007)(7696005)(54906003)(6506007)(186003)(336012)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:03:01.4143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d70ff47b-0206-45e3-7b6b-08da8c8fa5af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7536

SGkgSnVsaWVuIGFuZCBTdGVmYW5vLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2Vu
dDogMjAyMsTqOdTCMsjVIDk6NTENCj4gVG86IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBIZW5y
eSBXYW5nDQo+IDxIZW5yeS5XYW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15
cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0geGVuL2FybTog
SGFuZGxlIHJlc2VydmVkIGhlYXAgcGFnZXMgaW4gYm9vdCBhbmQNCj4gaGVhcCBhbGxvY2F0b3IN
Cj4gDQo+IE9uIFRodSwgMSBTZXAgMjAyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+IEhpIFN0
ZWZhbm8sDQo+ID4NCj4gPiBPbiAwMS8wOS8yMDIyIDE4OjA4LCBTdGVmYW5vIFN0YWJlbGxpbmkg
d3JvdGU6DQo+ID4gPiA+ID4gQWxzbywgd2hhdCBoYXBwZW4gd2l0aCBVRUZJPyBJcyBpdCBlYXN5
IHRvIGd1YXJhbnRlZSB0aGUgcmVnaW9uDQo+IHdpbGwgbm90DQo+ID4gPiA+ID4gYmUgdXNlZD8N
Cj4gPiA+ID4NCj4gPiA+ID4gRm9yIG5vdyBJIHRoaW5rIGl0IGlzIG5vdCBlYXN5IHRvIGd1YXJh
bnRlZSB0aGF0LCBkbyB5b3UgaGF2ZSBzb21lDQo+IGlkZWFzDQo+ID4gPiA+IGluIG1pbmQ/IEkg
dGhpbmsgSSBjYW4gZm9sbG93IHRoaXMgaW4gYWJvdmUgZm9sbG93LXVwIHNlcmllcyB0bw0KPiBp
bXByb3ZlDQo+ID4gPiA+IHRoaW5ncy4NCj4gPiA+DQo+ID4gPiBGb3IgY2xhcml0eSwgYXJlIHdl
IHdvcnJpZWQgdGhhdCB0aGUgcmVnaW9uIGlzIHVzZWQgYnkgdGhlIGJvb3Rsb2FkZXINCj4gPiA+
IGZvciBvdGhlciB0aGluZ3M/IEZvciBpbnN0YW5jZSBVLUJvb3Qgb3IgVGlhbm9jb3JlIHBsYWNp
bmcgc29tZQ0KPiA+ID4gZmlybXdhcmUgdGFibGVzIGluc2lkZSB0aGUgcmFuZ2Ugc3BlY2lmaWVk
IGZvciB4ZW5oZWFwPw0KPiA+DQo+ID4gWWVzLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGRpZmZpY3Vs
dCBmb3IgYW4gYWRtaW4gdG8gZmlndXJlIG91dCB3aGljaA0KPiByZWdpb25zDQo+ID4gYXJlIHVz
ZWQuIEFsdGhvdWdoIHRoZXkgYXJlIGxpa2VseSAoPykgZ29pbmcgdG8gYmUgc3RhdGljIGZvciBh
IGdpdmVuDQo+ID4gVUVGSS9VLWJvb3QgYnVpbGQuDQo+ID4NCj4gPiBNeSBtYWpvciBjb25jZXJu
IGlzIHN1Y2ggYnVnIGNhbiBiZSB2ZXJ5IGRpZmZpY3VsdCB0byByb290IGNhdXNlIGJlY2F1c2UN
Cj4gd2UNCj4gPiBoYXZlIG5vIHNhZmV0eSBpbiBYZW4uIFRoZSBtb3N0IGxpa2VseSBzeW1wdG9t
IHdvdWxkIGJlIHJhbmRvbQ0KPiBjb3JydXB0aW9uLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgY2xh
cmlmaWNhdGlvbi4gWWVhaCwgSSB0aGluayB3ZSdsbCBoYXZlIHRvIGRvIHNvbWUNCj4gImNyZWF0
aXZlIHRoaW5raW5nIiB0byBmaWd1cmUgb3V0IGEgc29sdXRpb24gdG8gdGhpcyBpc3N1ZS4gSSB3
b25kZXIgaWYNCj4gVS1ib290IG9yIFRpYW5vY29yZSBoYXZlIHNvbWUgc29ydCBvZiBBUEkgKG9y
IGJ1aWxkLXRpbWUgZGF0YSkgdG8ga25vdw0KPiB0aGUgdW5hdmFpbGFibGUgcmFuZ2VzLg0KPiAN
Cg0KV2hlbiBYZW4gaXMgYm9vdGVkIHRocm91Z2ggRUZJLCBhbGwgdGhlIG1lbW9yeSBzdGF0aWNh
bGx5IGRlZmluZWQgaW4gdGhlDQpEZXZpY2UgdHJlZSBoYXMgYSBjZXJ0YWluIHByb2JhYmlsaXR5
IG9mIGNvbmZsaWN0aW5nIHdpdGggdGhlIG1lbW9yeSBvY2N1cGllZA0KYnkgRUZJLiBUaGlzIGlz
IGRpZmZpY3VsdCB0byBhdm9pZCB3aXRob3V0IHRoZSBFRkkgYm9vdGxvYWRlciBpbnRlcnZlbmlu
ZywNCmJ1dCBpdCBpcyBwb3NzaWJsZSB0byBkZXRlY3Qgc3VjaCBhIGNvbmZsaWN0Lg0KDQpGb3Ig
RUZJIHJlc2VydmVkIG1lbW9yeSByZWdpb25zIChsaWtlIHJ1bnRpbWUgc2VydmljZSksIHRoZXkg
d2lsbCBub3QgYmUNCnJlcG9ydGVkIGFzIHVzYWJsZSBtZW1vcnkgdG8gWGVuLiBUaGUgdXNhYmxl
IG1lbW9yeSByZWdpb25zIHdpbGwgYmUgYWRkZWQNCnRvIGJvb3RpbmZvLm1lbWJsayBhcyBkZXZp
Y2UgdHJlZSBib290LiBTbyBJIHRoaW5rIGFsbCBzdGF0aWMgZGVmaW5lZCBtZW1vcnkNCnJlZ2lv
bnMgd291bGQgYmUgY2hlY2sgd2l0aCBib290aW5mby5tZW1ibGsgdG8gZmluZCB0aGUgY29uZmxp
Y3QuDQpGb3IgRUZJIHJlbG9jYXRlIFhlbiBhbmQgRFRCLCBJIHRoaW5rIFhlbiBpdHNlbGYgY2Fu
IGtub3cgdGhlc2UgYWRkcmVzc2VzDQplYXNpbHkgYW5kIGVhc3kgdG8gY2hlY2suDQoNCkJ1dCBp
ZiB3ZSBkb24ndCBhZGQgY29kZSB0byB1Ym9vdCBvciBFREsyLCB3aGF0IGNhbiB3ZSBkbyBhcmUg
anVzdCBjaGVjaywNCnByaW50IGVycm9yIGFuZCBwYW5pYy4gQnV0IHN0YXJ0aW5nIGZyb20gdGhl
IGFjdHVhbCB1c2FnZSBzY2VuYXJpbywgYmVjYXVzZQ0KdGhlIHNjZW5hcmlvcyB1c2luZyBzdGF0
aWMgaGVhcCBhcmUgbm9ybWFsbHkgaGlnaGx5IGN1c3RvbWl6ZWQsIHRoZWlyIEVGSQ0KZmlybXdh
cmUgd2lsbCBieXBhc3MgdGhlIHN0YXRpYyBtZW1vcnkgd2UgZGVmaW5lZCBpbiBkZXZpY2UgdHJl
ZSB3aGVuDQpjdXN0b21pemluZy4gU28gbWF5YmUgY2hlY2sgY29uZmxpY3QgaXMgZW5vdWdoPw0K
DQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+IEluIGFueSBjYXNlLCBJIHRoaW5rIHdlIGNhbiBwb3N0
cG9uZSB0byBhZnRlciB0aGUgcmVsZWFzZS4NCg==

