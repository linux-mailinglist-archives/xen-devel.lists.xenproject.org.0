Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868F523107
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 12:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326689.549279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nojyp-0007Rx-7J; Wed, 11 May 2022 10:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326689.549279; Wed, 11 May 2022 10:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nojyp-0007QD-3A; Wed, 11 May 2022 10:54:07 +0000
Received: by outflank-mailman (input) for mailman id 326689;
 Wed, 11 May 2022 10:54:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KGj=VT=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nojym-0007Q7-Ml
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 10:54:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe06::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c1db93-d118-11ec-a406-831a346695d4;
 Wed, 11 May 2022 12:53:31 +0200 (CEST)
Received: from DB6PR0301CA0024.eurprd03.prod.outlook.com (2603:10a6:4:3e::34)
 by AM8PR08MB6324.eurprd08.prod.outlook.com (2603:10a6:20b:315::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 10:53:22 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::4a) by DB6PR0301CA0024.outlook.office365.com
 (2603:10a6:4:3e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 10:53:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 10:53:21 +0000
Received: ("Tessian outbound c1f35bac1852:v119");
 Wed, 11 May 2022 10:53:21 +0000
Received: from 0609bfa1d5de.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 812F4AB4-751F-4C52-B32F-A8F655E6018F.1; 
 Wed, 11 May 2022 10:53:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0609bfa1d5de.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 10:53:15 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 AM6PR08MB3958.eurprd08.prod.outlook.com (2603:10a6:20b:a6::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Wed, 11 May 2022 10:53:12 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 10:53:12 +0000
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
X-Inumbo-ID: 97c1db93-d118-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QMj9U8PIS4gyMQylabZ5WH7kxfFTAPfytz49AkVP6wHggoxT9DSUG+8q1+rxzpYRMae/Izovo77QbFEqi2j3LTSY45HNtrCUtG9AXtKcNyqJzcMhG8HVOo/C8JJp0gbKogVVItujiEMbnJ677kA9ulIeeUkdwGA0XaXv5CtDZJvLJjj28RB6jrNtt7sv0UCw3gvQ6m4IoDZyK+rO/oQA9LtNpxpU2N0uSFj88YX4DLb/WiwW/lKp53q7/5dCPokBiz5mKdGVZ6PDn92f/AsEcKrs1TYpy6VF1JBp6Zs7TncyKV5OfXd5cqY23lAII2j2l4kRtC4swUuR4lHkhT+NsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1O+F2a6vmcjR7JhjnusIHWlZB1fB9W548d5dY5ooNY=;
 b=kGBzLjXzvV9vvts9OSbQpPI13tcJlqWoTezweSaDHKengi4pXWN9UTIgJfwEvHr+grFGZh9ld9x7AfvI8jLab73gXxIbbApq8zmblEtH9zn1YZOX5G29aylRoNVEe4HdoYjK03HPVQ2zOmsGtqfHlW2lKkwlMmC8Hu33egeAVBZb8F4KrG6ewFjfolVlcp7dYewPGJGCgSKMllEBQ35RHVwYqjL16laegmqOAO/v9HDKwXei9sPEaN1fCcgoQrE1gfXwROwWldeuhozLrhNygjVx1N0sQ7fD3q8m8K+XCf9XLmNPSXYjegQ00sQMDTQ/DdfV/U5BktPyoHdoAsmfxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1O+F2a6vmcjR7JhjnusIHWlZB1fB9W548d5dY5ooNY=;
 b=evtfm4kxnGok0EUKULRI9CDI9JsPb/Ef73AUNQswKG/yC8v8DVccFBLSnmGqXNcUCb1swjrfCTbOB/WLCMqli+IX9B+MQ3uK1k34lQge7QMeMSiCLy9/IKKR0wtnEql1GXjI5Qv36o4xZ+YGq3ZZkdpbts0Lvfgu5GVgtFxuETA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98233ee234f0b412
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YltLhnlMWw88s/Twarrwjq/CdAKF2kaom2ULM+pgGgdNOWQ9K0Iib4bsu0WxFDagS7F99MPdGt5Igf4JpvRTlFYRDUBGcUDo+Vtah0GBZx5TkVVonetRAxPpi8YQvp2dL0b/fNdxEEPSwe99UMDNQjSiMNyWpanaufKwT9vCx83LmXOm+iuG1gKxV0nPyj43Cirg8RQPZooJosn7ZUcd1rSUstc5q9eM+QADCTTFdGp7OAA4Gy0tBqM1K1zfWDslZ2SfnCQtLNise7znYvK1gWPggvlHXBDJWrFDvzqlgUpsjVJif+KJwwOyEjK2McvQgAYnNWs6HYSzZZ2aqE4ZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1O+F2a6vmcjR7JhjnusIHWlZB1fB9W548d5dY5ooNY=;
 b=gM6R5pM2uF+nMss2scDOt/sYLeBRgx6BsiM61XXw8U7DIcz3lXMsM7SYENRv03b+Y0VmAgKz9F+WN9cqv1xKWjqKx+/uLNUY2CywTOOWKA0FJRuMWxh7BDcYfFVjHYj3L6VR0op1QDzSqOYUaxqIJ2/B52LOu29toAj6pLarLlyYz6cxFSf6DVU9QFnCCZ14aqJLk3fVyk9aFxj20UlIPuV3wc30gZZe5rNEEFW/INPrduMXq+qmzD0B8O78D37hxjB8JRYmH5XJkM4E9Cq21+/TK22y3zyrTztDONHygvnZOX3+xJBz1FBzZAR4czVtjhPAfEshsSpzy6TuxoW+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1O+F2a6vmcjR7JhjnusIHWlZB1fB9W548d5dY5ooNY=;
 b=evtfm4kxnGok0EUKULRI9CDI9JsPb/Ef73AUNQswKG/yC8v8DVccFBLSnmGqXNcUCb1swjrfCTbOB/WLCMqli+IX9B+MQ3uK1k34lQge7QMeMSiCLy9/IKKR0wtnEql1GXjI5Qv36o4xZ+YGq3ZZkdpbts0Lvfgu5GVgtFxuETA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Luca Miccio <lucmiccio@gmail.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Topic: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Index:
 AQHYYBWH2ZK8TL5ueU+mSOXui+uVga0YVmwAgAABRACAAP62gIAADosAgAACPoCAAAaAgIAAAkiAgAAaewA=
Date: Wed, 11 May 2022 10:53:12 +0000
Message-ID: <10151DF3-A3C9-49FB-8F2B-B36407E5CE82@arm.com>
References:
 <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
 <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
 <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
 <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com>
 <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
 <9707ACA4-711A-4691-BA2A-FCDDAFFD9DE8@arm.com>
In-Reply-To: <9707ACA4-711A-4691-BA2A-FCDDAFFD9DE8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 69be0ef8-094d-4e0d-bf6f-08da333c7746
x-ms-traffictypediagnostic:
	AM6PR08MB3958:EE_|DBAEUR03FT040:EE_|AM8PR08MB6324:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6324795A467E93700F6A95F8FCC89@AM8PR08MB6324.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KV3CxdRnjGSqpGB9VGYNGg+pPoV0/adodFUwPOhZnL2lEah5cc6pAKMENvWztZvTZFIa5LvM3dUlXOIuu0wOuwC2uSF5w4j2hyrjh2aom4dWD5XuA61wqhg/cTOmARu95bj0dALDlEaDL+NPm3fNAe8WumIdUqYqGu8NR+MQSObYEtPEyZIv0FzK9qwS4bO5JyiXBgqTwzpNY0kvjlz5HkXp36oarUEwecJ7GcDb7/rIEddlzYm3y041qHmoTssr50YZFlz9kg/FWhRyykvr8qfdZoappZrTz2txAy15+gtLwrdopVneegWRecc6VzsgBdcHPulDMdblpMrN1dtDM6/64VcRceQaE/Fjs8finYQ7IZ8qXE+b9cbp11bsr24zxalxN9wlAunY/BVokXvKaEdwnlzIdATs49OHu6u97Uj5wnJAUbM1NiLpZ0wOYExaDH27uRMTX0jbyZC59oeYs6z3FQ/nCKMyIK9gCe1xxbv8lq8Y9hS3TFMGtlOxc7R8nCLJMSLAytiN/13YcODk/dTgbup/2i7tDVkLGUgJYmiLCMX2ZlFf519ScRwznwwGsVZM7VRUVviFF874Ukk5HH19flZHEjRbp7ZS9QmvgtCWeSu2GC5LN3iKv+LlFowvlwzs5oNzkB/Bfg2bLA7FWOO7hrk1gZ2Q2OnjKIpv4+HyAZSjre1yASLj+nNDoE7uwp05TMgBMp/9gPPgkwBYjAIpCBcAhamsWUkgV4uzEG8CrLsQ9CzhEehcPGZGl6vSLSuUbskrBEDD7/NM7NCFHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(316002)(76116006)(508600001)(6512007)(66946007)(26005)(66556008)(64756008)(66446008)(6486002)(2906002)(186003)(54906003)(8676002)(37006003)(6862004)(4326008)(6636002)(71200400001)(86362001)(38100700002)(33656002)(122000001)(2616005)(6506007)(83380400001)(38070700005)(8936002)(53546011)(91956017)(36756003)(5660300002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A84AD5F77B9724DAF0DC051C0ED2C89@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3958
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31a67417-36c0-4bef-f1ca-08da333c71e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bDL0xd0JdMDticxa4asWH/2cDGHpOFs3TU6YRMBhm0igW1rlpVQp9YKdkQTKKqHeYb9dwVC0Oi9fbdihiDyrMx+QL3s2Nfrjdms8U2CjHQ8Ij15JnpwSASk9y6V+dGvuTHQ78KJqMZPUXPKVmn3T3TjTJZH/V4qxMq2yFWy8ajZWkMNmaFLdMZlX6zhGNUn7tymq+IvnD8rHJrblK7Wynztko63XaKGBeiYtTTEvt3IA3rF+9OEsewZTIzGl0ZbcmEleUDszntpERnyHJGHVIs9C62zonWkf+FNHffYECGtNhy6BcyM9f+hcrOMYwh6tGzJto3lw2d42rVOOLVT+8mUhVoxBo0S/PY4tcZXIug/iVxfxs31ZvRPwxyFo7kLS70cKQn+pfXGzUQITjai0Y0Z3lFdhUPEDLKjNgRIC2/cpaSAfah0Se/fUmgV90LQfWtk/2ejLDRhB3VeXfb7FY8j9adfpT1IfRIbySm6XrPfxoDqHP0BHs37lS3bX4MxTTciS7mtlZU/PzOUET7K2ehGVMB+sqlGNJEa23tBeXL3Q9R4EuOJrdKwNXtu2FpbWYJ1NbBVrlA3SkdI5ilc6exy/75XlP7GxiunM2hesciFM2YzWE9zlH9nx30BytDLIQeBZhS7suvcrFcVfW6TnNGTs+Arc+L+blIxjkfv0jqVVDfI4AYH+Wi1OkZz8Yuv2k48vcEEAp0idoor6sr9PHA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(5660300002)(186003)(336012)(83380400001)(2906002)(70586007)(81166007)(36756003)(33656002)(8936002)(40460700003)(82310400005)(6486002)(8676002)(6506007)(53546011)(6636002)(26005)(4326008)(2616005)(6512007)(86362001)(356005)(508600001)(37006003)(316002)(36860700001)(54906003)(107886003)(6862004)(70206006)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 10:53:21.8369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69be0ef8-094d-4e0d-bf6f-08da333c7746
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6324

SGkgSnVsaWVuDQoNCj4gT24gMTEgTWF5IDIwMjIsIGF0IDEwOjE4IGFtLCBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgSnVsaWVuLA0K
PiANCj4+IE9uIDExIE1heSAyMDIyLCBhdCAxMDoxMCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6DQo+PiANCj4+IEhpIEJlcnRyYW5kLA0KPj4gDQo+PiBPbiAxMS8wNS8yMDIy
IDA5OjQ2LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBPbiAxMSBNYXkgMjAyMiwgYXQg
MDk6MzgsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+PiANCj4+Pj4g
SGkgQmVydHJhbmQsDQo+Pj4+IA0KPj4+PiBPbiAxMS8wNS8yMDIyIDA4OjQ2LCBCZXJ0cmFuZCBN
YXJxdWlzIHdyb3RlOg0KPj4+Pj4+IE9uIDEwIE1heSAyMDIyLCBhdCAxNzozNSwgSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gSGkgUmFodWwsDQo+
Pj4+Pj4gDQo+Pj4+Pj4gT24gMTAvMDUvMjAyMiAxNzozMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+
Pj4+Pj4+PiArIHJjID0gZXZ0Y2huX2FsbG9jX3VuYm91bmQoJmFsbG9jKTsNCj4+Pj4+Pj4+ICsg
aWYgKCByYyApDQo+Pj4+Pj4+PiArIHsNCj4+Pj4+Pj4+ICsgcHJpbnRrKCJGYWlsZWQgYWxsb2Nh
dGluZyBldmVudCBjaGFubmVsIGZvciBkb21haW5cbiIpOw0KPj4+Pj4+Pj4gKyByZXR1cm4gcmM7
DQo+Pj4+Pj4+PiArIH0NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgZC0+YXJjaC5odm0ucGFyYW1z
W0hWTV9QQVJBTV9TVE9SRV9FVlRDSE5dID0gYWxsb2MucG9ydDsNCj4+Pj4+Pj4+ICsNCj4+Pj4+
Pj4+ICsgcmV0dXJuIDA7DQo+Pj4+Pj4+PiArfQ0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gc3RhdGlj
IGludCBfX2luaXQgY29uc3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+Pj4+IGNv
bnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9kZSkNCj4+Pj4+Pj4+IHsNCj4+Pj4+Pj4+IEBA
IC0zMjE0LDYgKzMyNDMsMTQgQEAgc3RhdGljIGludCBfX2luaXQgY29uc3RydWN0X2RvbVUoc3Ry
dWN0IGRvbWFpbiAqZCwNCj4+Pj4+Pj4+IGlmICggcmMgPCAwICkNCj4+Pj4+Pj4+IHJldHVybiBy
YzsNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gKyBpZiAoIGtpbmZvLmRvbTBsZXNzX2VuaGFuY2VkICkN
Cj4+Pj4+Pj4gSSB0aGluayB3ZSBuZWVkIHRvIGRvIHNvbWV0aGluZyBsaWtlIHRoaXMgdG8gZml4
IHRoZSBlcnJvci4NCj4+Pj4+Pj4gaWYgKCBoYXJkd2FyZV9kb21haW4gJiYga2luZm8uZG9tMGxl
c3NfZW5oYW5jZWQgKQ0KPj4+Pj4+PiB7DQo+Pj4+Pj4+IH0NCj4+Pj4+PiANCj4+Pj4+PiBJcyB0
aGVyZSBhbnkgdXNlIGNhc2UgdG8gdXNlICJkb20wbGVzc19lbmhhbmNlZCIgd2l0aG91dCBkb20w
IChvciBhIGRvbWFpbiBzZXJ2aWNpbmcgWGVuc3RvcmVkKT8NCj4+Pj4+PiANCj4+Pj4+IEp1c3Qg
YmVpbmcgY3VyaW91cyBoZXJlIGJ1dCB3b3VsZCBpdCBldmVuIGJlIHBvc3NpYmxlIHRvIGhhdmUg
bm9uIGRvbTAgZG9tYWluIHNlcnZpY2luZyB4ZW5zdG9yZWQgPw0KPj4+PiANCj4+Pj4gWW91IGNh
biBidWlsZCBYZW5zdG9yZWQgYWdhaW5zdCBtaW5pLW9zIGFuZCBjb25maWd1cmUgdGhlIGluaXQg
c2NyaXB0IHRvIGxhdW5jaCB4ZW5zdG9yZWQgYXMgYSBkb21haW4uDQo+Pj4gU28gZG9tMCBpcyBu
b3QgbWFuZGF0b3J5IG9yIHNob3VsZCBtaW5pLW9zIGJlIHN0YXJ0ZWQgYXMgRG9tMCBmb3IgdGhp
cyB0byB3b3JrID8NCj4+IA0KPj4gSW4gb3JkZXIgdG8gYWxsb2NhdGUgdGhlIGV2ZW50IGNoYW5u
ZWwsIHlvdSBuZWVkIHRvIGtub3cgdGhlIElEIG9mIHRoZSBkb21haW4gd2hlcmUgWGVuc3RvcmVk
IHdpbGwgcnVuLiBTdGVmYW5vJ3MgcGF0Y2ggaXMgcmVseWluZyBvbiBYZW5zdG9yZWQgdG8gYmUg
cnVuIGluIERvbWFpbiAwLg0KPj4gDQo+PiBUaGlzIHdvdWxkIG5lZWQgdG8gYmUgdXBkYXRlZCBp
ZiB3ZSB3YW50IHRvIHJ1biBpdCBpbiBhIHNlcGFyYXRlIGRvbWFpbi4NCj4gDQo+IE9rIHRoZW4g
RG9tMCBpcyBtYW5kYXRvcnkgYXQgdGhlIG1vbWVudCwgSSBhbSBvayB3aXRoIHRoYXQuDQo+IA0K
Pj4gDQo+Pj4+IA0KPj4+Pj4+IElmIG5vdCwgdGhlbiBJIHdvdWxkIGNvbnNpZGVyIHRvIGZvcmJp
ZCB0aGlzIGNhc2UgYW5kIHJldHVybiBhbiBlcnJvci4NCj4+Pj4+IE9uZSB3YXkgb3IgYW4gb3Ro
ZXIgd2UgbmVlZCB0byBzb2x2ZSB0aGUgY3Jhc2ggYnV0IGlmIGl0IGlzIGZvcmJpZGRlbiB3ZSBt
dXN0IHByZXZlbnQgY29taW5nIHRvIHRoaXMgc3RlcCBlYXJsaWVyIGFzIGl0IG1lYW5zIHRoZSBj
b25maWd1cmF0aW9uIGlzIHdyb25nLg0KPj4+PiANCj4+Pj4gSSB0aGluayB0aGlzIHNob3VsZCBi
ZSBjaGVja2VkIHdoZW4gcGFyc2luZyB0aGUgY29uZmlndXJhdGlvbi4NCj4+PiBJZiBkb20wIGlz
IG1hbmRhdG9yeSB5ZXMsIHdlIHNob3VsZCBzdGlsbCBtYWtlIHN1cmUgdGhhdCB0aGlzIGNvZGUg
Y2Fubm90IGJlIHJlYWNoZWQgc28gYW4gQVNTRVJUIHdvdWxkIGJlIG5pY2UgaGVyZSBhdCBsZWFz
dCBpbiBjYXNlIHNvbWVvbmUgdHJpZXMgdG8gYWN0aXZhdGUgdGhpcyBjb2RlIHdpdGhvdXQgZG9t
MCAod2hpY2ggbWlnaHQgaGFwcGVuIHdoZW4gd2Ugd2lsbCBwdXNoIHRoZSBzZXJpZSBmb3Igc3Rh
dGljIGV2ZW50IGNoYW5uZWxzKS4NCj4+IA0KPj4gSSBhbSBmaW5lIHdpdGggYW4gQVNTRVJUKCku
DQo+PiANCj4+IEFyZSB5b3Ugc2F5aW5nIHRoYXQgZG9tMGxlc3NfZW5oYW5jZWQgd2lsbCBiZSBz
ZXQgdG8gdHJ1ZSBmb3IgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsIHNlcmllcz8NCj4+IA0KPj4g
SWYgeWVzLCB0aGVuIEkgdGhpbmsgZG9tMGxlc3NfZW5oYW5jZWQgd2lsbCBuZWVkIHRvIGJlIGFu
IGVudW0gc28gd2Uga25vdyB3aGF0IHBhcnQgb2YgWGVuIGlzIGV4cG9zZWQuDQo+IA0KPiBObyBp
dCB3b27igJl0LCB3ZSBqdXN0IG5lZWQgc29tZSBvZiB0aGUgY2hhbmdlcyBkb25lIGJ1dCB3aXRo
b3V0IHNldHRpbmcgZG9tMGxlc3NfZW5oYW5jZWQuDQo+IEBSYWh1bDogY2FuIHlvdSBjb25maXJt
Lg0KPiANCg0KV2UgbmVlZCB0byBzZXQgdGhlICJ4ZW4sZW5oYW5jZWTigJ0gZW5hYmxlZCBmb3Ig
ZG9tMGxlc3MgZG9tVSB0byBlbmFibGUNCnRoZSBldmVudC1jaGFubmVsIGludGVyZmFjZSBpbiBk
b20wbGVzcyBndWVzdC4gSWYgd2UgZGlkIG5vdCBzZXQgdGhpcyBwcm9wZXJ0eSB3ZSBjYW7igJl0
DQp1c2UgdGhlIGV2ZW50LWNoYW5uZWwgaW50ZXJmYWNlIGluIGRvbTBsZXNzIGRvbVVzIGd1ZXN0
cy4NCg0KUmVnYXJkcywNClJhaHVsDQo+IENoZWVycw0KPiBCZXJ0cmFuZA0KPiANCj4+IA0KPj4g
Q2hlZXJzLA0KPj4gDQo+PiAtLQ0KPj4gSnVsaWVuIEdyYWxsDQoNCg==

