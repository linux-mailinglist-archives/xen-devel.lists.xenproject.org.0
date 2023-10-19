Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D97CF6DF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619237.964003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRFQ-0003nh-2v; Thu, 19 Oct 2023 11:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619237.964003; Thu, 19 Oct 2023 11:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRFP-0003lA-VW; Thu, 19 Oct 2023 11:31:27 +0000
Received: by outflank-mailman (input) for mailman id 619237;
 Thu, 19 Oct 2023 11:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWKy=GB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtRFO-0003kc-JC
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:31:26 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0859a53f-6e73-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:31:24 +0200 (CEST)
Received: from AM0PR05CA0084.eurprd05.prod.outlook.com (2603:10a6:208:136::24)
 by AS8PR08MB7371.eurprd08.prod.outlook.com (2603:10a6:20b:447::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 11:31:15 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:208:136:cafe::b8) by AM0PR05CA0084.outlook.office365.com
 (2603:10a6:208:136::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Thu, 19 Oct 2023 11:31:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21 via Frontend Transport; Thu, 19 Oct 2023 11:31:15 +0000
Received: ("Tessian outbound d9a8e74be042:v215");
 Thu, 19 Oct 2023 11:31:14 +0000
Received: from 8569ccbe177b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56C84F59-24F1-4664-8FA2-2CA0A069C643.1; 
 Thu, 19 Oct 2023 11:31:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8569ccbe177b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 11:31:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6243.eurprd08.prod.outlook.com (2603:10a6:20b:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Thu, 19 Oct
 2023 11:31:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:31:04 +0000
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
X-Inumbo-ID: 0859a53f-6e73-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTftYxIhLMCEGwnXlLd7+R+1t2DIWa7kh1eN2zlrEgA=;
 b=Tz3q9YPWuj+XxY+26IJImNlyiisGWnhnglI6V9TJ//HORdCSbkmOBNSVw+peAXJzFX2cEgMoEc5b5aY1pyvVa8eueioNWid7iscuZv38xq/1oAXVXrxOfxGBox/g83yEEs/U7DotCBeZDjot++uBr5MvVAVwxHTiYzdfZboHVo0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1380d9604436f945
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF927DEVVJva4K9EehD4jlkjgnhvf7UjYMBr8NRKw8f31ERcsog/AZBux9GIoGueuOK/fqWJ/WpiZwvEHRiKc8z3ymAq3/JwyQNeMZV0TJGerDH8zKA1h6zvCaXA8yQwfv3yX8vifKXIA0gi/Wman28Ggte1H0gTBGfSKiaHd/sSWK6qjplrR5q3NYxDjric+fpiqW6/x3T+xbJquqy/ahpGZmWEobf1iwfGHfCdNd2zGVGNZS+YdiKGGlrU0FvqfY6MYfqe1HaEbxbE2q+Ky+LOStjfuSVw9+vTmz+a5KFWKdeCjm/8rtgN3GXS69c1E3MOLhOuFKio0XY60+b5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTftYxIhLMCEGwnXlLd7+R+1t2DIWa7kh1eN2zlrEgA=;
 b=nbJ3b47CZMzouAOy9S2C0FX1+GikQ4UTFDpeZbng2oTqlAhIRzQl+JNNtI/MI2svVYBlBDdJp/AVtk8jvw3C0jV2l3Ejd2NrL5gjTA+ZHCrU9jjDGl9jNmM3nVVDI1rEZBvhSh/XNNctKS7xWUaO16yYIEcRJoJcD5Ptb8qHe9Zu/ox3chjEgYPxOeK2c47qRKdHY4Xmsm6di3jXSZqi/yOyaC7GvY2lntGahxHjy26r5Ow5WbVGsxqGbw2qeUEe2BzGfoAXPUrDv5RQoFdkBY933UqSdMDqTvUK8hToza+o5R017JcqaZjQdLS+txzoKnlkuEB9R4RHg+FMmoV7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTftYxIhLMCEGwnXlLd7+R+1t2DIWa7kh1eN2zlrEgA=;
 b=Tz3q9YPWuj+XxY+26IJImNlyiisGWnhnglI6V9TJ//HORdCSbkmOBNSVw+peAXJzFX2cEgMoEc5b5aY1pyvVa8eueioNWid7iscuZv38xq/1oAXVXrxOfxGBox/g83yEEs/U7DotCBeZDjot++uBr5MvVAVwxHTiYzdfZboHVo0=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
Thread-Topic: [PATCH] xen/sched: fix sched_move_domain()
Thread-Index: AQHaAn6ufpdY+57bqkWZN4b9/h1wsrBQ+nMA
Date: Thu, 19 Oct 2023 11:31:04 +0000
Message-ID: <F1CDF477-9003-45F9-83E8-2122413AB514@arm.com>
References: <20231019112314.22665-1-jgross@suse.com>
In-Reply-To: <20231019112314.22665-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6243:EE_|AM4PEPF00027A68:EE_|AS8PR08MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: e24ebf1d-336b-4a08-0317-08dbd096e78d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gV+Q8nqXKDBGkVOgsEonleQ5qP/qB8eQw/odAnx428DbaYXng7ZSu95f2ffQH9nhNnBEZcyBNSmLEUXjCL7ojRphdSXgNw11q77cWqOjRALjGEKbVCHLWcQ3uwXMfNTxi7iuKvpQE1mTV0uDlFBDLg2VEFQUudWXx87MeeYpWRQzVbfLeKKGTwZXs9ZsrR8xZxTH4sjCb+CdcKMsAtorryefIvLL5vAnT48toOpAjuCHiujZRAC6yMQBmx4sgHGVHtG+fsA+hB88ZqIb2nfjMs7vVzSbkos6M4lNEgWZksagKRAMtnnz46gQ4ho6rHVuXijBNLYagYk0nGJtu0vZwnTyFoNHdp7R+1J0YnyuZfLOe768FIP30iShwaJFAvtmEO4v3x3QF6UHnwetPu6RkT9zVMwBJziFRcfXjNr17mR5KjVbiyHf/SQk3gc/jG3CsMTs1BqJEIyRaLlTfB1avdpGVssf2NLCZMizK0acqHwCcytv92RpXHA9RYUJ/IgmmqwvWZZphpclMXkh48mZt51oJvtJCvgXpCqxFdVxzj+ZF22NsyZUug7g7REGsnZ28/NHq5tJJfB7csO9PImp81Wu1HznWMcm7ILd5IBuQwcD+1Nx7Plr1+89GoWJ1NNHomT8uM1662JKIaKkkWcOcQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(6916009)(33656002)(26005)(5660300002)(4326008)(8936002)(8676002)(36756003)(41300700001)(54906003)(316002)(64756008)(66446008)(66476007)(66556008)(91956017)(86362001)(66946007)(478600001)(6486002)(71200400001)(76116006)(53546011)(6512007)(6506007)(2616005)(38100700002)(38070700005)(83380400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4120D735A34BEE4CA66346898FDDAD61@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6243
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b18af5bc-602c-4343-4b8d-08dbd096e152
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I9DdqhBXejJ3ETUW2irEcnzbJ+AffaV/hfBofz8nSh5MNW/Vag7lSkSWUsIyy71wt0SmyyNMq0GFO9oI71K8IOyAXuJels6wPnXZ1ac5x4R6gV7gbNBrbblUUv2Y6E4WdChXft8opxYT2tKT/FOoZJIR4gKhxVvltmuYbmYBqgx+eSoI5DV1PFXHTtnsMYz+hjXImAJlUNSd+VI05CnQXCjhQEjnA8UEpl5WC02ZgKgk9K8f99j9FOpCqtScCsQJtxPElBxur3tjiB0MFRaFucU/2rZsLkZEszZ5DZDff0ZqQBBNI6tkf6W57k3LsUe+iubNM08IAUf+kfm/G7Tem50+Deio+4iOTBlGaRVAGcvhVvvx84V4nFnwq86oAASh13KNuBiQf83iGHZeKoELWUWvsNulSwbltXqd4SPhe1ac2MkX8bCp9o8PBgWl21Xg58WY4evwLNWieDAsmA3T0mvrmMSJT4CzC8Zd6DgNExwm2nTQWlVNoK/9Ea+Hyy5nbW/yC4MLFvs6a5YajHG2Rd9zlAR5n/BvP3QxyZx0wzLkKDZzX4qektoTQMvNO9I2oqKpZxsPH4M9sZ7xuU9BO1HFI2THKFXLzx4m1SsNIHytwBXCwJGNqsmo/Af7iDuFqTarOFWZxE2QLArZKVfyfNTfLwutnDN5YNIrL9FVZlrBJY6Nv9Cd0HgrQU3ACEP/9+BDVxOqgz2g1MDauGrRKrJb/OHwTdFvl+yXftmuqoA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(86362001)(40460700003)(40480700001)(54906003)(70586007)(70206006)(316002)(478600001)(8676002)(6486002)(8936002)(33656002)(41300700001)(4326008)(36756003)(2906002)(5660300002)(6862004)(47076005)(107886003)(36860700001)(53546011)(2616005)(6512007)(82740400003)(83380400001)(336012)(6506007)(81166007)(356005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:31:15.1038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e24ebf1d-336b-4a08-0317-08dbd096e78d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7371

SGkgSnVlcmdlbiwNCg0KPiBPbiBPY3QgMTksIDIwMjMsIGF0IDE5OjIzLCBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gV2hlbiBtb3ZpbmcgYSBkb21haW4gb3V0
IG9mIGEgY3B1cG9vbCBydW5uaW5nIHdpdGggdGhlIGNyZWRpdDINCj4gc2NoZWR1bGVyIGFuZCBo
YXZpbmcgbXVsdGlwbGUgcnVuLXF1ZXVlcywgdGhlIGZvbGxvd2luZyBBU1NFUlQoKSBjYW4NCj4g
YmUgb2JzZXJ2ZWQ6DQo+IA0KPiAoWEVOKSBYZW4gY2FsbCB0cmFjZToNCj4gKFhFTikgICAgWzxm
ZmZmODJkMDQwMjNhNzAwPl0gUiBjcmVkaXQyLmMjY3NjaGVkMl91bml0X3JlbW92ZSsweGUzLzB4
ZTcNCj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjQ2YWRiPl0gUyBzY2hlZF9tb3ZlX2RvbWFpbisw
eDJmMy8weDViMQ0KPiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMzRjZjc+XSBTIGNwdXBvb2wuYyNj
cHVwb29sX21vdmVfZG9tYWluX2xvY2tlZCsweDFkLzB4M2INCj4gKFhFTikgICAgWzxmZmZmODJk
MDQwMjM2MDI1Pl0gUyBjcHVwb29sX21vdmVfZG9tYWluKzB4MjQvMHgzNQ0KPiAoWEVOKSAgICBb
PGZmZmY4MmQwNDAyMDY1MTM+XSBTIGRvbWFpbl9raWxsKzB4YTUvMHgxMTYNCj4gKFhFTikgICAg
WzxmZmZmODJkMDQwMjMyYjEyPl0gUyBkb19kb21jdGwrMHhlNWYvMHgxOTUxDQo+IChYRU4pICAg
IFs8ZmZmZjgyZDA0MDIyNzZiYT5dIFMgdGltZXIuYyN0aW1lcl9sb2NrKzB4NjkvMHgxNDMNCj4g
KFhFTikgICAgWzxmZmZmODJkMDQwMmRjNzFiPl0gUyBwdl9oeXBlcmNhbGwrMHg0NGUvMHg0YTkN
Cj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjAxMmI3Pl0gUyBsc3Rhcl9lbnRlcisweDEzNy8weDE0
MA0KPiAoWEVOKQ0KPiAoWEVOKQ0KPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqDQo+IChYRU4pIFBhbmljIG9uIENQVSAxOg0KPiAoWEVOKSBBc3NlcnRpb24g
J3N2Yy0+cnFkID09IGMycnFkKHNjaGVkX3VuaXRfbWFzdGVyKHVuaXQpKScgZmFpbGVkIGF0IGNv
bW1vbi9zY2hlZC9jcmVkaXQyLmM6MTE1OQ0KPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqDQo+IA0KPiBUaGlzIGlzIGhhcHBlbmluZyBhcyBzY2hlZF9tb3Zl
X2RvbWFpbigpIGlzIHNldHRpbmcgYSBkaWZmZXJlbnQgY3B1DQo+IGZvciBhIHNjaGVkdWxpbmcg
dW5pdCB3aXRob3V0IHRlbGxpbmcgdGhlIHNjaGVkdWxlci4gV2hlbiB0aGlzIHVuaXQgaXMNCj4g
cmVtb3ZlZCBmcm9tIHRoZSBzY2hlZHVsZXIsIHRoZSBBU1NFUlQoKSB3aWxsIHRyaWdnZXIuDQo+
IA0KPiBJbiBub24tZGVidWcgYnVpbGRzIHRoZSByZXN1bHQgaXMgdXN1YWxseSBhIGNsb2JiZXJl
ZCBwb2ludGVyLCBsZWFkaW5nDQo+IHRvIGFub3RoZXIgY3Jhc2ggYSBzaG9ydCB0aW1lIGxhdGVy
Lg0KPiANCj4gRml4IHRoYXQgYnkgc3dhcHBpbmcgdGhlIHR3byBpbnZvbHZlZCBhY3Rpb25zIChz
ZXR0aW5nIGFub3RoZXIgY3B1IGFuZA0KPiByZW1vdmluZyB0aGUgdW5pdCBmcm9tIHRoZSBzY2hl
ZHVsZXIpLg0KPiANCj4gQ2M6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KRW1t
bSwgSSB0aGluayBeIHRoaXMgQ0MgaXMgYmV0dGVyIHRvIG1lIG1vdmVkIHRvIHRoZSBzY2lzc29y
cyBsaW5lLCBvdGhlcndpc2UNCmlmIHRoaXMgcGF0Y2ggaXMgY29tbWl0dGVkLCB0aGlzIGxpbmUg
d2lsbCBiZSBzaG93biBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuLi4NCg0KPiBGaXhlczogNzBmYWRj
NDE2MzViICgieGVuL2NwdXBvb2w6IHN1cHBvcnQgbW92aW5nIGRvbWFpbiBiZXR3ZWVuIGNwdXBv
b2xzIHdpdGggZGlmZmVyZW50IGdyYW51bGFyaXR5IikNCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiAtLS0NCj4gVGhpcyBmaXhlcyBhIHJlZ3Jlc3Np
b24gaW50cm9kdWNlZCBpbiBYZW4gNC4xNS4gVGhlIGZpeCBpcyB2ZXJ5IHNpbXBsZQ0KPiBhbmQg
aXQgd2lsbCBhZmZlY3Qgb25seSBjb25maWd1cmF0aW9ucyB3aXRoIG11bHRpcGxlIGNwdXBvb2xz
LiBJIHRoaW5rDQo+IHdoZXRoZXIgdG8gaW5jbHVkZSBpdCBpbiA0LjE4IHNob3VsZCBiZSBkZWNp
ZGVkIGJ5IHRoZSByZWxlYXNlIG1hbmFnZXINCj4gYmFzZWQgb24gdGhlIGN1cnJlbnQgc3RhdGUg
b2YgdGhlIHJlbGVhc2UgKEkgdGhpbmsgSSB3b3VsZG4ndCBoYXZlDQo+IGFkZGVkIGl0IHRoYXQg
bGF0ZSBpbiB0aGUgcmVsZWFzZSB3aGlsZSBiZWluZyB0aGUgcmVsZWFzZSBtYW5hZ2VyKS4NCg0K
VGhhbmtzIGZvciB0aGUgcmVtaW5kZXIgOikNCg0KUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3
cm9uZywgaWYgdGhpcyBpcyBmaXhpbmcgdGhlIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBpbg0KNC4x
NSwgc2hvdWxkbuKAmXQgdGhpcyBwYXRjaCBiZWluZyBiYWNrcG9ydGVkIHRvIDQuMTUsIDQuMTYs
IDQuMTcgYW5kIHNvb24NCjQuMTg/IFNvIGhvbmVzdGx5IEkgdGhpbmsgYXQgbGVhc3QgZm9yIDQu
MTggZWl0aGVyIGFkZCB0aGlzIHBhdGNoIG5vdyBvcg0KbGF0ZXIgd29u4oCZdCBtYWtlIG11Y2gg
ZGlmZmVyZW5jZeKApkkgYW0gb2sgZWl0aGVyIHdheSBJIGd1ZXNzLg0KDQpLaW5kIHJlZ2FyZHMs
DQpIZW5yeQ0KDQoNCg==

