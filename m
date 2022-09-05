Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE215AD221
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 14:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398790.639743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVAwC-0005ib-G9; Mon, 05 Sep 2022 12:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398790.639743; Mon, 05 Sep 2022 12:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVAwC-0005fK-Cl; Mon, 05 Sep 2022 12:10:48 +0000
Received: by outflank-mailman (input) for mailman id 398790;
 Mon, 05 Sep 2022 12:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cA+y=ZI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVAwB-0005fE-5a
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 12:10:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5067bdf-2d13-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 14:10:45 +0200 (CEST)
Received: from AS9P250CA0004.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::12)
 by AS8PR08MB8087.eurprd08.prod.outlook.com (2603:10a6:20b:54c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Mon, 5 Sep
 2022 12:10:43 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::33) by AS9P250CA0004.outlook.office365.com
 (2603:10a6:20b:532::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 12:10:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 12:10:43 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 05 Sep 2022 12:10:42 +0000
Received: from 07b090eba8b4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9346E921-36E5-4101-BF24-21292C43DC23.1; 
 Mon, 05 Sep 2022 12:10:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07b090eba8b4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 12:10:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8626.eurprd08.prod.outlook.com (2603:10a6:10:3d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 12:10:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Mon, 5 Sep 2022
 12:10:29 +0000
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
X-Inumbo-ID: c5067bdf-2d13-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ixac/NeVPJw7xpDm82UcpVbBkzK0k4JM8eRMloRPsz1pB0kjHt84r/MrGYPMIpJXQw0aPU5Y6VFzEW79M2SE9sJ/Knr6StpXd8W9rnZDpj/EDQXjeNOTEdD4x/6pdicb2twQ/oHfF1oJbUSzmJCn3SQluQsoYJ7A/7dx2+iTXtH7C/CUXYodiWm84yR0oXTHRoOSeyZ9jmtuMOVq0qgmzPdVqdCdyCiSQa3g2k8KUHWLP23wVZz9/to/7HtDvNRBiE2kX7/8yTXM/n34xVX8r/U8HDgG0tW/j6tYlPQdEI2GyOm9G5n4PL4wGkJA/Zokz/+qHcKENYwJSBmL4Ten9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQNrynW96T7bdfkC1QPh5+rO/TbSBYGFxulXEpZ+MPo=;
 b=UATG8DC4/DlXMsFyFRMYwBMrn5sHr6RfbqLblgvDnUvzzzi8nYVOh29381Zw7H7tE3pyXRjbAx9jwlvGjLQudbVouZ4NqaEkMOwsJM7c4qmskgOINy6+42IB8893eN3lyI+7wxo0G9OQw5qNR326dXLZ90YeGyA692b0DMFfMYiigURGmmUcWgGY7tDqFJIZAh2l5+W/0/q8WC2wh4nfMzol3zUHZVhhUcdqPcdJvTGtlq9nEyc5PIeGOwoBogS2iunYva9HO+bB+sMaDoU089NtwimK8emuIEyLK0cER4WSxAt4t4cvuIu4pmondRs0BaAAPHjtR4b4DtdcVmctHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQNrynW96T7bdfkC1QPh5+rO/TbSBYGFxulXEpZ+MPo=;
 b=DylgcMwd7gUYjL3+lc86TanoK5SbhCss1zCpf0jN77/droZIy9urqEh7ECgY5phVRCpVle8rYoxW9c5R6zjhiiRQ0NZs38om8gpfN5+8TTbnjFiV1/lnpN0LU/KXxZzi/PqV88tHALlx24h7PTglcoF2/BUeQORrxD5Z+XaDYa0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWv2BQXCEnWJMaMNf74xC6FADZByo5R3YnvJ/cSGTujSVkJcEP6SKLNx3InVfQ6i+DS9LpGHlx+oCjpq3g0quaqKoOq3LQKdaeezZIYAgBJ4AnCWlJdWLq6EV0MKap8NzLvAircoAY0SmsarcFkXd0M2xZwa/e4NNVq1IVudd0BKpAwbtSXiogM1RjDXZ/JL+7LHASgCOCYWeFkKeMVYCDQTwwGqSdr4glCMPtZ/+mDZFZRm8ZWjIT+AOCX1aI/8F597IQbF4y5LD9LQtTNshIwCwgq7YnyCXlFAdATuGEAGWrdI/mlLxiwXeTcER1YevZzdmgTXTlqoLLrYa5TDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQNrynW96T7bdfkC1QPh5+rO/TbSBYGFxulXEpZ+MPo=;
 b=DddbSiBxsqxtYrvgz0Uz3X2ZJgpu6B03uBQzEKehM58tXHsgi8Jqp0CEgxshsCBppdYiUzJU9h8vNw5LyaLrRs2rTaYDPbqm8/PqR/3NthD89Sz22pApHpQUUbaOkv8iGGO5DBPt5Yj7OvCJk5oFXvOhd7dr6iaFHiFs6hyPpN6JlOsx8Meaqe7jIwE4t/57OUqX6OC8rOw+3nt8LXjxTiUWrkxWrR4tuyyfZK7lJ7jNlRNgwYUPa4icCjKYtZ5fieFZgFlEMgYnCbl9yqNj8uABbqP1eP4A5wZpkFYCaT0WVyqmp/lmxx4+FImDELz2rXiVbf2Ok0aRGIZZTU94pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQNrynW96T7bdfkC1QPh5+rO/TbSBYGFxulXEpZ+MPo=;
 b=DylgcMwd7gUYjL3+lc86TanoK5SbhCss1zCpf0jN77/droZIy9urqEh7ECgY5phVRCpVle8rYoxW9c5R6zjhiiRQ0NZs38om8gpfN5+8TTbnjFiV1/lnpN0LU/KXxZzi/PqV88tHALlx24h7PTglcoF2/BUeQORrxD5Z+XaDYa0=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny
 Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYwPjzoXW29+zrjEaaAKDaLd6E0a3QvVUAgAAAVfA=
Date: Mon, 5 Sep 2022 12:10:28 +0000
Message-ID:
 <AS8PR08MB799171AAFC54EEF2620392DF927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-2-Henry.Wang@arm.com>
 <d62add1a-3e05-7aaf-f44e-f2b3c8c0cfca@amd.com>
In-Reply-To: <d62add1a-3e05-7aaf-f44e-f2b3c8c0cfca@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F074D8DE7FED064686B8C9809A1DA453.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 39e73607-52b4-4312-a38e-08da8f37a82a
x-ms-traffictypediagnostic:
	DB9PR08MB8626:EE_|VE1EUR03FT024:EE_|AS8PR08MB8087:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cXDy46Mx2avbhHBrzLsOXWCX7UhoHs3/Vx5p7xbVnWZOfJY4VJWuPGcXPJ57YHYGRt4QrpzX3ujy3Tpm85kLCwx0lt2ytKWMjGACNsa6pWy3P5uhczkoI32rTBXJ7JH7kmwIkc+RD8Uo5/KXfmWEIVtk0PpNkKg5W8DKYz/2zcAxz5c0sYsOoNNKGrKEJ641ALMr42vnkCxD3q2IQ1CbcVms9Be76dHthzH9NfsTf9BUQAF3P4P7ayBRv2+YMuqTS5lvA5Xt12y/BL9e/r4/gbg+uiqw1QkB9UI2TofVGNXChzWFfCZ9AvxwFkU2c01vKYB09BOKl/DdfVEQx8WwvcDJfx6aUft1Vl9roPsST6EXfmZBLLdpAl/nVO+HVVXd6YsMmq77GXl43VmtbVDM968OsmbTq2OGIGBjb1IpbR0Z92iuqlgvZVdWvPlCcbmiLbocJ1CulI3S53BD5gLP4FRdSIoMIP9rAhaVe5jdT96v0X2D6DnrPFWSAxHJaQWETGHG7Kz6aHijzZyMCQEdseY2XsA3Ra2uostfhT5Eb6XidIwUnOoD1Ba5fTBHAEX0rznFmVL+8fvZo77Eq16EPGU7iOO67fCj+U5uK1FBkupH/fjsajkDU/VjjKkxFk+5lU5Yj8ps0YD2FbnkJc/+R3WGqEHUqnnMPZ3jTu9abUGApbSvdd964C2UyNwF/Oy2NPg15QCQkNXfdpS6ApD/A9fz4VMTVgVwUt0RDFn+u1eQtDRVgeZ0fjerzauVgik5kQwjWMOAHx/6TIk6KxmCQw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(4326008)(86362001)(7696005)(38070700005)(55016003)(8936002)(76116006)(110136005)(64756008)(71200400001)(54906003)(4744005)(66476007)(66556008)(66446008)(33656002)(66946007)(316002)(8676002)(478600001)(41300700001)(83380400001)(38100700002)(5660300002)(52536014)(2906002)(26005)(6506007)(9686003)(186003)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8626
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7fbba20b-9bcf-495f-50f3-08da8f379f8c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L0sXJ5ACvD+xCTld/W4Y3CgQLlpPxaTT0DLcGT6VUYn3vMBsNKfCkrWgahFXphFH4ETvyC4WWR+pqWJBojd2EBoqL6+OZtP45fpqHEoUGuuzKkQ9mh5HjbhNcisyU616oEXf0WfricvSgMGeN1eIGOD0z6saXsp3jaj5WLd1pIjD0Zg4lA9Fv5BLnTbPqIJh+a0UhzZOXliZmPV47ZDwmIn/amCLRVBmsiKTmNvcO2xSKA70Voviyx3uCGlTk90V5yZIVFbm33p9m7Dw2kjWUY1AuQwhgR0UVPQy51ZFyR/RSD+4Y/ZQVEC1/OxhcyhU/y5cRh52NSBVVxwevkksfEqtCp8Ze4FoKPdc8baUTD3sAG5eTNW0KFFCW1avaLJS2mP+oddvSRUjGmwHvguaJb8MsyVCQkllVf0tk5AQUu7zkXseC1NhuxbTamT4tm/FfBdUt9mfQ38bz05pxufETc4zRFAJKcak2xvcMuWDAro+VcjIZte2rdxm2jaGMiDHM0z+HLeE8wkHaQBF0Y1e8EXr9ozeP7HxIXez6+HRSbb6ZSWXDDUmGF/GBbhiMPGfi/E/I01X+GOGGJIBO9klo2NnU9nR4lR9gAx7uFfmjqNe85XuTwuKGbs+R8sjrtmzs5zGz5zStxFVi8WagmS7v/q3YBcLjFxxW7KIOtnDv+Yemc/7tx68mSoJerQ0dNefCGeBRiJRaW+c3+4EoH0BFU6I5cVMOtVFo8ORM8xEaZSj/9dqlGfJhzlGH0VRbS98Usax7cLkyQF4nDqCA+8REw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(346002)(136003)(376002)(36840700001)(46966006)(40470700004)(4326008)(356005)(82740400003)(81166007)(40460700003)(36860700001)(8676002)(83380400001)(54906003)(316002)(82310400005)(70206006)(55016003)(110136005)(70586007)(8936002)(5660300002)(2906002)(9686003)(52536014)(47076005)(4744005)(40480700001)(26005)(336012)(186003)(7696005)(6506007)(478600001)(41300700001)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 12:10:43.2748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e73607-52b4-4312-a38e-08da8f37a82a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8087

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4gK3R5cGVkZWYgZW51bSB7DQo+ID4g
KyAgICBNRU1CQU5LX01FTU9SWSwNCj4gPiArICAgIE1FTUJBTktfWEVOX0RPTUFJTiwgLyogd2hl
dGhlciB0aGUgbWVtb3J5IGJhbmsgaXMgYm91bmQgdG8gYQ0KPiBYZW4gZG9tYWluLiAqLw0KPiA+
ICsgICAgTUVNQkFOS19SU1ZEX0hFQVAsIC8qIHdoZXRoZXIgdGhlIG1lbW9yeSBiYW5rIGlzIHJl
c2VydmVkIGFzDQo+IGhlYXAuICovDQo+ID4gK30gbWVtYmFua190eXBlOw0KPiBXaGVyZWFzIHRo
ZSBwYXRjaCBpdHNlbGYgbG9va3Mgb2sgKGl0IG11c3QgYmUgbW9kaWZpZWQgYW55d2F5IGdpdmVu
IHRoZQ0KPiBjb21tZW50cyBmb3IgcGF0Y2ggIzIpLA0KPiBNRU1CQU5LX1hFTl9ET01BSU4gbmFt
ZSBpcyBxdWl0ZSBhbWJpZ3VvdXMgdG8gbWUsIG5vdyB3aGVuIGl0IGlzDQo+IHBhcnQgb2YgbWVt
YmFua190eXBlIGVudW0uDQo+IFNvbWV0aGluZyBsaWtlIE1FTUJBTktfU1RBVElDIG9yIE1FTUJB
TktfU1RBVElDTUVNIHdvdWxkIGJlDQo+IG11Y2ggY2xlYW5lciBpbiBteSBvcGluaW9uDQo+IGFz
IGl0IHdvdWxkIGRpcmVjdGx5IGluZGljYXRlIHdoYXQgdHlwZSBvZiBtZW1vcnkgd2UgYXJlIHRh
bGtpbmcgYWJvdXQuDQoNClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIEkgYW0gcHJldHR5IGJh
ZCBpbiBuYW1pbmcgdGhpbmdzIHNvIGluIHRoaXMgcGF0Y2gNCkkgc2ltcGx5IHJldXNlZCB0aGUg
b3JpZ2luYWwgbmFtZSBmb3Igc3RhdGljIG1lbW9yeSBiYW5rcy4NCg0KSSBwcmVmZXIgTUVNQkFO
S19TVEFUSUNNRU0gYW5kIHdpbGwgY2hhbmdlIGluIHYzLiBJIHdpbGwgY2hlY2sgdGhlDQo4MCBj
aGFyIGxpbWl0IGluIGN1cnJlbnQgY29kZSwgaWYgU1RBVElDTUVNIGRvZXMgbm90IGZpdCwgSSB3
aWxsIGdvIFNUQVRJQy4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gfk1pY2hhbA0K

