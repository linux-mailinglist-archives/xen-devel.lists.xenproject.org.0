Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C72573394
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 11:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366419.597187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZ5c-0008Ew-4h; Wed, 13 Jul 2022 09:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366419.597187; Wed, 13 Jul 2022 09:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZ5c-0008CJ-0Y; Wed, 13 Jul 2022 09:55:28 +0000
Received: by outflank-mailman (input) for mailman id 366419;
 Wed, 13 Jul 2022 09:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKIO=XS=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBZ5a-0008C9-Aj
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 09:55:26 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30079.outbound.protection.outlook.com [40.107.3.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9ac688a-0291-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 11:55:23 +0200 (CEST)
Received: from AS9PR06CA0686.eurprd06.prod.outlook.com (2603:10a6:20b:49c::31)
 by PA4PR08MB6109.eurprd08.prod.outlook.com (2603:10a6:102:e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 09:55:12 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::dc) by AS9PR06CA0686.outlook.office365.com
 (2603:10a6:20b:49c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13 via Frontend
 Transport; Wed, 13 Jul 2022 09:55:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 09:55:12 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Wed, 13 Jul 2022 09:55:12 +0000
Received: from e63c0c5efd1a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 490BC017-0949-4CB1-9AAD-6E86ADEAE12E.1; 
 Wed, 13 Jul 2022 09:55:06 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e63c0c5efd1a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 09:55:06 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB4508.eurprd08.prod.outlook.com (2603:10a6:10:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 09:55:02 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 09:55:01 +0000
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
X-Inumbo-ID: e9ac688a-0291-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Bg9UAO2hlHOs0WLs9RkHB1+VLo1uDGr/AgtNxbwdNyFo5dkI5haG8bdXQXU71kqElFNr7PG1KCVSoN4dRbm3UqPjIQ5qRNzQ1q9d3c7PZ61qPhiazbCyQRUO7oBQMGJJZmgPvLF3dwCicb0W/F0qHavYkABrvqaIPJxd2y8oktBpKehEbEvXBgaZN4s0EjY/HucZtg6HWB2jPuJ57gMyraK76mME6LIvGaqgzkbyrCEy9M8Hn4+tWVVGr8lV8gF0OkDquPpxAHPlvm6/kKG2cCXJBgh/6C9DTLeo7y2l+fB76cgcYl8YWPqrXFEtm5fPHjlxKTcgbl7eNia6kv4+Ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9txsKsPbDZzB2FRkjPadka9vdNHbyuA9a4+baEjCFc=;
 b=cRciNrOLWjOMyrisM6XG1uIU/Nh9SfvDcPNsmphC9jr92aNrua3JnApfmjQFKHUJX/0tqyLg5/gQ3WDjfJZ+lyvivqO8qagxCzgPhN3DB7LA9fw9eIaqgO7wZFU9Pu9MHMtuD1MRL8eQ72p5omqD/A9R2riX7bRIsgaS9Kb11k5Z/51+ac2mz1bRJsmov4UDjSLCg+6dB9erVELMNLpbwBIIqbbshQPkvp9gkaA8eWWiCSdcgxopBxwsyDAVI2dQCNh7xVo57GRA/5Se8NSChdIK4fhGNx8jvZhs5mCP/R9jUtpkpyM1ItPeDnOEkhkBXGRG24wIA3N3aPBpLCie6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9txsKsPbDZzB2FRkjPadka9vdNHbyuA9a4+baEjCFc=;
 b=ip66Oj022UgfY967qO9kqojbc73ivwuTM4XpAuPl+Qa+3d3Q+zJmLPfdkJQY8AV/g8fVNwffNJcRMTEa4w2GVv/QfFyNkBlEg3VNj/CaeilXuLqaDVYa9sSHcYjIytHZvG1j6/AiFV8r4Ivcu1wK6e/W7pvuuf+tRZe2Z+KS7O8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU2WERTQciHB8cbPTmHzuFNt3ZG4CGr7clKz0/HdqbnAhNSuoLgGZR/ODA4eHYNBIit0xwruK8f5CZw6rb+Svtqch0WRHjd9wH/+In8E7d75yowvBcP1FBYZmuM8ZfqSTbWpR36EsvGzUIc+/T3HKRrkj/AGKWfcpn2tZfWY6MUJVg3y5wZtItGfDCPp7tYJeXGiAGqWauwr9zfCVjDZuOGZnTcfaWOZZAm4egwC0qhQOe4BY+KC4fKFr/U1yaqgMms+agllLsPjF/lIoS1y0FwSIeZjyXy4emJGKF1QLfmytrv39G0fiE6ChfoqAerW8rKyzWa6VTyeU3cOl9HZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9txsKsPbDZzB2FRkjPadka9vdNHbyuA9a4+baEjCFc=;
 b=Gk8uDu78cgKkVCPf/kpzatYLyT0KtK3AQ8qe49tvVfHQfho73+8t8hfgadnKh/eRnh03bMNJsN38KkpaRFd3MTvfjFhsMIKoUwq3HR4M70Eh93Pwoln8FI3ka7LUkeQ065rOP/OlMT185DKHmJ9quaKdK/oGaa219qE0P1PeM/kbfi87LV0TCS7HfbmUY4ZITEzq5r8807InVtN6qPNzy1u8SDA5Nor8wOkt9IUquLAmb4wh+IsCWZ+phUM/czFWSl2ZYIofTxvXKQaLCt6uKR5zXNA8ogoPb4pgzgaTno/8M9vW+/F2eu8a07pr5a0+TJeu9CPLFCEFmxvLftb1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9txsKsPbDZzB2FRkjPadka9vdNHbyuA9a4+baEjCFc=;
 b=ip66Oj022UgfY967qO9kqojbc73ivwuTM4XpAuPl+Qa+3d3Q+zJmLPfdkJQY8AV/g8fVNwffNJcRMTEa4w2GVv/QfFyNkBlEg3VNj/CaeilXuLqaDVYa9sSHcYjIytHZvG1j6/AiFV8r4Ivcu1wK6e/W7pvuuf+tRZe2Z+KS7O8=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 1/9] xen/x86: introduce a helper to update memory
 hotplug end
Thread-Topic: [PATCH v2 1/9] xen/x86: introduce a helper to update memory
 hotplug end
Thread-Index: AQHYktq36ViOQfJ5uUWUa1pA0oRKx616pmYAgAFNx1CAABATAIAAEM/w
Date: Wed, 13 Jul 2022 09:55:01 +0000
Message-ID:
 <PAXPR08MB7420A8B11EDD04FB9F92F0099E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-2-wei.chen@arm.com>
 <115e36f9-fb73-9692-a6c6-35ad683805bd@suse.com>
 <PAXPR08MB74209F2975388E5A181C12B09E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <c979e069-bd2b-ae8e-8bff-79e5929f7227@suse.com>
In-Reply-To: <c979e069-bd2b-ae8e-8bff-79e5929f7227@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BDD7A9C18445CF4EADD7592948317F72.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dbee3931-4d18-4061-a16e-08da64b5c78c
x-ms-traffictypediagnostic:
	DBBPR08MB4508:EE_|AM5EUR03FT054:EE_|PA4PR08MB6109:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HV9RwRwBvCJhTccmxGS95hRXTzNqHYrFUvWHLwxm7k7hGN9ya1MHGTcKQ5HNYO+xNQdYuZeRe5gd2LVb60Owa69fQSCiC0u4pPd2WJvMHiZHJX0m5Tn9FAUuPQMtl+Wxvjp5xbr7j5GTzEbD6QOBroHOIkspgGMeYp+wPWzrRF12AhsgGMYXQ21B/cNT6f6aZBrMVotGnYLr7HQ6VO519OjiC1rgLAKTUc6NOK/BRiYZM1+GYRTBE+ZbulizX4zOjxl2xtPzcF2kVmZNYydozgiVWCCuXRRBn6RP8YOlQsxpAicXaufK82iZUt0a6EoX24kDL+Wr1nOkIn3gQah/kriI5Wvw8dsLdc+anbvuPBR5GmZop0Ohu7WbSCXkeFGpdHy5mKd9tahMJAGljVPPbhrFs5iUs4G17SD9IbnJxkFDzeRGB1b5M44orL/BtZlzenK7w0jI8mUsU1v3/BJysGpsV91bIgvy2KfSkMSR76j5Q4lx/1K2gGOB49jLrl8MSTcRmIkUbtWWm+e2mSyo2Ohcg7rIhzhDH4IsXq1N1uVRlsRuu++KuuCAY5xB81fZkcgRGbsoBq/jTAc/0AATWA8W+7s4Jw3MlmlIifeqLawtzM9NHXam/LsBQ41p72K88jbn57m9R665Ek3hu0XKlCDJZj8QwduG0zV8JDzxslentlY2v0YLwrBKD1zon7VUmsqWA9CO7G9AkewhC5oIZaDkOK7dW3rTb5xNK1sS6Nb1k/Qd1lhLwou3ZsAfKWGJMn7enjHoq4ZRwPB0XP25NS2dXSM7qGD6kr8E+dl3B64uql0c73eBePyFhIwTvSoy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(7696005)(76116006)(6506007)(53546011)(5660300002)(71200400001)(64756008)(66446008)(66476007)(186003)(66946007)(66556008)(41300700001)(8676002)(33656002)(8936002)(52536014)(86362001)(478600001)(4326008)(9686003)(26005)(2906002)(122000001)(15650500001)(38070700005)(316002)(38100700002)(6916009)(55016003)(54906003)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4508
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d296b3b5-9c59-4513-90b2-08da64b5c102
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gGNC/8E/nfngWXEwB141jLEJ9ucMkcWsp2r053JeZ9V0kh59+uGsfc709KWT71cSzKTU9AV80N+sVDdy0yuIOdQ6pGoRAyut7rt6KcpJIEtmfnCbRRE/gkAnveHEMM1kV6IggGIm1vjmaZDdlTq2LAVX6hXEKrpq4EuVjiwtJsAKkAiqsgxm4efRllpsrosNl0e/SsWKuGdvgVw8JEWDfZ0uRnn5+M+0Nzh8B3vu0HnP93L+6EIG+XpJER6pNQEIqNQu7CgnLWI0C/tZNa2Sr8eqiV3mlaiO8s+ALz9MkkOnuptO0TU4IKXoNJ1ycKnLf9euWJm3R+uOlU9NceC/2Y18BqdFauZ7GQw54lM2MtKcphG8g611MdDIG86AlCY+zyIlGoVM6cSszyCpvSKwp4nAt1lxellBuISnZMfKe1u18xDf/mqU5rSthicUve20dSLt8RXNLk7+4MZ7/s+cyQ3CDQY+ie4Kj3UepMyv6tqi5JcbjWMT8j5xi4Dpkrlflb51bSHKX5rXd5O9xURfAZSorlPvzwUXIFrV+dWFew8PPId44AvGn+KcQU37j26txtjcg4ekqUkaEgtYLaKPWiYXW60duqR53gCACHTAF63pQLR/H5VeOElyXCJMsRhP6HhVjtTyDgXmhvJknvth9up5dNBMgJCET3vmKai4Rbu36JuKMuWd2GYrlCv2JnkEaJxbq6ddiHOjkGN0ZlDiKF1YSrscXUlRYfT663sU8DQNSVYFiwgIyzLQoYWkEiiEFHI8nx+qbxea0FOnmhJmLQRsdd8jsT59fvZoGhxQxlrh5Kn53f19sh+hyHUSt9oy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(36840700001)(46966006)(40470700004)(7696005)(41300700001)(26005)(478600001)(53546011)(9686003)(6506007)(40460700003)(70586007)(82310400005)(70206006)(8676002)(86362001)(316002)(54906003)(83380400001)(4326008)(81166007)(36860700001)(336012)(47076005)(186003)(356005)(82740400003)(40480700001)(5660300002)(6862004)(8936002)(52536014)(33656002)(15650500001)(2906002)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 09:55:12.5328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbee3931-4d18-4061-a16e-08da64b5c78c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6109

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxM+aXpSAxNjo0Ng0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MS85XSB4ZW4veDg2OiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8gdXBkYXRlIG1lbW9yeQ0KPiBob3Rw
bHVnIGVuZA0KPiANCj4gT24gMTMuMDcuMjAyMiAxMDoyMiwgV2VpIENoZW4gd3JvdGU6DQo+ID4+
IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMjAyMuW5
tDfmnIgxMuaXpSAxOTo1NA0KPiA+Pg0KPiA+PiBPbiAwOC4wNy4yMDIyIDE2OjU0LCBXZWkgQ2hl
biB3cm90ZToNCj4gPj4+IHg4NiBwcm92aWRlcyBhIG1lbV9ob3RwbHVnIHZhcmlhYmxlIHRvIG1h
aW50YWluIHRoZSBtZW1vcnkgaG90cGx1Zw0KPiA+Pj4gZW5kIGFkZHJlc3MuIFdlIHdhbnQgdG8g
bW92ZSBzb21lIGNvZGVzIGZyb20geDg2IHRvIGNvbW1vbiwgc28gdGhhdA0KPiA+Pj4gaXQgY2Fu
IGJlIHJldXNlZCBieSBvdGhlciBhcmNoaXRlY3R1cmVzLiBCdXQgbm90IGFsbCBhcmNoaXRlY3R1
cmVzDQo+ID4+PiBoYXZlIHN1cHBvcnRlZCBtZW1vcnkgaG90cGx1Zy4gU28gaW4gdGhpcyBwYXRj
aCwgd2UgaW50cm9kdWNlIHRoaXMNCj4gPj4+IGhlbHBlciB0byByZXBsYWNlIG1lbV9ob3RwbHVn
IGRpcmVjdCBhY2Nlc3MgaW4gdGhlc2UgY29kZXMuIFRoaXMNCj4gPj4+IHdpbGwgZ2l2ZSB0aGUg
YWJpbGl0eSBvZiBzdHViYmluZyB0aGlzIGhlbHBlciB0byB0aG9zZSBhcmNoaXRlY3R1cmVzDQo+
ID4+PiB3aXRob3V0IG1lbW9yeSBob3RwbHVnIHN1cHBvcnQuDQo+ID4+DQo+ID4+IFdoYXQgcmVt
YWlucyB1bmNsZWFyIHRvIG1lIGlzIHdoeSBBcm0gY2FuJ3Qgc2ltcGx5IGdhaW4gdGhlIG5lY2Vz
c2FyeQ0KPiA+PiB2YXJpYWJsZS4gU29vbmVyIG9yIGxhdGVyIHlvdSdsbCB3YW50IHRvIHN1cHBv
cnQgaG90cGx1ZyB0aGVyZSBhbnl3YXksDQo+ID4NCj4gPiBJIGFtIG5vdCBzdXJlIG15IGxpbWl0
ZWQgbWVtb3J5IGhvdHBsdWcga25vd2xlZGdlIGNhbiBhbnN3ZXIgeW91cg0KPiBxdWVzdGlvbg0K
PiA+IG9yIG5vdC4gQXMgbWVtb3J5IGhvdHBsdWcgZGVwZW5kcyBvbiBoYXJkd2FyZSBhbmQgZmly
bXdhcmUgc3VwcG9ydC4gTm93DQo+ID4gZm9yIEFybSwgd2Ugb25seSBoYXZlIEFDUEkgZmlybXdh
cmUgdGhhdCBjYW4gbm90aWZ5IE9TIHRocm91Z2ggR0VEIGV2ZW50DQo+ID4gKG5vdCB2ZXJ5IHN1
cmUpLiBCdXQgQUNQSSBhbmQgZGV2aWNlIHRyZWUgY291bGRuJ3QgYmUgZW5hYmxlZCBhdCB0aGUN
Cj4gc2FtZQ0KPiA+IHRpbWUgZnJvbSBPUyBib290aW5nLiBJbiBkZXZpY2UgdHJlZSBiYXNlZCBO
VU1BLCB3ZSB3aWxsIGVuYWJsZSBkZXZpY2UNCj4gPiB0cmVlLCBBQ1BJIHNlcnZpY2Ugd2lsbCBu
b3QgYmUgaW5pdGlhbGl6ZWQsIHRoYXQgbWVhbnMgd2UgY2FuIG5vdCBnZXQNCj4gPiBub3RpZmlj
YXRpb24gb2YgbWVtb3J5IGhvdHBsdWcgZXZlbnRzIGZyb20gQUNQSSBmaXJtd2FyZS4NCj4gPg0K
PiA+IE9mIGNvdXJzZSwgYWRkaW5nIEdFRCBkZXZpY2Ugbm9kZXMgdG8gdGhlIGRldmljZSB0cmVl
LCBhbmQgZ2V0dGluZyB0aGVzZQ0KPiA+IGV2ZW50cyB0aHJvdWdoIEdFRCBpbnRlcnJ1cHRzIHNo
b3VsZCBub3QgYmUgYSBiaWcgdGVjaG5pY2FsIHByb2JsZW0uIEJ1dA0KPiA+IHRoZXJlIG1heSBi
ZSBvdGhlciByZWFzb25zLCBhbmQgbm8gb25lIGlzIHBsYW5uaW5nIHRvIGFkZCBtZW1vcnkgaG90
cGx1Zw0KPiA+IHN1cHBvcnQgdG8gdGhlIGRldmljZSB0cmVlIChwZXJoYXBzIG5lZWQgYW4gQUNQ
SS1saWtlIHNwZWNpZmljYXRpb24gb3IgYQ0KPiA+IGZpcm13YXJlIGFic3RyYWN0aW9uIGludGVy
ZmFjZSkuIFNvIGlmIHdlIHdhbnQgdG8gaW1wbGVtZW50IFhlbiBBcm0NCj4gbWVtb3J5DQo+ID4g
aG90cGx1ZywgaXQgc2hvdWxkIGFsc28gc3RhcnQgZnJvbSBBQ1BJLiBTbyBjdXJyZW50bHkgZXZl
biBpZiB3ZSBnYWluDQo+IHRoZQ0KPiA+IHZhcmlhYmxlIGluIEFybSwgaXQgd2lsbCBub3QgYmUg
dXNlZC4gRGV2aWNlIHRyZWUgZG9lcyBub3QgaGF2ZSBwcm9wZXJ0eQ0KPiA+IHRvIGluZGljYXRl
IGEgbWVtb3J5IGJsb2NrIGNhbiBiZSBob3RwbHVnIG9yIG5vdC4NCj4gDQo+IEJ1dCBBQ1BJIGlz
IHBvc3NpYmxlIHRvIGJlIGVuYWJsZWQgZm9yIEFybTY0LCBhbmQgaGVuY2UgaG90cGx1ZyBjb3Vs
ZCBiZQ0KPiBtYWRlIHdvcmsgdGhhdCB3YXkuIFRoZXJlZm9yZSBJIHZpZXcgdGhlIHZhcmlhYmxl
IGFzIHBvdGVudGlhbGx5IHVzZWZ1bA0KPiBvbiBBcm0gYXMgd2VsbCwgYW5kIGhlbmNlIGludHJv
ZHVjaW5nIHRoZSB2YXJpYWJsZSBtaWdodCBiZSBsZXNzIHRyb3VibGUNCj4gdGhhbiBpbnRyb2R1
Y2luZyB0aGUgcGVyLWFyY2ggaGVscGVyLg0KPiANCg0KT2ssIEkgd2lsbCB0cnkgdG8gZXhwb3Nl
IG1lbV9ob3RwbHVnIHRvIGNvbW1vbi9tbS5jLiBBcyBib3RoIEFybSBhbmQgeDg2DQpjb2RlIGNh
biBhY2Nlc3MgaXQsIHdlIGNhbiBtb3ZlIHJlbGF0ZWQgTlVNQSBjb2RlIHRvIGNvbW1vbiBXaXRo
b3V0IHRoaXMNCmhlbHBlci4gQW5kIG1lbV9ob3RwbHVnIHdpbGwgYWx3YXlzIGJlIHplcm8gZm9y
IEFybSB1bnRpbCBBcm0gc3VwcG9ydA0KbWVtb3J5IGhvdHBsdWcuIFRoaXMgc2hvdWxkIGJlIGhh
cm1sZXNzIGZvciBBcm0uDQoNCj4gPj4gSSBzdXBwb3NlLiBNZWNoYW5pY2FsbHkgdGhlIGNoYW5n
ZSBpcyBmaW5lLiBBbGJlaXQgbWF5YmUgInRvcCIgaW5zdGVhZA0KPiA+PiBvZiAiYm91bmRhcnki
LCBhbmQgbWF5YmUgYWxzbyBwYXNzICJub2RlIiBldmVuIGlmIHg4NiBkb2Vzbid0IG5lZWQgaXQ/
DQo+ID4+DQo+ID4NCj4gPiBTb3JyeSwgSSBhbSBub3QgdmVyeSBjbGVhciBhYm91dCB0aGVzZSBj
b21tZW50czoNCj4gPiBJdCBtYWtlcyBzZW5zZSB0byB1c2UgbWVtX2hvdHBsdWdfdXBkYXRlX3Rv
cCBpbnN0ZWFkDQo+ID4gb2YgbWVtX2hvdHBsdWdfdXBkYXRlX2JvdW5kYXJ5LiBCdXQgaG93IGNh
biBJIHVuZGVyc3RhbmQgcGFzcyAibm9kZSI/DQo+ID4gZGlkIHlvdSBtZWFuIG1lbV9ob3RwbHVn
X3VwZGF0ZV90b3Aobm9kZSwgZW5kKT8gQnV0IG1lbV9ob3RwbHVnIGlzDQo+ID4gYSBnbG9iYWwg
dG9wIGZvciBtZW1vcnkgaG90cGx1ZyByYW5nZXMuIEkgZG9uJ3QgdGhpbmsgcGFzcyAibm9kZSIN
Cj4gPiB0byB0aGlzIGZ1bmN0aW9uIGNhbiBiZSB1c2VmdWwuDQo+IA0KPiBQbGVhc2Ugc2VwYXJh
dGUgImN1cnJlbnQgaW1wbGVtZW50YXRpb24iIGZyb20gImFic3RyYWN0IG1vZGVsIi4gSW4gdGhl
DQo+IGxhdHRlciBpdCB3b3VsZCBzZWVtIHF1aXRlIHJlYXNvbmFibGUgdG8gbWUgdG8gaGF2ZSBw
ZXItbm9kZSB1cHBlcg0KPiBib3VuZHMgKG9yIGV2ZW4gcGVyLW5vZGUgcmFuZ2VzKS4gVGhlcmVm
b3JlIGFkZGluZyBub2RlIChhbmQsIG9uIHRvcA0KPiBvZiB3aGF0IEkgZGlkIHN1Z2dlc3QgYmVm
b3JlLCByZWdpb24gc3RhcnQpIHRvIHRoZSBwYXJhbWV0ZXJzIG9mIHRoZQ0KPiBuZXcgcGVyLWFy
Y2ggaG9vayB3b3VsZCBzZWVtIGEgZ29vZCBtb3ZlIHRvIG1lLCBldmVuIGlmIGF0IHByZXNlbnQN
Cj4gb25seSAvIGF0IG1vc3QgdGhlICJlbmQiIHBhcmFtZXRlciB3b3VsZCBhY3R1YWxseSBiZSB1
c2VkLg0KPiANCg0KQXMgd2Ugd2lsbCBleHBvcnQgbWVtX2hvdHBsdWcgdG8gY29tbW9uLCBJIHRo
aW5rIHRoZXNlIGNoYW5nZXMgYXJlDQpub3QgbmVlZGVkIGFueSBtb3JlPw0KDQpDaGVlcnMsDQpX
ZWkgQ2hlbg0KDQo+IEphbg0K

