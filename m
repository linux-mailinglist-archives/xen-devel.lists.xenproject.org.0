Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14BF596B50
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 10:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388728.625468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOEOr-0007u8-OU; Wed, 17 Aug 2022 08:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388728.625468; Wed, 17 Aug 2022 08:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOEOr-0007r1-L6; Wed, 17 Aug 2022 08:27:41 +0000
Received: by outflank-mailman (input) for mailman id 388728;
 Wed, 17 Aug 2022 08:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CYW=YV=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1oOEOp-0007qc-N1
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 08:27:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 718b2011-1e06-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 10:27:34 +0200 (CEST)
Received: from AM6P195CA0042.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::19)
 by HE1PR0801MB1851.eurprd08.prod.outlook.com (2603:10a6:3:7b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Wed, 17 Aug
 2022 08:27:29 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::3f) by AM6P195CA0042.outlook.office365.com
 (2603:10a6:209:87::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Wed, 17 Aug 2022 08:27:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 08:27:28 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 17 Aug 2022 08:27:28 +0000
Received: from 9961e9b6a7c7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E74FFF0-8705-471C-867C-795C431B41A9.1; 
 Wed, 17 Aug 2022 08:27:20 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9961e9b6a7c7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Aug 2022 08:27:20 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by DB6PR0801MB2071.eurprd08.prod.outlook.com (2603:10a6:4:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 17 Aug
 2022 08:27:12 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::48c7:a78d:1802:5c35]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::48c7:a78d:1802:5c35%5]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 08:27:12 +0000
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
X-Inumbo-ID: 718b2011-1e06-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OvyM3xtkeq8WnS7meyI/EkOn/nuveh2n3GRkqpluwvhKTnCUq5Rn5iqCcOEiTf+U2WWwkrepOE7h6qYK/H++LdpxrIkCMGis6FS1nRnKPFuw/lXdXaRGD58oBcNu4LBiqv3YIAEycbEQ21HRjw4yfRsqFag/Q6ItG4QvpooL/44TavK+lG/KkSBHt4ssbabTq8hF7CCBUc20Mq8YU6sANTcJ8b1VtZXphSgcrvR+w0LyFfYRTE0FLcnZ+9e5e3nM6Y5+/RXbj643YpJO5ahx6z2HiLOI4Jz5/IZAd/8vL/wOBcGVc7+sN+JF+qGUj0yCwNeH/RKWnHYGBM9Qhs9eRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz9I/D5ZchjRGdxGZGXG7aj7JeOqaIHICI92cvSowj8=;
 b=Y6KTYg0OjRPQ83F7qzckxFvdg+6TX+/4N3qAusat8a9h/nnw80zCxVvi694dc+W8Y/Zed2J2mIG2nazv+qHDZg6G5VrRN4BKwRTk+M77Fy9bBZU1CBh1/RdB/DDUFEZLPzky94Nm0HlrxuPooTpG+oDCRE9aq/vzEHXyR04/c7BmMFGrDli0glS/mBPPDQ9GwJ7IMLg6YqejrglIYAuP9k3CM9R8FguOpGVgSH4RYQ2+u2XHCZ6crn1w4J80dtjqtIqi8H0c8FqSBEW7CCxj4GQkZr9Dbq0VM+yqWB6zsw+CLI+0uyOSH24raAjuZDAStWqj51Okq2NH00mySSCbkQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz9I/D5ZchjRGdxGZGXG7aj7JeOqaIHICI92cvSowj8=;
 b=uU8TM8kZ2DmcEJ4XObqFPrlKuozFm8+tFErEsfPS0gz10wEG38HiiobP3CWdw0xwcIxYuea5Pc5vuxYk8s0kENZO5JrJGPM7paSVC0S+wevbMYwQoMiAZTXlYPXqa5aV79e0rifv2Wz7y88l+NzsH69bNEMstGcVPh24L+JvrCU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkTl1EswSOt9pnpcTKDbi/GotrY4m0kR2NTFvvINVWPWB5OEgdmn/yOXo5CK25bpjmhl+ehSWmmkVzE5feMDPGjlvWOJDW8jbO2vNiPJzk00ZNHeygrRvNvCibh//WgEtO3ajRNVLZybz3+Wo1uQU3VtdyMgR+8oloZErusZby9MvkbI+erjsgvodm1EAGnMIFtrUv/NtnYpku7DJiFvU5WHJJUI2U4R6Ht2VqD69RBJyCC35TgvGe2MOyANIPoYK14oLWNlpIJwMqWb+jjssJyoUkIDKZMxyWJ7dhPJCqXqSe/xTeentmxaJUb9a7nTSlZdeN7ke5KwaZJys8RlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz9I/D5ZchjRGdxGZGXG7aj7JeOqaIHICI92cvSowj8=;
 b=KKB9Uo9mQ5pC0hSCO3YSvEc5vzZ+PmfFIobLyAcbaAA5MFpJhLFY/9ywj9qlANLScm556YGpw21bT8nhTCpV+73LECF7UxAVg8UpcIAs2kaev+cnxY7cAvqyMNGH/lXUdiLirNpCcTSncBWnqB8vPhj1P8ApPHwKEMeEGsLzWadPGZTLgd2Ox8hdaSLmwijAB74y7+VhQZbgjqNoEy3TgoS51gmlOATKk1kvqVSmlKdQhHWY7HMh7IUSKWzyap50eEttBa+FGjJ700VrFlHg/FOCtcBTvD84ZkysZ1jq6dJk+cVbOHoFhzVOiHKgvXC5BJNdzHjFRYNJQ5/wCa47FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz9I/D5ZchjRGdxGZGXG7aj7JeOqaIHICI92cvSowj8=;
 b=uU8TM8kZ2DmcEJ4XObqFPrlKuozFm8+tFErEsfPS0gz10wEG38HiiobP3CWdw0xwcIxYuea5Pc5vuxYk8s0kENZO5JrJGPM7paSVC0S+wevbMYwQoMiAZTXlYPXqa5aV79e0rifv2Wz7y88l+NzsH69bNEMstGcVPh24L+JvrCU=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Juergen
 Gross <jgross@suse.com>
Subject: RE: [PATCH 01/16] libxl: Add support for Virtio disk configuration
Thread-Topic: [PATCH 01/16] libxl: Add support for Virtio disk configuration
Thread-Index: AQHYsd4YRGx5AOUecEmozY/PfDLmxK2ywlFQ
Date: Wed, 17 Aug 2022 08:27:12 +0000
Message-ID:
 <AS8PR08MB7696ACA4CFB5FCFF3FCCC64E926A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220817020701.27379-1-jiamei.xie@arm.com>
In-Reply-To: <20220817020701.27379-1-jiamei.xie@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: ABE29874C847904980750C26A3BFBC4F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 23d32540-629a-4f35-5037-08da802a52a2
x-ms-traffictypediagnostic:
	DB6PR0801MB2071:EE_|VE1EUR03FT034:EE_|HE1PR0801MB1851:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PRCP4dKbiMj/7CEKZ9yUCtigoZNZFs9l6Q9u2n8iWI9anc4D94ldLYvTjN/LdmqY6E5Hb3vlxLdEclhhvHUYutteGXA5V4VMt1gtqy9+qGDqh1dCSN0hcud8zmtLqFJ6V7tdECl8NJeSPQn4/Kb1nqpKPIhb9/MP+FO9hyaeoGtoo5OPJO2zmVW7JTaC9HIle2PSwxOJgY3TceaR7cD36R/mNixVwRhM3envkVOjwcW7BGWusHZAYif3DP7E6nC04VFMNGAFkPwvUB3jMQpzLPnEH4wUdwCI5JbMIqVh2AVc39hOfcGkaRjGxKiekzcikQh7V2YbzO+BonITkMSk4Ky5tPh1/ROiU2+J5EIn/QAAmM/gkGIv1sMPIuxTK9x7cOtu6rBekkzWVA1Z5K/T8C6SOh2aM6GHmQARY02nTktf8rWmsxu27EqZYD9whjdRh1nRdYBV7mtT0TtYPCQSeQurj8xZXNaiS1Q0THZkfv/zfhv/sg25eyfLwHKkQAdwuVE5cpO+8sjOFXmmIpQj+sErClcE2hSAYVS/iwfLfMAqYHFjWPsG1pFqssi6O1rVLuNDr7SC2GHwr2EO55nt3xOnRMZDg7/WEcZTpEYIgeVApqyCi/yw4SGa9xJncewMag9vF8usRdPEi0IqKaA8dzcNucaB+sexofKRTjOXuGy6goS27UAK7xHGUSE8EisTHQRFGjHWYq/D2NVwe745aVXD+7TMtW+NRdFDN9GI4C7nujUoWLA6xa0CUYqXeHRZRpQcACT3nWK3WCNsMZ3Hz2Qn1mh4hB9gBXPvKTsi/Bdt+aIjZH4vTAukleQaaNDM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(122000001)(86362001)(38070700005)(38100700002)(8676002)(4326008)(66476007)(76116006)(66946007)(110136005)(66556008)(66446008)(54906003)(316002)(64756008)(2906002)(5660300002)(8936002)(30864003)(52536014)(53546011)(186003)(83380400001)(9686003)(478600001)(71200400001)(55016003)(7696005)(6506007)(26005)(41300700001)(33656002)(579004)(559001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a5ad2e88-3377-4fbf-da21-08da802a48f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mW0Cws2fC051huoqOivmoF8nget/DuMaPk7N5J3veK0uJKMR9NycUtOEQLruro8SQQ/Ra5MyFo3Rk6xBtR1wip2QPylrWEzLKnV18I0frpp3dBulxOuECQwOX9Jw/wp56psmEva4xEIYEUNW9lpIbivQj4YoxLtYtr4ZT9gtK6+kkrqflnvjBgmQxIelYdbsgxanEYgQ3Ry+MW+qydr6d7sQ4D5Sh5GgvtF1Adwmd6WO2SEvTlb0vrEh/rfaF3Ucf3sZqen1Nlqm5kd4U0vKNuasSf8vxNs4heYQ1ACGoC+ZRBZ4HlY8mJ5epdNcZTN2L7zdXTmX7PJEJILddbfRClnMgumCD7YSRbjkGW/oH/Z8SkxE+3jNfOki2iASNNFgKxyvMD/zeHyu4F7vHMk1dDAE0bi7hfCqV5O48MP1jNk2tjnVZt6OFlrPvkBHhSj1GzTDvMYJMhrTPq4E5nidC8Va93lEupaoYbhVBQAqDW/Od6n0KmzRDmdSlupMgpDdqTfBvlOrS28brbhMgtZ1yAG0H4iYP+ZFsQl11WGU1OsTwKiHp5lyscumfEWVOdyfONgS3NVBB7abOCTsUn21xL3vyKJfdkyI9Fbx/XQ2NzAeSrsCoUXxDjGwUSUSFSYwbsBoZXGlGJeRvjL9qrJNhUqMurGAO7khMWkXEOSfG6tZhrxx688LaExxNW/l3dXFvPeaLaCsomHsuUQuDArPJZsemAPQUUphY7KRcGwA0M3hEeZwwfBkPEjNcD4BKSL60jspo+5oLFzj4ZDJx/xYETaP0oM3gnalEvIfBsXURRC2gMh/6rY97ANIOY+2n6zW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(376002)(346002)(40470700004)(36840700001)(46966006)(9686003)(53546011)(6506007)(7696005)(26005)(86362001)(33656002)(186003)(36860700001)(82740400003)(82310400005)(83380400001)(81166007)(336012)(47076005)(356005)(55016003)(40480700001)(40460700003)(5660300002)(30864003)(478600001)(52536014)(70586007)(70206006)(8936002)(8676002)(4326008)(2906002)(107886003)(110136005)(41300700001)(54906003)(316002)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:27:28.8291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d32540-629a-4f35-5037-08da802a52a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1851

Hi all
 Sorry for that, please ignore this too.  I sent the wrong email.

> -----Original Message-----
> From: jiaxie01 <jiamei.xie@arm.com>
> Sent: Wednesday, August 17, 2022 10:07 AM
> To: Jiamei Xie <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Wei Liu
> <wl@xen.org>; Anthony PERARD <anthony.perard@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Nick Rosbrook
> <rosbrookn@gmail.com>; Juergen Gross <jgross@suse.com>
> Subject: [PATCH 01/16] libxl: Add support for Virtio disk configuration
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> This patch adds basic support for configuring and assisting virtio-mmio
> based virtio-disk backend (emulator) which is intended to run out of
> Qemu and could be run in any domain.
> Although the Virtio block device is quite different from traditional
> Xen PV block device (vbd) from the toolstack's point of view:
>  - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>    written to Xenstore are fetched by the frontend currently ("vdev"
>    is not passed to the frontend). But this might need to be revised
>    in future, so frontend data might be written to Xenstore in order to
>    support hotplugging virtio devices or passing the backend domain id
>    on arch where the device-tree is not available.
>  - the ring-ref/event-channel are not used for the backend<->frontend
>    communication, the proposed IPC for Virtio is IOREQ/DM
> it is still a "block device" and ought to be integrated in existing
> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
> logic to deal with Virtio devices as well.
>=20
> For the immediate purpose and an ability to extend that support for
> other use-cases in future (Qemu, virtio-pci, etc) perform the following
> actions:
> - Add new disk backend type (LIBXL_DISK_BACKEND_STANDALONE) and
> reflect
>   that in the configuration
> - Introduce new disk "specification" and "transport" fields to struct
>   libxl_device_disk. Both are written to the Xenstore. The transport
>   field is only used for the specification "virtio" and it assumes
>   only "mmio" value for now.
> - Introduce new "specification" option with "xen" communication
>   protocol being default value.
> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>   one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
>=20
> An example of domain configuration for Virtio disk:
> disk =3D [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=3Dstandalone,
> specification=3Dvirtio']
>=20
> Nothing has changed for default Xen disk configuration.
>=20
> Please note, this patch is not enough for virtio-disk to work
> on Xen (Arm), as for every Virtio device (including disk) we need
> to allocate Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree. The subsequent
> patch will add these missing bits. For the current patch,
> the default "irq" and "base" are just written to the Xenstore.
> This is not an ideal splitting, but this way we avoid breaking
> the bisectability.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes RFC -> V1:
>    - no changes
>=20
> Changes V1 -> V2:
>    - rebase according to the new location of libxl_virtio_disk.c
>=20
> Changes V2 -> V3:
>    - no changes
>=20
> Changes V3 -> V4:
>    - rebase according to the new argument for DEFINE_DEVICE_TYPE_STRUCT
>=20
> Changes V4 -> V5:
>    - split the changes, change the order of the patches
>    - update patch description
>    - don't introduce new "vdisk" configuration option with own parsing lo=
gic,
>      re-use Xen PV block "disk" parsing/configuration logic for the virti=
o-disk
>    - introduce "virtio" flag and document it's usage
>    - add LIBXL_HAVE_DEVICE_DISK_VIRTIO
>    - update libxlu_disk_l.[ch]
>    - drop num_disks variable/MAX_VIRTIO_DISKS
>    - drop Wei's T-b
>=20
> Changes V5 -> V6:
>    - rebase on current staging
>    - use "%"PRIu64 instead of %lu for disk->base in device_disk_add()
>    - update *.gen.go files
>=20
> Changes V6 -> V7:
>    - rebase on current staging
>    - update *.gen.go files and libxlu_disk_l.[ch] files
>    - update patch description
>    - rework significantly to support more flexible configuration
>      and have more generic basic implementation for being able to extend
>      that for other use-cases (virtio-pci, qemu, etc).
>=20
> Changes V7 -> V8:
>    - update *.gen.go files and libxlu_disk_l.[ch] files
>    - update patch description and comments in the code
>    - use "specification" config option instead of "protocol"
>    - update libxl_types.idl and code according to new fields
>      in libxl_device_disk
>=20
> Changes V8 -> V9:
>    - update (and harden) checks in libxl__device_disk_setdefault(),
>      return error in case of incorrect settings of specification
>      and transport
>    - remove both asserts in device_disk_add()
>    - update virtio related code in libxl__disk_from_xenstore(),
>      do not fail if specification node is absent, replace
>      open-coded checks of fetched specification and transport by
>      libxl_disk_specification_from_string() and
> libxl_disk_transport_from_string()
>      respectively
>    - s/libxl_device_disk_get_path/libxl__device_disk_get_path
>    - add a comment for virtio-mmio parameters in struct libxl_device_disk
>=20
> Changes V9 -> V10:
>    - s/ERROR_FAIL/ERROR_INVAL in both places in
> libxl__device_disk_setdefault()
>    - rework libxl__device_disk_get_path()
>=20
> Changes V10 -> V10.1:
>    - fix small coding style issue in libxl__device_disk_get_path()
>    - drop specification check in main_blockattach() and add
>      required check in libxl__device_disk_setdefault()
>    - update specification check in main_blockdetach()
>=20
> Changes V10.1 -> V11:
>    - Anthony already gave his Reviewed-by, I dropped it due to the change=
s
>    - George already gave his Acked-by, I dropped it due to the changes
>    - s/other/standalone for the backendtype
> ---
> ---
>  docs/man/xl-disk-configuration.5.pod.in   |  38 +-
>  tools/golang/xenlight/helpers.gen.go      |   8 +
>  tools/golang/xenlight/types.gen.go        |  18 +
>  tools/include/libxl.h                     |   7 +
>  tools/libs/light/libxl_device.c           |  62 +-
>  tools/libs/light/libxl_disk.c             | 146 +++-
>  tools/libs/light/libxl_internal.h         |   2 +
>  tools/libs/light/libxl_types.idl          |  18 +
>  tools/libs/light/libxl_types_internal.idl |   1 +
>  tools/libs/light/libxl_utils.c            |   2 +
>  tools/libs/util/libxlu_disk_l.c           | 959 +++++++++++-----------
>  tools/libs/util/libxlu_disk_l.h           |   2 +-
>  tools/libs/util/libxlu_disk_l.l           |   9 +
>  tools/xl/xl_block.c                       |   6 +
>  14 files changed, 798 insertions(+), 480 deletions(-)
>=20
> diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-
> configuration.5.pod.in
> index 71d0e86e3d..822c940f90 100644
> --- a/docs/man/xl-disk-configuration.5.pod.in
> +++ b/docs/man/xl-disk-configuration.5.pod.in
> @@ -232,7 +232,7 @@ Specifies the backend implementation to use
>=20
>  =3Ditem Supported values
>=20
> -phy, qdisk
> +phy, qdisk, standalone
>=20
>  =3Ditem Mandatory
>=20
> @@ -244,11 +244,13 @@ Automatically determine which backend to use.
>=20
>  =3Dback
>=20
> -This does not affect the guest's view of the device.  It controls
> -which software implementation of the Xen backend driver is used.
> +It controls which software implementation of the backend driver is used.
> +Depending on the "specification" option this may affect the guest's view
> +of the device.
>=20
>  Not all backend drivers support all combinations of other options.
> -For example, "phy" does not support formats other than "raw".
> +For example, "phy" and "standalone" do not support formats other than
> "raw"
> +and "standalone" does not support specifications other than "virtio".
>  Normally this option should not be specified, in which case libxl will
>  automatically determine the most suitable backend.
>=20
> @@ -344,8 +346,36 @@ can be used to disable "hole punching" for file
> based backends which
>  were intentionally created non-sparse to avoid fragmentation of the
>  file.
>=20
> +=3Ditem B<specification>=3DI<SPECIFICATION>
> +
> +=3Dover 4
> +
> +=3Ditem Description
> +
> +Specifies the communication protocol (specification) to use for the chos=
en
> +"backendtype" option
> +
> +=3Ditem Supported values
> +
> +xen, virtio
> +
> +=3Ditem Mandatory
> +
> +No
> +
> +=3Ditem Default value
> +
> +xen
> +
>  =3Dback
>=20
> +Besides forcing toolstack to use specific backend implementation, this a=
lso
> +affects the guest's view of the device. For example, "virtio" requires
> +Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
> +device (vdev) is not passed to the guest in that case, but it still must=
 be
> +specified for the internal purposes.
> +
> +=3Dback
>=20
>  =3Dhead1 COLO Parameters
>=20
> diff --git a/tools/golang/xenlight/helpers.gen.go
> b/tools/golang/xenlight/helpers.gen.go
> index b746ff1081..00f10b9df3 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1751,6 +1751,10 @@ x.DirectIoSafe =3D bool(xc.direct_io_safe)
>  if err :=3D x.DiscardEnable.fromC(&xc.discard_enable);err !=3D nil {
>  return fmt.Errorf("converting field DiscardEnable: %v", err)
>  }
> +x.Specification =3D DiskSpecification(xc.specification)
> +x.Transport =3D DiskTransport(xc.transport)
> +x.Irq =3D uint32(xc.irq)
> +x.Base =3D uint64(xc.base)
>  if err :=3D x.ColoEnable.fromC(&xc.colo_enable);err !=3D nil {
>  return fmt.Errorf("converting field ColoEnable: %v", err)
>  }
> @@ -1788,6 +1792,10 @@ xc.direct_io_safe =3D C.bool(x.DirectIoSafe)
>  if err :=3D x.DiscardEnable.toC(&xc.discard_enable); err !=3D nil {
>  return fmt.Errorf("converting field DiscardEnable: %v", err)
>  }
> +xc.specification =3D C.libxl_disk_specification(x.Specification)
> +xc.transport =3D C.libxl_disk_transport(x.Transport)
> +xc.irq =3D C.uint32_t(x.Irq)
> +xc.base =3D C.uint64_t(x.Base)
>  if err :=3D x.ColoEnable.toC(&xc.colo_enable); err !=3D nil {
>  return fmt.Errorf("converting field ColoEnable: %v", err)
>  }
> diff --git a/tools/golang/xenlight/types.gen.go
> b/tools/golang/xenlight/types.gen.go
> index b1e84d5258..c729b95d02 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -99,6 +99,20 @@ DiskBackendUnknown DiskBackend =3D 0
>  DiskBackendPhy DiskBackend =3D 1
>  DiskBackendTap DiskBackend =3D 2
>  DiskBackendQdisk DiskBackend =3D 3
> +DiskBackendStandalone DiskBackend =3D 4
> +)
> +
> +type DiskSpecification int
> +const(
> +DiskSpecificationUnknown DiskSpecification =3D 0
> +DiskSpecificationXen DiskSpecification =3D 1
> +DiskSpecificationVirtio DiskSpecification =3D 2
> +)
> +
> +type DiskTransport int
> +const(
> +DiskTransportUnknown DiskTransport =3D 0
> +DiskTransportMmio DiskTransport =3D 1
>  )
>=20
>  type NicType int
> @@ -643,6 +657,10 @@ Readwrite int
>  IsCdrom int
>  DirectIoSafe bool
>  DiscardEnable Defbool
> +Specification DiskSpecification
> +Transport DiskTransport
> +Irq uint32
> +Base uint64
>  ColoEnable Defbool
>  ColoRestoreEnable Defbool
>  ColoHost string
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 7ce978e83c..0f02b6b58b 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -527,6 +527,13 @@
>   */
>  #define LIBXL_HAVE_MAX_GRANT_VERSION 1
>=20
> +/*
> + * LIBXL_HAVE_DEVICE_DISK_SPECIFICATION indicates that 'specification'
> and
> + * 'transport' fields (of libxl_disk_specification and libxl_disk_transp=
ort
> + * types respectively) are present in libxl_device_disk.
> + */
> +#define LIBXL_HAVE_DEVICE_DISK_SPECIFICATION 1
> +
>  /*
>   * libxl ABI compatibility
>   *
> diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_dev=
ice.c
> index e6025d135e..a75c21d433 100644
> --- a/tools/libs/light/libxl_device.c
> +++ b/tools/libs/light/libxl_device.c
> @@ -289,9 +289,16 @@ static int disk_try_backend(disk_try_backend_args
> *a,
>                              libxl_disk_backend backend)
>   {
>      libxl__gc *gc =3D a->gc;
> +    libxl_disk_specification specification =3D a->disk->specification;
>      /* returns 0 (ie, DISK_BACKEND_UNKNOWN) on failure, or
>       * backend on success */
>=20
> +    if ((specification =3D=3D LIBXL_DISK_SPECIFICATION_VIRTIO &&
> +         backend !=3D LIBXL_DISK_BACKEND_STANDALONE) ||
> +        (specification !=3D LIBXL_DISK_SPECIFICATION_VIRTIO &&
> +         backend =3D=3D LIBXL_DISK_BACKEND_STANDALONE))
> +        goto bad_specification;
> +
>      switch (backend) {
>      case LIBXL_DISK_BACKEND_PHY:
>          if (a->disk->format !=3D LIBXL_DISK_FORMAT_RAW) {
> @@ -329,6 +336,29 @@ static int disk_try_backend(disk_try_backend_args
> *a,
>          if (a->disk->script) goto bad_script;
>          return backend;
>=20
> +    case LIBXL_DISK_BACKEND_STANDALONE:
> +        if (a->disk->format !=3D LIBXL_DISK_FORMAT_RAW)
> +            goto bad_format;
> +
> +        if (a->disk->script)
> +            goto bad_script;
> +
> +        if (libxl_defbool_val(a->disk->colo_enable))
> +            goto bad_colo;
> +
> +        if (a->disk->backend_domid !=3D LIBXL_TOOLSTACK_DOMID) {
> +            LOG(DEBUG, "Disk vdev=3D%s, is using a storage driver domain=
, "
> +                       "skipping physical device check", a->disk->vdev);
> +            return backend;
> +        }
> +
> +        if (libxl__try_phy_backend(a->stab.st_mode))
> +            return backend;
> +
> +        LOG(DEBUG, "Disk vdev=3D%s, backend standalone unsuitable as phy=
s
> path not a "
> +                   "block device", a->disk->vdev);
> +        return 0;
> +
>      default:
>          LOG(DEBUG, "Disk vdev=3D%s, backend %d unknown", a->disk->vdev,
> backend);
>          return 0;
> @@ -352,6 +382,12 @@ static int disk_try_backend(disk_try_backend_args
> *a,
>      LOG(DEBUG, "Disk vdev=3D%s, backend %s not compatible with colo",
>          a->disk->vdev, libxl_disk_backend_to_string(backend));
>      return 0;
> +
> + bad_specification:
> +    LOG(DEBUG, "Disk vdev=3D%s, backend %s not compatible with
> specification %s",
> +        a->disk->vdev, libxl_disk_backend_to_string(backend),
> +        libxl_disk_specification_to_string(specification));
> +    return 0;
>  }
>=20
>  int libxl__backendpath_parse_domid(libxl__gc *gc, const char *be_path,
> @@ -376,8 +412,9 @@ int libxl__device_disk_set_backend(libxl__gc *gc,
> libxl_device_disk *disk) {
>      a.gc =3D gc;
>      a.disk =3D disk;
>=20
> -    LOG(DEBUG, "Disk vdev=3D%s spec.backend=3D%s", disk->vdev,
> -               libxl_disk_backend_to_string(disk->backend));
> +    LOG(DEBUG, "Disk vdev=3D%s spec.backend=3D%s specification=3D%s", di=
sk-
> >vdev,
> +               libxl_disk_backend_to_string(disk->backend),
> +               libxl_disk_specification_to_string(disk->specification));
>=20
>      if (disk->format =3D=3D LIBXL_DISK_FORMAT_EMPTY) {
>          if (!disk->is_cdrom) {
> @@ -392,7 +429,8 @@ int libxl__device_disk_set_backend(libxl__gc *gc,
> libxl_device_disk *disk) {
>          }
>          memset(&a.stab, 0, sizeof(a.stab));
>      } else if ((disk->backend =3D=3D LIBXL_DISK_BACKEND_UNKNOWN ||
> -                disk->backend =3D=3D LIBXL_DISK_BACKEND_PHY) &&
> +                disk->backend =3D=3D LIBXL_DISK_BACKEND_PHY ||
> +                disk->backend =3D=3D LIBXL_DISK_BACKEND_STANDALONE) &&
>                 disk->backend_domid =3D=3D LIBXL_TOOLSTACK_DOMID &&
>                 !disk->script) {
>          if (stat(disk->pdev_path, &a.stab)) {
> @@ -408,7 +446,8 @@ int libxl__device_disk_set_backend(libxl__gc *gc,
> libxl_device_disk *disk) {
>          ok=3D
>              disk_try_backend(&a, LIBXL_DISK_BACKEND_PHY) ?:
>              disk_try_backend(&a, LIBXL_DISK_BACKEND_QDISK) ?:
> -            disk_try_backend(&a, LIBXL_DISK_BACKEND_TAP);
> +            disk_try_backend(&a, LIBXL_DISK_BACKEND_TAP) ?:
> +            disk_try_backend(&a, LIBXL_DISK_BACKEND_STANDALONE);
>          if (ok)
>              LOG(DEBUG, "Disk vdev=3D%s, using backend %s",
>                         disk->vdev,
> @@ -441,10 +480,25 @@ char
> *libxl__device_disk_string_of_backend(libxl_disk_backend backend)
>          case LIBXL_DISK_BACKEND_QDISK: return "qdisk";
>          case LIBXL_DISK_BACKEND_TAP: return "phy";
>          case LIBXL_DISK_BACKEND_PHY: return "phy";
> +        case LIBXL_DISK_BACKEND_STANDALONE: return "standalone";
> +        default: return NULL;
> +    }
> +}
> +
> +char *libxl__device_disk_string_of_specification(libxl_disk_specificatio=
n
> specification)
> +{
> +    switch (specification) {
> +        case LIBXL_DISK_SPECIFICATION_XEN: return "xen";
> +        case LIBXL_DISK_SPECIFICATION_VIRTIO: return "virtio";
>          default: return NULL;
>      }
>  }
>=20
> +char *libxl__device_disk_string_of_transport(libxl_disk_transport transp=
ort)
> +{
> +    return (transport =3D=3D LIBXL_DISK_TRANSPORT_MMIO ? "mmio" : NULL);
> +}
> +
>  const char *libxl__qemu_disk_format_string(libxl_disk_format format)
>  {
>      switch (format) {
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.=
c
> index a5ca77850f..4429bfd479 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -163,6 +163,30 @@ static int libxl__device_disk_setdefault(libxl__gc *=
gc,
> uint32_t domid,
>      rc =3D libxl__resolve_domid(gc, disk->backend_domname, &disk-
> >backend_domid);
>      if (rc < 0) return rc;
>=20
> +    if (disk->specification =3D=3D LIBXL_DISK_SPECIFICATION_UNKNOWN)
> +        disk->specification =3D LIBXL_DISK_SPECIFICATION_XEN;
> +
> +    if (disk->specification =3D=3D LIBXL_DISK_SPECIFICATION_XEN &&
> +        disk->transport !=3D LIBXL_DISK_TRANSPORT_UNKNOWN) {
> +        LOGD(ERROR, domid, "Transport is only supported for specificatio=
n
> virtio");
> +        return ERROR_INVAL;
> +    }
> +
> +    /* Force transport mmio for specification virtio for now */
> +    if (disk->specification =3D=3D LIBXL_DISK_SPECIFICATION_VIRTIO) {
> +        if (!(disk->transport =3D=3D LIBXL_DISK_TRANSPORT_UNKNOWN ||
> +              disk->transport =3D=3D LIBXL_DISK_TRANSPORT_MMIO)) {
> +            LOGD(ERROR, domid, "Unsupported transport for specification
> virtio");
> +            return ERROR_INVAL;
> +        }
> +        disk->transport =3D LIBXL_DISK_TRANSPORT_MMIO;
> +    }
> +
> +    if (hotplug && disk->specification =3D=3D LIBXL_DISK_SPECIFICATION_V=
IRTIO) {
> +        LOGD(ERROR, domid, "Hotplug isn't supported for specification vi=
rtio");
> +        return ERROR_FAIL;
> +    }
> +
>      /* Force Qdisk backend for CDROM devices of guests with a device mod=
el.
> */
>      if (disk->is_cdrom !=3D 0 &&
>          libxl__domain_type(gc, domid) =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
> @@ -204,6 +228,9 @@ static int libxl__device_from_disk(libxl__gc *gc,
> uint32_t domid,
>          case LIBXL_DISK_BACKEND_QDISK:
>              device->backend_kind =3D LIBXL__DEVICE_KIND_QDISK;
>              break;
> +        case LIBXL_DISK_BACKEND_STANDALONE:
> +            device->backend_kind =3D LIBXL__DEVICE_KIND_VIRTIO_DISK;
> +            break;
>          default:
>              LOGD(ERROR, domid, "Unrecognized disk backend type: %d",
>                   disk->backend);
> @@ -212,7 +239,8 @@ static int libxl__device_from_disk(libxl__gc *gc,
> uint32_t domid,
>=20
>      device->domid =3D domid;
>      device->devid =3D devid;
> -    device->kind  =3D LIBXL__DEVICE_KIND_VBD;
> +    device->kind =3D disk->backend =3D=3D LIBXL_DISK_BACKEND_STANDALONE =
?
> +        LIBXL__DEVICE_KIND_VIRTIO_DISK : LIBXL__DEVICE_KIND_VBD;
>=20
>      return 0;
>  }
> @@ -330,7 +358,14 @@ static void device_disk_add(libxl__egc *egc,
> uint32_t domid,
>=20
>                  assert(device->backend_kind =3D=3D LIBXL__DEVICE_KIND_VB=
D);
>                  break;
> +            case LIBXL_DISK_BACKEND_STANDALONE:
> +                dev =3D disk->pdev_path;
> +
> +                flexarray_append(back, "params");
> +                flexarray_append(back, dev);
>=20
> +                assert(device->backend_kind =3D=3D
> LIBXL__DEVICE_KIND_VIRTIO_DISK);
> +                break;
>              case LIBXL_DISK_BACKEND_TAP:
>                  LOG(ERROR, "blktap is not supported");
>                  rc =3D ERROR_FAIL;
> @@ -386,6 +421,14 @@ static void device_disk_add(libxl__egc *egc,
> uint32_t domid,
>          flexarray_append_pair(back, "discard-enable",
>                                libxl_defbool_val(disk->discard_enable) ?
>                                "1" : "0");
> +        flexarray_append(back, "specification");
> +        flexarray_append(back, libxl__device_disk_string_of_specificatio=
n(disk-
> >specification));
> +        if (disk->specification =3D=3D LIBXL_DISK_SPECIFICATION_VIRTIO) =
{
> +            flexarray_append(back, "transport");
> +            flexarray_append(back, libxl__device_disk_string_of_transpor=
t(disk-
> >transport));
> +            flexarray_append_pair(back, "base", GCSPRINTF("%"PRIu64, dis=
k-
> >base));
> +            flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq=
));
> +        }
>=20
>          flexarray_append(front, "backend-id");
>          flexarray_append(front, GCSPRINTF("%d", disk->backend_domid));
> @@ -532,6 +575,53 @@ static int libxl__disk_from_xenstore(libxl__gc *gc,
> const char *libxl_path,
>      }
>      libxl_string_to_backend(ctx, tmp, &(disk->backend));
>=20
> +    tmp =3D libxl__xs_read(gc, XBT_NULL,
> +                         GCSPRINTF("%s/specification", libxl_path));
> +    if (!tmp) {
> +        LOG(DEBUG, "Missing xenstore node %s/specification, assuming
> specification xen", libxl_path);
> +        disk->specification =3D LIBXL_DISK_SPECIFICATION_XEN;
> +    } else {
> +        rc =3D libxl_disk_specification_from_string(tmp, &disk->specific=
ation);
> +        if (rc) {
> +            LOG(ERROR, "Unable to parse xenstore node %s/specification",
> libxl_path);
> +            goto cleanup;
> +        }
> +    }
> +
> +    if (disk->specification =3D=3D LIBXL_DISK_SPECIFICATION_VIRTIO) {
> +        tmp =3D libxl__xs_read(gc, XBT_NULL,
> +                             GCSPRINTF("%s/transport", libxl_path));
> +        if (!tmp) {
> +            LOG(ERROR, "Missing xenstore node %s/transport", libxl_path)=
;
> +            goto cleanup;
> +        }
> +        rc =3D libxl_disk_transport_from_string(tmp, &disk->transport);
> +        if (rc) {
> +            LOG(ERROR, "Unable to parse xenstore node %s/transport",
> libxl_path);
> +            goto cleanup;
> +        }
> +        if (disk->transport !=3D LIBXL_DISK_TRANSPORT_MMIO) {
> +            LOG(ERROR, "Only transport mmio is expected for specificatio=
n
> virtio");
> +            goto cleanup;
> +        }
> +
> +        tmp =3D libxl__xs_read(gc, XBT_NULL,
> +                             GCSPRINTF("%s/base", libxl_path));
> +        if (!tmp) {
> +            LOG(ERROR, "Missing xenstore node %s/base", libxl_path);
> +            goto cleanup;
> +        }
> +        disk->base =3D strtoul(tmp, NULL, 10);
> +
> +        tmp =3D libxl__xs_read(gc, XBT_NULL,
> +                             GCSPRINTF("%s/irq", libxl_path));
> +        if (!tmp) {
> +            LOG(ERROR, "Missing xenstore node %s/irq", libxl_path);
> +            goto cleanup;
> +        }
> +        disk->irq =3D strtoul(tmp, NULL, 10);
> +    }
> +
>      disk->vdev =3D xs_read(ctx->xsh, XBT_NULL,
>                           GCSPRINTF("%s/dev", libxl_path), &len);
>      if (!disk->vdev) {
> @@ -575,6 +665,42 @@ cleanup:
>      return rc;
>  }
>=20
> +static int libxl__device_disk_get_path(libxl__gc *gc, uint32_t domid,
> +                                       char **path)
> +{
> +    const char *xen_dir, *virtio_dir;
> +    char *xen_path, *virtio_path;
> +    int rc;
> +
> +    /* default path */
> +    xen_path =3D GCSPRINTF("%s/device/%s",
> +                         libxl__xs_libxl_path(gc, domid),
> +                         libxl__device_kind_to_string(LIBXL__DEVICE_KIND=
_VBD));
> +
> +    rc =3D libxl__xs_read_checked(gc, XBT_NULL, xen_path, &xen_dir);
> +    if (rc)
> +        return rc;
> +
> +    virtio_path =3D GCSPRINTF("%s/device/%s",
> +                            libxl__xs_libxl_path(gc, domid),
> +
> libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
> +
> +    rc =3D libxl__xs_read_checked(gc, XBT_NULL, virtio_path, &virtio_dir=
);
> +    if (rc)
> +        return rc;
> +
> +    if (xen_dir && virtio_dir) {
> +        LOGD(ERROR, domid, "Invalid configuration, both xen and virtio p=
aths
> are present");
> +        return ERROR_INVAL;
> +    } else if (virtio_dir) {
> +        *path =3D virtio_path;
> +    } else {
> +        *path =3D xen_path;
> +    }
> +
> +    return 0;
> +}
> +
>  int libxl_vdev_to_device_disk(libxl_ctx *ctx, uint32_t domid,
>                                const char *vdev, libxl_device_disk *disk)
>  {
> @@ -588,10 +714,12 @@ int libxl_vdev_to_device_disk(libxl_ctx *ctx,
> uint32_t domid,
>=20
>      libxl_device_disk_init(disk);
>=20
> -    libxl_path =3D libxl__domain_device_libxl_path(gc, domid, devid,
> -                                                 LIBXL__DEVICE_KIND_VBD)=
;
> +    rc =3D libxl__device_disk_get_path(gc, domid, &libxl_path);
> +    if (rc)
> +        return rc;
>=20
> -    rc =3D libxl__disk_from_xenstore(gc, libxl_path, devid, disk);
> +    rc =3D libxl__disk_from_xenstore(gc, GCSPRINTF("%s/%d", libxl_path, =
devid),
> +                                   devid, disk);
>=20
>      GC_FREE;
>      return rc;
> @@ -605,16 +733,19 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx,
> uint32_t domid,
>      char *fe_path, *libxl_path;
>      char *val;
>      int rc;
> +    libxl__device_kind kind;
>=20
>      diskinfo->backend =3D NULL;
>=20
>      diskinfo->devid =3D libxl__device_disk_dev_number(disk->vdev, NULL, =
NULL);
>=20
> -    /* tap devices entries in xenstore are written as vbd devices. */
> +    /* tap devices entries in xenstore are written as vbd/virtio_disk de=
vices.
> */
> +    kind =3D disk->backend =3D=3D LIBXL_DISK_BACKEND_STANDALONE ?
> +        LIBXL__DEVICE_KIND_VIRTIO_DISK : LIBXL__DEVICE_KIND_VBD;
>      fe_path =3D libxl__domain_device_frontend_path(gc, domid, diskinfo-
> >devid,
> -                                                 LIBXL__DEVICE_KIND_VBD)=
;
> +                                                 kind);
>      libxl_path =3D libxl__domain_device_libxl_path(gc, domid, diskinfo->=
devid,
> -                                                 LIBXL__DEVICE_KIND_VBD)=
;
> +                                                 kind);
>      diskinfo->backend =3D xs_read(ctx->xsh, XBT_NULL,
>                                  GCSPRINTF("%s/backend", libxl_path), NUL=
L);
>      if (!diskinfo->backend) {
> @@ -1418,6 +1549,7 @@ LIBXL_DEFINE_DEVICE_LIST(disk)
>  #define libxl__device_disk_update_devid NULL
>=20
>  DEFINE_DEVICE_TYPE_STRUCT(disk, VBD, disks,
> +    .get_path    =3D libxl__device_disk_get_path,
>      .merge       =3D libxl_device_disk_merge,
>      .dm_needed   =3D libxl_device_disk_dm_needed,
>      .from_xenstore =3D (device_from_xenstore_fn_t)libxl__disk_from_xenst=
ore,
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_i=
nternal.h
> index bdef5a605e..cb9e8b3b8b 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -1493,6 +1493,8 @@ _hidden char *
> libxl__domain_pvcontrol_read(libxl__gc *gc,
>=20
>  /* from xl_device */
>  _hidden char *libxl__device_disk_string_of_backend(libxl_disk_backend
> backend);
> +_hidden char
> *libxl__device_disk_string_of_specification(libxl_disk_specification
> specification);
> +_hidden char *libxl__device_disk_string_of_transport(libxl_disk_transpor=
t
> transport);
>  _hidden char *libxl__device_disk_string_of_format(libxl_disk_format
> format);
>  _hidden const char *libxl__qemu_disk_format_string(libxl_disk_format
> format);
>  _hidden int libxl__device_disk_set_backend(libxl__gc*, libxl_device_disk=
*);
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 2a42da2f7d..3c898e320c 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -130,6 +130,18 @@ libxl_disk_backend =3D Enumeration("disk_backend",
> [
>      (1, "PHY"),
>      (2, "TAP"),
>      (3, "QDISK"),
> +    (4, "STANDALONE"), # Only relying on the Xenstore data
> +    ])
> +
> +libxl_disk_specification =3D Enumeration("disk_specification", [
> +    (0, "UNKNOWN"),
> +    (1, "XEN"),
> +    (2, "VIRTIO"),
> +    ])
> +
> +libxl_disk_transport =3D Enumeration("disk_transport", [
> +    (0, "UNKNOWN"),
> +    (1, "MMIO"),
>      ])
>=20
>  libxl_nic_type =3D Enumeration("nic_type", [
> @@ -704,6 +716,12 @@ libxl_device_disk =3D Struct("device_disk", [
>      ("is_cdrom", integer),
>      ("direct_io_safe", bool),
>      ("discard_enable", libxl_defbool),
> +    ("specification", libxl_disk_specification),
> +    ("transport", libxl_disk_transport),
> +    # Note that virtio-mmio parameters (irq and base) are for internal u=
se
> +    # by libxl and can't be modified.
> +    ("irq", uint32),
> +    ("base", uint64),
>      # Note that the COLO configuration settings should be considered uns=
table.
>      # They may change incompatibly in future versions of Xen.
>      ("colo_enable", libxl_defbool),
> diff --git a/tools/libs/light/libxl_types_internal.idl
> b/tools/libs/light/libxl_types_internal.idl
> index 3593e21dbb..8f71980aec 100644
> --- a/tools/libs/light/libxl_types_internal.idl
> +++ b/tools/libs/light/libxl_types_internal.idl
> @@ -32,6 +32,7 @@ libxl__device_kind =3D Enumeration("device_kind", [
>      (14, "PVCALLS"),
>      (15, "VSND"),
>      (16, "VINPUT"),
> +    (17, "VIRTIO_DISK"),
>      ])
>=20
>  libxl__console_backend =3D Enumeration("console_backend", [
> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_util=
s.c
> index e5e6b2da96..e403bd9bcf 100644
> --- a/tools/libs/light/libxl_utils.c
> +++ b/tools/libs/light/libxl_utils.c
> @@ -297,6 +297,8 @@ int libxl_string_to_backend(libxl_ctx *ctx, char *s,
> libxl_disk_backend *backend
>          *backend =3D LIBXL_DISK_BACKEND_TAP;
>      } else if (!strcmp(s, "qdisk")) {
>          *backend =3D LIBXL_DISK_BACKEND_QDISK;
> +    } else if (!strcmp(s, "standalone")) {
> +        *backend =3D LIBXL_DISK_BACKEND_STANDALONE;
>      } else if (!strcmp(s, "tap")) {
>          p =3D strchr(s, ':');
>          if (!p) {
> diff --git a/tools/libs/util/libxlu_disk_l.c b/tools/libs/util/libxlu_dis=
k_l.c
> index 32d4b74b58..0b59723b71 100644
> --- a/tools/libs/util/libxlu_disk_l.c
> +++ b/tools/libs/util/libxlu_disk_l.c
> @@ -549,8 +549,8 @@ static void yynoreturn yy_fatal_error ( const char*
> msg , yyscan_t yyscanner );
>  	yyg->yy_hold_char =3D *yy_cp; \
>  	*yy_cp =3D '\0'; \
>  	yyg->yy_c_buf_p =3D yy_cp;
> -#define YY_NUM_RULES 36
> -#define YY_END_OF_BUFFER 37
> +#define YY_NUM_RULES 37
> +#define YY_END_OF_BUFFER 38
>  /* This struct is not used in this scanner,
>     but its presence is necessary. */
>  struct yy_trans_info
> @@ -558,74 +558,77 @@ struct yy_trans_info
>  	flex_int32_t yy_verify;
>  	flex_int32_t yy_nxt;
>  	};
> -static const flex_int16_t yy_acclist[575] =3D
> +static const flex_int16_t yy_acclist[594] =3D
>      {   0,
> -       35,   35,   37,   33,   34,   36, 8193,   33,   34,   36,
> -    16385, 8193,   33,   36,16385,   33,   34,   36,   34,   36,
> -       33,   34,   36,   33,   34,   36,   33,   34,   36,   33,
> -       34,   36,   33,   34,   36,   33,   34,   36,   33,   34,
> -       36,   33,   34,   36,   33,   34,   36,   33,   34,   36,
> -       33,   34,   36,   33,   34,   36,   33,   34,   36,   33,
> -       34,   36,   33,   34,   36,   33,   34,   36,   35,   36,
> -       36,   33,   33, 8193,   33, 8193,   33,16385, 8193,   33,
> -     8193,   33,   33, 8224,   33,16416,   33,   33,   33,   33,
> -       33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
> -
> -       33,   33,   33,   33,   33,   33,   33,   33,   33,   35,
> -     8193,   33, 8193,   33, 8193, 8224,   33, 8224,   33, 8224,
> -       23,   33,   33,   33,   33,   33,   33,   33,   33,   33,
> -       33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
> -       33,   33,   33,   33,   33, 8224,   33, 8224,   33, 8224,
> -       23,   33,   33,   28, 8224,   33,16416,   33,   33,   15,
> -       33,   33,   33,   33,   33,   33,   33,   33,   33, 8217,
> -     8224,   33,16409,16416,   33,   33,   31, 8224,   33,16416,
> -       33, 8216, 8224,   33,16408,16416,   33,   33, 8219, 8224,
> -       33,16411,16416,   33,   33,   33,   33,   33,   28, 8224,
> -
> -       33,   28, 8224,   33,   28,   33,   28, 8224,   33,    3,
> -       33,   15,   33,   33,   33,   33,   33,   30, 8224,   33,
> -    16416,   33,   33,   33, 8217, 8224,   33, 8217, 8224,   33,
> -     8217,   33, 8217, 8224,   33,   33,   31, 8224,   33,   31,
> -     8224,   33,   31,   33,   31, 8224, 8216, 8224,   33, 8216,
> -     8224,   33, 8216,   33, 8216, 8224,   33, 8219, 8224,   33,
> -     8219, 8224,   33, 8219,   33, 8219, 8224,   33,   33,   10,
> -       33,   33,   28, 8224,   33,   28, 8224,   33,   28, 8224,
> -       28,   33,   28,   33,    3,   33,   33,   33,   33,   33,
> -       33,   33,   30, 8224,   33,   30, 8224,   33,   30,   33,
> -
> -       30, 8224,   33,   33,   29, 8224,   33,16416, 8217, 8224,
> -       33, 8217, 8224,   33, 8217, 8224, 8217,   33, 8217,   33,
> -       33,   31, 8224,   33,   31, 8224,   33,   31, 8224,   31,
> -       33,   31, 8216, 8224,   33, 8216, 8224,   33, 8216, 8224,
> -     8216,   33, 8216,   33, 8219, 8224,   33, 8219, 8224,   33,
> -     8219, 8224, 8219,   33, 8219,   33,   33,   10,   23,   10,
> -        7,   33,   33,   33,   33,   33,   33,   33,   13,   33,
> -       30, 8224,   33,   30, 8224,   33,   30, 8224,   30,   33,
> -       30,    2,   33,   29, 8224,   33,   29, 8224,   33,   29,
> -       33,   29, 8224,   16,   33,   33,   11,   33,   22,   10,
> -
> -       10,   23,    7,   23,    7,   33,    8,   33,   33,   33,
> -       33,    6,   33,   13,   33,    2,   23,    2,   33,   29,
> -     8224,   33,   29, 8224,   33,   29, 8224,   29,   33,   29,
> -       16,   33,   33,   11,   23,   11,   26, 8224,   33,16416,
> -       22,   23,   22,    7,    7,   23,   33,    8,   23,    8,
> -       33,   33,   33,   33,    6,   23,    6,    6,   23,    6,
> -       23,   33,    2,    2,   23,   33,   33,   11,   11,   23,
> -       26, 8224,   33,   26, 8224,   33,   26,   33,   26, 8224,
> -       22,   23,   33,    8,    8,   23,   33,   33,   17,   18,
> -        6,    6,   23,    6,    6,   33,   33,   14,   33,   26,
> -
> -     8224,   33,   26, 8224,   33,   26, 8224,   26,   33,   26,
> -       33,   33,   33,   17,   23,   17,   18,   23,   18,    6,
> -        6,   33,   33,   14,   33,   20,    9,   19,   17,   17,
> -       23,   18,   18,   23,    6,    5,    6,   33,   21,   20,
> -       23,   20,    9,   23,    9,   19,   23,   19,    4,    6,
> -        5,    6,   33,   21,   23,   21,   20,   20,   23,    9,
> -        9,   23,   19,   19,   23,    4,    6,   12,   33,   21,
> -       21,   23,   12,   33
> +       36,   36,   38,   34,   35,   37, 8193,   34,   35,   37,
> +    16385, 8193,   34,   37,16385,   34,   35,   37,   35,   37,
> +       34,   35,   37,   34,   35,   37,   34,   35,   37,   34,
> +       35,   37,   34,   35,   37,   34,   35,   37,   34,   35,
> +       37,   34,   35,   37,   34,   35,   37,   34,   35,   37,
> +       34,   35,   37,   34,   35,   37,   34,   35,   37,   34,
> +       35,   37,   34,   35,   37,   34,   35,   37,   36,   37,
> +       37,   34,   34, 8193,   34, 8193,   34,16385, 8193,   34,
> +     8193,   34,   34, 8225,   34,16417,   34,   34,   34,   34,
> +       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
> +
> +       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
> +       36, 8193,   34, 8193,   34, 8193, 8225,   34, 8225,   34,
> +     8225,   24,   34,   34,   34,   34,   34,   34,   34,   34,
> +       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
> +       34,   34,   34,   34,   34,   34,   34, 8225,   34, 8225,
> +       34, 8225,   24,   34,   34,   29, 8225,   34,16417,   34,
> +       34,   16,   34,   34,   34,   34,   34,   34,   34,   34,
> +       34, 8218, 8225,   34,16410,16417,   34,   34,   32, 8225,
> +       34,16417,   34, 8217, 8225,   34,16409,16417,   34,   34,
> +       34, 8220, 8225,   34,16412,16417,   34,   34,   34,   34,
> +
> +       34,   29, 8225,   34,   29, 8225,   34,   29,   34,   29,
> +     8225,   34,    3,   34,   16,   34,   34,   34,   34,   34,
> +       31, 8225,   34,16417,   34,   34,   34, 8218, 8225,   34,
> +     8218, 8225,   34, 8218,   34, 8218, 8225,   34,   34,   32,
> +     8225,   34,   32, 8225,   34,   32,   34,   32, 8225, 8217,
> +     8225,   34, 8217, 8225,   34, 8217,   34, 8217, 8225,   34,
> +       34, 8220, 8225,   34, 8220, 8225,   34, 8220,   34, 8220,
> +     8225,   34,   34,   11,   34,   34,   29, 8225,   34,   29,
> +     8225,   34,   29, 8225,   29,   34,   29,   34,    3,   34,
> +       34,   34,   34,   34,   34,   34,   31, 8225,   34,   31,
> +
> +     8225,   34,   31,   34,   31, 8225,   34,   34,   30, 8225,
> +       34,16417, 8218, 8225,   34, 8218, 8225,   34, 8218, 8225,
> +     8218,   34, 8218,   34,   34,   32, 8225,   34,   32, 8225,
> +       34,   32, 8225,   32,   34,   32, 8217, 8225,   34, 8217,
> +     8225,   34, 8217, 8225, 8217,   34, 8217,   34,   34, 8220,
> +     8225,   34, 8220, 8225,   34, 8220, 8225, 8220,   34, 8220,
> +       34,   34,   11,   24,   11,    7,   34,   34,   34,   34,
> +       34,   34,   34,   14,   34,   31, 8225,   34,   31, 8225,
> +       34,   31, 8225,   31,   34,   31,    2,   34,   30, 8225,
> +       34,   30, 8225,   34,   30,   34,   30, 8225,   17,   34,
> +
> +       34,   12,   34,   34,   23,   11,   11,   24,    7,   24,
> +        7,   34,    8,   34,   34,   34,   34,    6,   34,   14,
> +       34,    2,   24,    2,   34,   30, 8225,   34,   30, 8225,
> +       34,   30, 8225,   30,   34,   30,   17,   34,   34,   12,
> +       24,   12,   34,   27, 8225,   34,16417,   23,   24,   23,
> +        7,    7,   24,   34,    8,   24,    8,   34,   34,   34,
> +       34,    6,   24,    6,    6,   24,    6,   24,   34,    2,
> +        2,   24,   34,   34,   12,   12,   24,   34,   27, 8225,
> +       34,   27, 8225,   34,   27,   34,   27, 8225,   23,   24,
> +       34,    8,    8,   24,   34,   34,   18,   19,    6,    6,
> +
> +       24,    6,    6,   34,   34,   15,   34,   34,   27, 8225,
> +       34,   27, 8225,   34,   27, 8225,   27,   34,   27,   34,
> +       34,   34,   18,   24,   18,   19,   24,   19,    6,    6,
> +       34,   34,   15,   34,   34,   21,    9,   20,   18,   18,
> +       24,   19,   19,   24,    6,    5,    6,   34,   22,   34,
> +       21,   24,   21,    9,   24,    9,   20,   24,   20,    4,
> +        6,    5,    6,   34,   22,   24,   22,   34,   21,   21,
> +       24,    9,    9,   24,   20,   20,   24,    4,    6,   13,
> +       34,   22,   22,   24,   10,   13,   34,   10,   24,   10,
> +       10,   10,   24
> +
>      } ;
>=20
> -static const flex_int16_t yy_accept[356] =3D
> +static const flex_int16_t yy_accept[373] =3D
>      {   0,
>          1,    1,    1,    2,    3,    4,    7,   12,   16,   19,
>         21,   24,   27,   30,   33,   36,   39,   42,   45,   48,
> @@ -633,39 +636,41 @@ static const flex_int16_t yy_accept[356] =3D
>         74,   76,   79,   81,   82,   83,   84,   87,   87,   88,
>         89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
>         99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
> -      109,  110,  111,  113,  115,  116,  118,  120,  121,  122,
> +      109,  110,  111,  112,  114,  116,  117,  119,  121,  122,
>        123,  124,  125,  126,  127,  128,  129,  130,  131,  132,
>        133,  134,  135,  136,  137,  138,  139,  140,  141,  142,
> -      143,  144,  145,  146,  148,  150,  151,  152,  153,  154,
> -
> -      158,  159,  160,  162,  163,  164,  165,  166,  167,  168,
> -      169,  170,  175,  176,  177,  181,  182,  187,  188,  189,
> -      194,  195,  196,  197,  198,  199,  202,  205,  207,  209,
> -      210,  212,  214,  215,  216,  217,  218,  222,  223,  224,
> -      225,  228,  231,  233,  235,  236,  237,  240,  243,  245,
> -      247,  250,  253,  255,  257,  258,  261,  264,  266,  268,
> -      269,  270,  271,  272,  273,  276,  279,  281,  283,  284,
> -      285,  287,  288,  289,  290,  291,  292,  293,  296,  299,
> -      301,  303,  304,  305,  309,  312,  315,  317,  319,  320,
> -      321,  322,  325,  328,  330,  332,  333,  336,  339,  341,
> -
> -      343,  344,  345,  348,  351,  353,  355,  356,  357,  358,
> -      360,  361,  362,  363,  364,  365,  366,  367,  368,  369,
> -      371,  374,  377,  379,  381,  382,  383,  384,  387,  390,
> -      392,  394,  396,  397,  398,  399,  400,  401,  403,  405,
> -      406,  407,  408,  409,  410,  411,  412,  413,  414,  416,
> -      418,  419,  420,  423,  426,  428,  430,  431,  433,  434,
> -      436,  437,  441,  443,  444,  445,  447,  448,  450,  451,
> -      452,  453,  454,  455,  457,  458,  460,  462,  463,  464,
> -      466,  467,  468,  469,  471,  474,  477,  479,  481,  483,
> -      484,  485,  487,  488,  489,  490,  491,  492,  494,  495,
> -
> -      496,  497,  498,  500,  503,  506,  508,  510,  511,  512,
> -      513,  514,  516,  517,  519,  520,  521,  522,  523,  524,
> -      526,  527,  528,  529,  530,  532,  533,  535,  536,  538,
> -      539,  540,  542,  543,  545,  546,  548,  549,  551,  553,
> -      554,  556,  557,  558,  560,  561,  563,  564,  566,  568,
> -      570,  571,  573,  575,  575
> +      143,  144,  145,  146,  147,  148,  150,  152,  153,  154,
> +
> +      155,  156,  160,  161,  162,  164,  165,  166,  167,  168,
> +      169,  170,  171,  172,  177,  178,  179,  183,  184,  189,
> +      190,  191,  192,  197,  198,  199,  200,  201,  202,  205,
> +      208,  210,  212,  213,  215,  217,  218,  219,  220,  221,
> +      225,  226,  227,  228,  231,  234,  236,  238,  239,  240,
> +      243,  246,  248,  250,  253,  256,  258,  260,  261,  262,
> +      265,  268,  270,  272,  273,  274,  275,  276,  277,  280,
> +      283,  285,  287,  288,  289,  291,  292,  293,  294,  295,
> +      296,  297,  300,  303,  305,  307,  308,  309,  313,  316,
> +      319,  321,  323,  324,  325,  326,  329,  332,  334,  336,
> +
> +      337,  340,  343,  345,  347,  348,  349,  350,  353,  356,
> +      358,  360,  361,  362,  363,  365,  366,  367,  368,  369,
> +      370,  371,  372,  373,  374,  376,  379,  382,  384,  386,
> +      387,  388,  389,  392,  395,  397,  399,  401,  402,  403,
> +      404,  405,  406,  407,  409,  411,  412,  413,  414,  415,
> +      416,  417,  418,  419,  420,  422,  424,  425,  426,  429,
> +      432,  434,  436,  437,  439,  440,  442,  443,  444,  448,
> +      450,  451,  452,  454,  455,  457,  458,  459,  460,  461,
> +      462,  464,  465,  467,  469,  470,  471,  473,  474,  475,
> +      476,  478,  479,  482,  485,  487,  489,  491,  492,  493,
> +
> +      495,  496,  497,  498,  499,  500,  502,  503,  504,  505,
> +      506,  508,  509,  512,  515,  517,  519,  520,  521,  522,
> +      523,  525,  526,  528,  529,  530,  531,  532,  533,  535,
> +      536,  537,  538,  539,  540,  542,  543,  545,  546,  548,
> +      549,  550,  551,  553,  554,  556,  557,  559,  560,  562,
> +      564,  565,  567,  568,  569,  570,  572,  573,  575,  576,
> +      578,  580,  582,  583,  585,  586,  588,  590,  591,  592,
> +      594,  594
>      } ;
>=20
>  static const YY_CHAR yy_ec[256] =3D
> @@ -708,216 +713,224 @@ static const YY_CHAR yy_meta[35] =3D
>          1,    1,    1,    1
>      } ;
>=20
> -static const flex_int16_t yy_base[424] =3D
> +static const flex_int16_t yy_base[443] =3D
>      {   0,
> -        0,    0,  901,  900,  902,  897,   33,   36,  905,  905,
> -       45,   63,   31,   42,   51,   52,  890,   33,   65,   67,
> -       69,   70,  889,   71,  888,   75,    0,  905,  893,  905,
> -       91,   94,    0,    0,  103,  886,  112,    0,   89,   98,
> -      113,   92,  114,   99,  100,   48,  121,  116,  119,   74,
> -      124,  129,  123,  135,  132,  133,  137,  134,  138,  139,
> -      141,    0,  155,    0,    0,  164,    0,    0,  849,  142,
> -      152,  164,  140,  161,  165,  166,  167,  168,  169,  173,
> -      174,  178,  176,  180,  184,  208,  189,  183,  192,  195,
> -      215,  191,  193,  223,    0,    0,  905,  208,  204,  236,
> -
> -      219,  209,  238,  196,  237,  831,  242,  815,  241,  224,
> -      243,  261,  244,  259,  277,  266,  286,  250,  288,  298,
> -      249,  283,  274,  282,  294,  308,    0,  310,    0,  295,
> -      305,  905,  308,  306,  313,  314,  342,  319,  316,  320,
> -      331,    0,  349,    0,  342,  344,  356,    0,  358,    0,
> -      365,    0,  367,    0,  354,  375,    0,  377,    0,  363,
> -      356,  809,  327,  322,  384,    0,    0,    0,    0,  379,
> -      905,  382,  384,  386,  390,  372,  392,  403,    0,  410,
> -        0,  407,  413,  423,  426,    0,    0,    0,    0,  409,
> -      424,  435,    0,    0,    0,    0,  437,    0,    0,    0,
> -
> -        0,  433,  444,    0,    0,    0,    0,  391,  440,  781,
> -      905,  769,  439,  445,  444,  447,  449,  454,  453,  399,
> -      464,    0,    0,    0,    0,  757,  465,  476,    0,  478,
> -        0,  479,  476,  753,  462,  490,  749,  905,  745,  905,
> -      483,  737,  424,  485,  487,  490,  500,  493,  905,  729,
> -      905,  502,  518,    0,    0,    0,    0,  905,  498,  721,
> -      905,  527,  713,    0,  705,  905,  495,  697,  905,  365,
> -      521,  528,  530,  685,  905,  534,  540,  540,  657,  905,
> -      537,  542,  650,  905,  553,    0,  557,    0,    0,  551,
> -      641,  905,  558,  557,  633,  614,  613,  905,  547,  555,
> -
> -      563,  565,  569,  584,    0,    0,    0,    0,  583,  570,
> -      585,  612,  905,  601,  905,  522,  580,  589,  594,  905,
> -      600,  585,  563,  520,  905,  514,  905,  586,  486,  597,
> -      480,  441,  905,  416,  905,  345,  905,  334,  905,  601,
> -      254,  905,  242,  905,  200,  905,  151,  905,  905,  607,
> -       86,  905,  905,  905,  620,  624,  627,  631,  635,  639,
> -      643,  647,  651,  655,  659,  663,  667,  671,  675,  679,
> -      683,  687,  691,  695,  699,  703,  707,  711,  715,  719,
> -      723,  727,  731,  735,  739,  743,  747,  751,  755,  759,
> -      763,  767,  771,  775,  779,  783,  787,  791,  795,  799,
> -
> -      803,  807,  811,  815,  819,  823,  827,  831,  835,  839,
> -      843,  847,  851,  855,  859,  863,  867,  871,  875,  879,
> -      883,  887,  891
> +        0,    0,  936,  935,  937,  932,   33,   36,  940,  940,
> +       45,   63,   31,   42,   51,   52,  925,   33,   65,   67,
> +       69,   70,  924,   71,  923,   75,    0,  940,  928,  940,
> +       91,   95,    0,    0,  104,  921,  113,    0,   91,   99,
> +      114,   92,  115,   80,  100,   48,  119,  121,  122,   74,
> +      123,  128,  131,  129,  125,  133,  135,  136,  137,  143,
> +      138,  145,    0,  157,    0,    0,  168,    0,    0,  926,
> +      140,  146,  165,  159,  152,  164,  155,  168,  171,  176,
> +      177,  170,  180,  175,  184,  188,  212,  191,  185,  192,
> +      193,  194,  219,  212,  199,  230,    0,    0,  940,  195,
> +
> +      200,  239,  235,  197,  246,  225,  226,  919,  244,  918,
> +      243,  236,  245,  266,  248,  264,  282,  271,  291,  248,
> +      270,  254,  300,  279,  296,  302,  288,  303,  311,    0,
> +      315,    0,  311,  318,  940,  313,  319,  208,  313,  344,
> +      321,  331,  325,  333,    0,  352,    0,  345,  347,  359,
> +        0,  361,    0,  368,    0,  370,    0,  322,  366,  379,
> +        0,  381,    0,  359,  357,  923,  382,  384,  392,    0,
> +        0,    0,    0,  387,  940,  386,  390,  392,  329,  401,
> +      397,  409,    0,  417,    0,  399,  412,  426,  429,    0,
> +        0,    0,    0,  412,  427,  438,    0,    0,    0,    0,
> +
> +      440,    0,    0,    0,    0,  436,  405,  447,    0,    0,
> +        0,    0,  438,  443,  922,  940,  921,  442,  450,  449,
> +      452,  454,  459,  458,  453,  469,    0,    0,    0,    0,
> +      920,  470,  481,    0,  483,    0,  484,  481,  919,  368,
> +      467,  495,  918,  940,  917,  940,  488,  916,  479,  490,
> +      492,  495,  505,  498,  940,  915,  940,  507,  523,    0,
> +        0,    0,    0,  940,  503,  864,  940,  846,  532,  836,
> +        0,  824,  940,  516,  796,  940,  513,  530,  536,  538,
> +      784,  940,  542,  535,  547,  772,  940,  549,  551,  768,
> +      940,  502,  562,    0,  564,    0,    0,  562,  764,  940,
> +
> +      544,  557,  760,  752,  744,  940,  552,  568,  571,  568,
> +      581,  577,  588,    0,    0,    0,    0,  589,  580,  591,
> +      736,  940,  728,  940,  601,  602,  597,  599,  940,  603,
> +      720,  712,  700,  672,  940,  665,  940,  610,  656,  603,
> +      648,  607,  629,  940,  627,  940,  625,  940,  624,  940,
> +      607,  574,  940,  614,  572,  940,  491,  940,  433,  940,
> +      940,  622,  389,  940,  303,  940,  261,  940,  204,  940,
> +      940,  635,  639,  642,  646,  650,  654,  658,  662,  666,
> +      670,  674,  678,  682,  686,  690,  694,  698,  702,  706,
> +      710,  714,  718,  722,  726,  730,  734,  738,  742,  746,
> +
> +      750,  754,  758,  762,  766,  770,  774,  778,  782,  786,
> +      790,  794,  798,  802,  806,  810,  814,  818,  822,  826,
> +      830,  834,  838,  842,  846,  850,  854,  858,  862,  866,
> +      870,  874,  878,  882,  886,  890,  894,  898,  902,  906,
> +      910,  914
>      } ;
>=20
> -static const flex_int16_t yy_def[424] =3D
> +static const flex_int16_t yy_def[443] =3D
>      {   0,
> -      354,    1,  355,  355,  354,  356,  357,  357,  354,  354,
> -      358,  358,   12,   12,   12,   12,   12,   12,   12,   12,
> -       12,   12,   12,   12,   12,   12,  359,  354,  356,  354,
> -      360,  357,  361,  361,  362,   12,  356,  363,   12,   12,
> -       12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
> +      371,    1,  372,  372,  371,  373,  374,  374,  371,  371,
> +      375,  375,   12,   12,   12,   12,   12,   12,   12,   12,
> +       12,   12,   12,   12,   12,   12,  376,  371,  373,  371,
> +      377,  374,  378,  378,  379,   12,  373,  380,   12,   12,
>         12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
> -       12,  359,  360,  361,  361,  364,  365,  365,  354,   12,
>         12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
> -       12,   12,   12,   12,   12,  362,   12,   12,   12,   12,
> -       12,   12,   12,  364,  365,  365,  354,   12,   12,  366,
> -
> +       12,   12,  376,  377,  378,  378,  381,  382,  382,  371,
>         12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
> -       12,  367,   86,   86,  368,   12,  369,   12,   12,  370,
> -       12,   12,   12,   12,   12,  371,  372,  366,  372,   12,
> -       12,  354,   86,   12,   12,   12,  373,   12,   12,   12,
> -      374,  375,  367,  375,   86,   86,  376,  377,  368,  377,
> -      378,  379,  369,  379,   12,  380,  381,  370,  381,   12,
> -       12,  382,   12,   12,  371,  372,  372,  383,  383,   12,
> -      354,   86,   86,   86,   12,   12,   12,  384,  385,  373,
> -      385,   12,   12,  386,  374,  375,  375,  387,  387,   86,
> -       86,  376,  377,  377,  388,  388,  378,  379,  379,  389,
> -
> -      389,   12,  380,  381,  381,  390,  390,   12,   12,  391,
> -      354,  392,   86,   12,   86,   86,   86,   12,   86,   12,
> -      384,  385,  385,  393,  393,  394,   86,  395,  396,  386,
> -      396,   86,   86,  397,   12,  398,  391,  354,  399,  354,
> -       86,  400,   12,   86,   86,   86,  401,   86,  354,  402,
> -      354,   86,  395,  396,  396,  403,  403,  354,   86,  404,
> -      354,  405,  406,  406,  399,  354,   86,  407,  354,   12,
> -       86,   86,   86,  408,  354,  408,  408,   86,  402,  354,
> -       86,   86,  404,  354,  409,  410,  405,  410,  406,   86,
> -      407,  354,   12,   86,  411,  412,  408,  354,  408,  408,
> -
> -       86,   86,   86,  409,  410,  410,  413,  413,   86,   12,
> -       86,  414,  354,  415,  354,  408,  408,   86,   86,  354,
> -      416,  417,  418,  414,  354,  415,  354,  408,  408,   86,
> -      419,  420,  354,  421,  354,  422,  354,  408,  354,   86,
> -      423,  354,  420,  354,  421,  354,  422,  354,  354,   86,
> -      423,  354,  354,    0,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354
> +       12,   12,   12,   12,   12,   12,  379,   12,   12,   12,
> +       12,   12,   12,   12,   12,  381,  382,  382,  371,   12,
> +
> +       12,  383,   12,   12,   12,   12,   12,   12,   12,   12,
> +       12,   12,   12,  384,   87,   87,  385,   12,  386,   12,
> +       12,   12,  387,   12,   12,   12,   12,   12,  388,  389,
> +      383,  389,   12,   12,  371,   87,   12,   12,   12,  390,
> +       12,   12,   12,  391,  392,  384,  392,   87,   87,  393,
> +      394,  385,  394,  395,  396,  386,  396,   12,   12,  397,
> +      398,  387,  398,   12,   12,  399,   12,   12,  388,  389,
> +      389,  400,  400,   12,  371,   87,   87,   87,   12,   12,
> +       12,  401,  402,  390,  402,   12,   12,  403,  391,  392,
> +      392,  404,  404,   87,   87,  393,  394,  394,  405,  405,
> +
> +      395,  396,  396,  406,  406,   12,   12,  397,  398,  398,
> +      407,  407,   12,   12,  408,  371,  409,   87,   12,   87,
> +       87,   87,   12,   87,   12,  401,  402,  402,  410,  410,
> +      411,   87,  412,  413,  403,  413,   87,   87,  414,   12,
> +       12,  415,  408,  371,  416,  371,   87,  417,   12,   87,
> +       87,   87,  418,   87,  371,  419,  371,   87,  412,  413,
> +      413,  420,  420,  371,   87,  421,  371,   12,  422,  423,
> +      423,  416,  371,   87,  424,  371,   12,   87,   87,   87,
> +      425,  371,  425,  425,   87,  419,  371,   87,   87,  421,
> +      371,   12,  426,  427,  422,  427,  423,   87,  424,  371,
> +
> +       12,   87,  428,  429,  425,  371,  425,  425,   87,   87,
> +       87,   12,  426,  427,  427,  430,  430,   87,   12,   87,
> +      431,  371,  432,  371,  425,  425,   87,   87,  371,   12,
> +      433,  434,  435,  431,  371,  432,  371,  425,  425,   87,
> +      436,   12,  437,  371,  438,  371,  439,  371,  425,  371,
> +       87,  440,  371,   12,  437,  371,  438,  371,  439,  371,
> +      371,   87,  440,  371,  441,  371,  442,  371,  442,  371,
> +        0,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371
>      } ;
>=20
> -static const flex_int16_t yy_nxt[940] =3D
> +static const flex_int16_t yy_nxt[975] =3D
>      {   0,
>          6,    7,    8,    9,    6,    6,    6,    6,   10,   11,
>         12,   13,   14,   15,   16,   17,   18,   19,   17,   17,
>         17,   17,   20,   17,   21,   22,   23,   24,   25,   17,
>         26,   17,   17,   17,   32,   32,   33,   32,   32,   33,
>         36,   34,   36,   42,   34,   29,   29,   29,   30,   35,
> -       50,   36,   37,   38,   43,   44,   39,   36,   79,   45,
> +       50,   36,   37,   38,   43,   44,   39,   36,   80,   45,
>         36,   36,   40,   29,   29,   29,   30,   35,   46,   48,
>         37,   38,   41,   47,   36,   49,   36,   53,   36,   36,
> -       36,   56,   58,   36,   36,   55,   82,   60,   51,  342,
> -       54,   61,   52,   29,   64,   32,   32,   33,   36,   65,
> -
> -       70,   36,   34,   29,   29,   29,   30,   36,   36,   36,
> -       29,   38,   66,   66,   66,   67,   66,   71,   74,   66,
> -       68,   72,   36,   36,   73,   36,   77,   78,   36,   76,
> -       36,   53,   36,   36,   75,   85,   80,   83,   36,   86,
> -       84,   36,   36,   36,   36,   81,   36,   36,   36,   36,
> -       36,   36,   93,   89,  337,   98,   88,   29,   64,  101,
> -       90,   36,   91,   65,   92,   87,   29,   95,   89,   99,
> -       36,  100,   96,   36,   36,   36,   36,   36,   36,  106,
> -      105,   85,   36,   36,  102,   36,  107,   36,  103,   36,
> -      109,  112,   36,   36,  104,  108,  115,  110,   36,  117,
> -
> -       36,   36,   36,  335,   36,   36,  122,  111,   29,   29,
> -       29,   30,  118,   36,  116,   29,   38,   36,   36,  113,
> -      114,  119,  120,  123,   36,   29,   95,  121,   36,  134,
> -      131,   96,  130,   36,  125,  124,  126,  126,   66,  127,
> -      126,  132,  133,  126,  129,  333,   36,   36,  135,  137,
> -       36,   36,   36,  140,  139,   35,   35,  352,   36,   36,
> -       85,  141,  141,   66,  142,  141,  160,  145,  141,  144,
> -       35,   35,   89,  117,  155,   36,  146,  147,  147,   66,
> -      148,  147,  162,   36,  147,  150,  151,  151,   66,  152,
> -      151,   36,   36,  151,  154,  120,  161,   36,  156,  156,
> -
> -       66,  157,  156,   36,   36,  156,  159,  164,  171,  163,
> -       29,  166,   29,  168,   36,   36,  167,  170,  169,   35,
> -       35,  172,   36,   36,  173,   36,  213,  184,   36,   36,
> -      175,   36,  174,   29,  186,  212,   36,  349,  183,  187,
> -      177,  176,  178,  178,   66,  179,  178,  182,  348,  178,
> -      181,   29,  188,   35,   35,   35,   35,  189,   29,  193,
> -       29,  195,  190,   36,  194,   36,  196,   29,  198,   29,
> -      200,  191,   36,  199,   36,  201,  219,   29,  204,   29,
> -      206,   36,  202,  205,  209,  207,   29,  166,   36,  293,
> -      208,  214,  167,   35,   35,   35,   35,   35,   35,   36,
> -
> -       36,   36,  249,  218,  220,   29,  222,  216,   36,  217,
> -      235,  223,   29,  224,  215,  226,   36,  227,  225,  346,
> -       35,   35,   36,  228,  228,   66,  229,  228,   29,  186,
> -      228,  231,  232,   36,  187,  233,   35,   29,  193,   29,
> -      198,  234,   36,  194,  344,  199,   29,  204,  236,   36,
> -       35,  241,  205,  242,   36,   35,   35,  270,   35,   35,
> -       35,   35,  247,   36,   35,   35,   29,  222,  244,  262,
> -      248,   36,  223,  243,  245,  246,   35,  252,   29,  254,
> -       29,  256,  258,  342,  255,  259,  257,   35,   35,  339,
> -       35,   35,   69,  264,   35,   35,   35,   35,   35,   35,
> -
> -      267,   35,   35,  275,   35,   35,   35,   35,  271,   35,
> -       35,  276,  277,   35,   35,  272,  278,  315,  273,  281,
> -       29,  254,  290,  313,  282,  275,  255,  285,  285,   66,
> -      286,  285,   35,   35,  285,  288,  295,  298,  296,   35,
> -       35,   35,   35,  298,  301,  328,  299,  294,   35,   35,
> -      275,   35,   35,   35,  303,   29,  305,  300,  275,   29,
> -      307,  306,   35,   35,  302,  308,  337,   36,   35,   35,
> -      309,  310,  320,  316,   35,   35,   35,   35,  322,   36,
> -       35,   35,  317,  275,  319,  311,   29,  305,  335,  275,
> -      318,  321,  306,  323,   35,   35,   35,   35,  330,  329,
> -
> -       35,   35,  331,  333,  327,   35,   35,  338,   35,   35,
> -      353,  340,   35,   35,  350,  325,  275,  315,   35,   35,
> -       27,   27,   27,   27,   29,   29,   29,   31,   31,   31,
> -       31,   36,   36,   36,   36,   62,  313,   62,   62,   63,
> -       63,   63,   63,   65,  269,   65,   65,   35,   35,   35,
> -       35,   69,   69,  261,   69,   94,   94,   94,   94,   96,
> -      251,   96,   96,  128,  128,  128,  128,  143,  143,  143,
> -      143,  149,  149,  149,  149,  153,  153,  153,  153,  158,
> -      158,  158,  158,  165,  165,  165,  165,  167,  298,  167,
> -      167,  180,  180,  180,  180,  185,  185,  185,  185,  187,
> -
> -      292,  187,  187,  192,  192,  192,  192,  194,  240,  194,
> -      194,  197,  197,  197,  197,  199,  289,  199,  199,  203,
> -      203,  203,  203,  205,  284,  205,  205,  210,  210,  210,
> -      210,  169,  280,  169,  169,  221,  221,  221,  221,  223,
> -      269,  223,  223,  230,  230,  230,  230,  189,  266,  189,
> -      189,  196,  211,  196,  196,  201,  261,  201,  201,  207,
> -      251,  207,  207,  237,  237,  237,  237,  239,  239,  239,
> -      239,  225,  240,  225,  225,  250,  250,  250,  250,  253,
> -      253,  253,  253,  255,  238,  255,  255,  260,  260,  260,
> -      260,  263,  263,  263,  263,  265,  265,  265,  265,  268,
> -
> -      268,  268,  268,  274,  274,  274,  274,  279,  279,  279,
> -      279,  257,  211,  257,  257,  283,  283,  283,  283,  287,
> -      287,  287,  287,  264,  138,  264,  264,  291,  291,  291,
> -      291,  297,  297,  297,  297,  304,  304,  304,  304,  306,
> -      136,  306,  306,  312,  312,  312,  312,  314,  314,  314,
> -      314,  308,   97,  308,  308,  324,  324,  324,  324,  326,
> -      326,  326,  326,  332,  332,  332,  332,  334,  334,  334,
> -      334,  336,  336,  336,  336,  341,  341,  341,  341,  343,
> -      343,  343,  343,  345,  345,  345,  345,  347,  347,  347,
> -      347,  351,  351,  351,  351,   36,   30,   59,   57,   36,
> -
> -       30,  354,   28,   28,    5,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354
> +       36,   56,   58,   36,   36,   55,   83,   61,   51,   36,
> +       54,   62,   52,   29,   65,   59,   32,   32,   33,   66,
> +
> +       36,   36,   71,   34,   29,   29,   29,   30,   36,   36,
> +       77,   29,   38,   67,   67,   67,   68,   67,   75,   72,
> +       67,   69,   73,   36,   36,   74,   78,   79,   36,   53,
> +       36,   36,   36,   87,   36,   76,   84,   36,   36,   85,
> +       36,   81,   36,   86,   36,   36,   36,   36,   82,   36,
> +       92,   95,   36,  100,   36,   36,   89,   90,   88,   29,
> +       65,   36,   91,  101,   36,   66,   90,   93,   36,   94,
> +       29,   97,  102,   36,   36,  104,   98,   36,  103,   36,
> +       36,  107,  108,  106,   36,   36,   36,  105,   86,   36,
> +      109,  110,  111,   36,   36,  114,  112,   36,  117,  119,
> +
> +       36,   36,   36,   36,   36,  121,   36,  368,   36,   36,
> +      120,  113,   29,   29,   29,   30,  118,   36,  134,   29,
> +       38,   36,  127,  115,  116,  122,  123,  125,   36,  126,
> +      128,  124,   29,   97,   36,   36,  180,  138,   98,  129,
> +      129,   67,  130,  129,   36,   36,  129,  132,  133,  135,
> +      136,  140,   36,   36,   36,   36,  142,   36,  137,   35,
> +       35,  123,   86,   36,  370,  143,  144,  144,   67,  145,
> +      144,  148,  158,  144,  147,   35,   35,   90,  119,   36,
> +       36,  149,  150,  150,   67,  151,  150,  159,   36,  150,
> +      153,  154,  154,   67,  155,  154,  164,   36,  154,  157,
> +
> +      160,  160,   67,  161,  160,   36,  368,  160,  163,  165,
> +      166,   36,   36,   29,  170,  167,  168,   29,  172,  171,
> +       36,  175,   36,  173,   35,   35,  176,   36,   36,  177,
> +       36,   36,  188,  174,   36,   29,  190,  178,   36,  181,
> +       36,  191,  223,  179,  182,  182,   67,  183,  182,  186,
> +      206,  182,  185,  187,   29,  192,   35,   35,   35,   35,
> +      193,   29,  197,   29,  199,  194,   36,  198,   36,  200,
> +       29,  202,   29,  204,  195,   36,  203,   36,  205,  268,
> +      207,   29,  209,   29,  211,  214,  213,  210,  218,  212,
> +      217,   36,  353,   36,   29,  170,   36,   35,   35,  219,
> +
> +      171,   35,   35,   35,   35,  224,   36,  231,   36,  225,
> +       36,   29,  227,  221,   36,  222,  232,  228,  220,   29,
> +      229,   36,  240,   35,   35,  230,  233,  233,   67,  234,
> +      233,   29,  190,  233,  236,  237,  348,  191,  238,   35,
> +       29,  197,   29,  202,  239,   36,  198,   36,  203,   29,
> +      209,  242,   36,   35,  247,  210,  255,  241,  248,   36,
> +       35,   35,   36,   35,   35,   35,   35,  253,   36,   35,
> +       35,   29,  227,  250,  269,  254,   36,  228,  249,  251,
> +      252,   35,  258,   29,  260,   29,  262,  264,   36,  261,
> +      265,  263,   35,   35,  346,   35,   35,   70,  271,   35,
> +
> +       35,   35,   35,   35,   35,  274,   35,   35,  282,   35,
> +       35,   36,  277,  278,   35,   35,  283,  284,   35,   35,
> +      279,  285,   36,  280,  288,   29,  260,   35,   35,  289,
> +      312,  261,  293,  293,   67,  294,  293,  301,  306,  293,
> +      296,   35,   35,  298,  303,  306,  304,   35,   35,   35,
> +       35,  309,  308,   36,  307,  282,  302,  319,   35,   35,
> +       35,   35,   35,  311,   29,  314,   29,  316,   35,   35,
> +      315,  282,  317,   35,   35,  344,  310,  364,  325,   35,
> +       35,  318,   35,   35,  329,  320,   36,  328,  332,   36,
> +       29,  314,   35,   35,  330,  326,  315,  331,  327,  333,
> +
> +       35,   35,   35,   35,  282,  282,  340,  341,   35,   35,
> +       35,   35,   36,  282,   35,   35,   36,  351,   35,   35,
> +      362,  339,  365,   36,  338,  366,  342,  361,  360,  354,
> +      358,  349,  356,   35,   35,   27,   27,   27,   27,   29,
> +       29,   29,   31,   31,   31,   31,   36,   36,   36,   36,
> +       63,  353,   63,   63,   64,   64,   64,   64,   66,  350,
> +       66,   66,   35,   35,   35,   35,   70,   70,  324,   70,
> +       96,   96,   96,   96,   98,  322,   98,   98,  131,  131,
> +      131,  131,  146,  146,  146,  146,  152,  152,  152,  152,
> +      156,  156,  156,  156,  162,  162,  162,  162,  169,  169,
> +
> +      169,  169,  171,  348,  171,  171,  184,  184,  184,  184,
> +      189,  189,  189,  189,  191,  346,  191,  191,  196,  196,
> +      196,  196,  198,  344,  198,  198,  201,  201,  201,  201,
> +      203,  337,  203,  203,  208,  208,  208,  208,  210,  335,
> +      210,  210,  215,  215,  215,  215,  173,  282,  173,  173,
> +      226,  226,  226,  226,  228,  324,  228,  228,  235,  235,
> +      235,  235,  193,  322,  193,  193,  200,  276,  200,  200,
> +      205,  267,  205,  205,  212,  257,  212,  212,  243,  243,
> +      243,  243,  245,  245,  245,  245,  230,  306,  230,  230,
> +      256,  256,  256,  256,  259,  259,  259,  259,  261,  300,
> +
> +      261,  261,  266,  266,  266,  266,  270,  270,  270,  270,
> +      272,  272,  272,  272,  275,  275,  275,  275,  281,  281,
> +      281,  281,  286,  286,  286,  286,  263,  246,  263,  263,
> +      290,  290,  290,  290,  295,  295,  295,  295,  271,  297,
> +      271,  271,  299,  299,  299,  299,  305,  305,  305,  305,
> +      313,  313,  313,  313,  315,  292,  315,  315,  321,  321,
> +      321,  321,  323,  323,  323,  323,  317,  291,  317,  317,
> +      334,  334,  334,  334,  336,  336,  336,  336,  343,  343,
> +      343,  343,  345,  345,  345,  345,  347,  347,  347,  347,
> +      352,  352,  352,  352,  355,  355,  355,  355,  357,  357,
> +
> +      357,  357,  359,  359,  359,  359,  363,  363,  363,  363,
> +      367,  367,  367,  367,  369,  369,  369,  369,  287,  276,
> +      273,  216,  267,  257,  246,  244,  216,  141,  139,   99,
> +       36,   30,   60,   57,   36,   30,  371,   28,   28,    5,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371
>      } ;
>=20
> -static const flex_int16_t yy_chk[940] =3D
> +static const flex_int16_t yy_chk[975] =3D
>      {   0,
>          1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
>          1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
> @@ -927,101 +940,105 @@ static const flex_int16_t yy_chk[940] =3D
>         18,   14,   11,   11,   13,   14,   11,   46,   46,   14,
>         15,   16,   11,   12,   12,   12,   12,   12,   14,   16,
>         12,   12,   12,   15,   19,   16,   20,   20,   21,   22,
> -       24,   22,   24,   50,   26,   21,   50,   26,   19,  351,
> -       20,   26,   19,   31,   31,   32,   32,   32,   39,   31,
> -
> -       39,   42,   32,   35,   35,   35,   35,   40,   44,   45,
> -       35,   35,   37,   37,   37,   37,   37,   39,   42,   37,
> -       37,   40,   41,   43,   41,   48,   45,   45,   49,   44,
> -       47,   47,   53,   51,   43,   53,   48,   51,   52,   54,
> -       52,   55,   56,   58,   54,   49,   57,   59,   60,   73,
> -       61,   70,   60,   61,  347,   70,   56,   63,   63,   73,
> -       58,   71,   59,   63,   59,   55,   66,   66,   57,   71,
> -       74,   72,   66,   72,   75,   76,   77,   78,   79,   78,
> -       77,   79,   80,   81,   74,   83,   80,   82,   75,   84,
> -       82,   85,   88,   85,   76,   81,   87,   83,   87,   89,
> -
> -       92,   89,   93,  345,   90,  104,   92,   84,   86,   86,
> -       86,   86,   90,   99,   88,   86,   86,   98,  102,   86,
> -       86,   91,   91,   93,   91,   94,   94,   91,  101,  104,
> -      102,   94,  101,  110,   99,   98,  100,  100,  100,  100,
> -      100,  103,  103,  100,  100,  343,  105,  103,  105,  107,
> -      109,  107,  111,  110,  109,  113,  113,  341,  121,  118,
> -      111,  112,  112,  112,  112,  112,  121,  113,  112,  112,
> -      114,  114,  116,  116,  118,  116,  114,  115,  115,  115,
> -      115,  115,  123,  123,  115,  115,  117,  117,  117,  117,
> -      117,  124,  122,  117,  117,  119,  122,  119,  120,  120,
> -
> -      120,  120,  120,  125,  130,  120,  120,  125,  131,  124,
> -      126,  126,  128,  128,  131,  134,  126,  130,  128,  133,
> -      133,  133,  135,  136,  133,  139,  164,  140,  138,  140,
> -      134,  164,  133,  141,  141,  163,  163,  338,  139,  141,
> -      136,  135,  137,  137,  137,  137,  137,  138,  336,  137,
> -      137,  143,  143,  145,  145,  146,  146,  143,  147,  147,
> -      149,  149,  145,  155,  147,  161,  149,  151,  151,  153,
> -      153,  146,  160,  151,  270,  153,  176,  156,  156,  158,
> -      158,  176,  155,  156,  161,  158,  165,  165,  170,  270,
> -      160,  170,  165,  172,  172,  173,  173,  174,  174,  175,
> -
> -      208,  177,  220,  175,  177,  178,  178,  173,  220,  174,
> -      208,  178,  180,  180,  172,  182,  182,  183,  180,  334,
> -      190,  190,  183,  184,  184,  184,  184,  184,  185,  185,
> -      184,  184,  190,  243,  185,  191,  191,  192,  192,  197,
> -      197,  202,  202,  192,  332,  197,  203,  203,  209,  209,
> -      213,  213,  203,  214,  214,  215,  215,  243,  216,  216,
> -      217,  217,  218,  218,  219,  219,  221,  221,  215,  235,
> -      219,  235,  221,  214,  216,  217,  227,  227,  228,  228,
> -      230,  230,  232,  331,  228,  233,  230,  233,  233,  329,
> -      232,  232,  236,  236,  241,  241,  244,  244,  245,  245,
> -
> -      241,  246,  246,  247,  248,  248,  267,  267,  244,  259,
> -      259,  247,  247,  252,  252,  245,  248,  326,  246,  252,
> -      253,  253,  267,  324,  259,  316,  253,  262,  262,  262,
> -      262,  262,  271,  271,  262,  262,  272,  276,  273,  272,
> -      272,  273,  273,  277,  278,  316,  276,  271,  281,  281,
> -      299,  278,  278,  282,  282,  285,  285,  277,  300,  287,
> -      287,  285,  290,  290,  281,  287,  323,  293,  294,  294,
> -      290,  293,  303,  299,  301,  301,  302,  302,  310,  310,
> -      303,  303,  300,  317,  302,  294,  304,  304,  322,  328,
> -      301,  309,  304,  311,  309,  309,  311,  311,  318,  317,
> -
> -      318,  318,  319,  321,  314,  319,  319,  328,  330,  330,
> -      350,  330,  340,  340,  340,  312,  297,  296,  350,  350,
> -      355,  355,  355,  355,  356,  356,  356,  357,  357,  357,
> -      357,  358,  358,  358,  358,  359,  295,  359,  359,  360,
> -      360,  360,  360,  361,  291,  361,  361,  362,  362,  362,
> -      362,  363,  363,  283,  363,  364,  364,  364,  364,  365,
> -      279,  365,  365,  366,  366,  366,  366,  367,  367,  367,
> -      367,  368,  368,  368,  368,  369,  369,  369,  369,  370,
> -      370,  370,  370,  371,  371,  371,  371,  372,  274,  372,
> -      372,  373,  373,  373,  373,  374,  374,  374,  374,  375,
> -
> -      268,  375,  375,  376,  376,  376,  376,  377,  265,  377,
> -      377,  378,  378,  378,  378,  379,  263,  379,  379,  380,
> -      380,  380,  380,  381,  260,  381,  381,  382,  382,  382,
> -      382,  383,  250,  383,  383,  384,  384,  384,  384,  385,
> -      242,  385,  385,  386,  386,  386,  386,  387,  239,  387,
> -      387,  388,  237,  388,  388,  389,  234,  389,  389,  390,
> -      226,  390,  390,  391,  391,  391,  391,  392,  392,  392,
> -      392,  393,  212,  393,  393,  394,  394,  394,  394,  395,
> -      395,  395,  395,  396,  210,  396,  396,  397,  397,  397,
> -      397,  398,  398,  398,  398,  399,  399,  399,  399,  400,
> -
> -      400,  400,  400,  401,  401,  401,  401,  402,  402,  402,
> -      402,  403,  162,  403,  403,  404,  404,  404,  404,  405,
> -      405,  405,  405,  406,  108,  406,  406,  407,  407,  407,
> -      407,  408,  408,  408,  408,  409,  409,  409,  409,  410,
> -      106,  410,  410,  411,  411,  411,  411,  412,  412,  412,
> -      412,  413,   69,  413,  413,  414,  414,  414,  414,  415,
> -      415,  415,  415,  416,  416,  416,  416,  417,  417,  417,
> -      417,  418,  418,  418,  418,  419,  419,  419,  419,  420,
> -      420,  420,  420,  421,  421,  421,  421,  422,  422,  422,
> -      422,  423,  423,  423,  423,   36,   29,   25,   23,   17,
> -
> -        6,    5,    4,    3,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
> -      354,  354,  354,  354,  354,  354,  354,  354,  354
> +       24,   22,   24,   50,   26,   21,   50,   26,   19,   44,
> +       20,   26,   19,   31,   31,   24,   32,   32,   32,   31,
> +
> +       39,   42,   39,   32,   35,   35,   35,   35,   40,   45,
> +       44,   35,   35,   37,   37,   37,   37,   37,   42,   39,
> +       37,   37,   40,   41,   43,   41,   45,   45,   47,   47,
> +       48,   49,   51,   54,   55,   43,   51,   52,   54,   52,
> +       53,   48,   56,   53,   57,   58,   59,   61,   49,   71,
> +       59,   61,   60,   71,   62,   72,   56,   62,   55,   64,
> +       64,   75,   58,   72,   77,   64,   57,   60,   74,   60,
> +       67,   67,   73,   76,   73,   75,   67,   78,   74,   82,
> +       79,   78,   79,   77,   84,   80,   81,   76,   80,   83,
> +       81,   82,   83,   85,   89,   86,   84,   86,   88,   90,
> +
> +       88,   90,   91,   92,  100,   92,  104,  369,   95,  101,
> +       91,   85,   87,   87,   87,   87,   89,  138,  104,   87,
> +       87,   94,  100,   87,   87,   93,   93,   94,   93,   95,
> +      101,   93,   96,   96,  106,  107,  138,  107,   96,  102,
> +      102,  102,  102,  102,  103,  112,  102,  102,  103,  105,
> +      105,  109,  111,  109,  113,  105,  111,  120,  106,  115,
> +      115,  122,  113,  122,  367,  112,  114,  114,  114,  114,
> +      114,  115,  120,  114,  114,  116,  116,  118,  118,  121,
> +      118,  116,  117,  117,  117,  117,  117,  121,  124,  117,
> +      117,  119,  119,  119,  119,  119,  124,  127,  119,  119,
> +
> +      123,  123,  123,  123,  123,  125,  365,  123,  123,  125,
> +      126,  126,  128,  129,  129,  127,  128,  131,  131,  129,
> +      133,  134,  139,  131,  136,  136,  136,  134,  137,  136,
> +      141,  158,  143,  133,  143,  144,  144,  136,  179,  139,
> +      142,  144,  179,  137,  140,  140,  140,  140,  140,  141,
> +      158,  140,  140,  142,  146,  146,  148,  148,  149,  149,
> +      146,  150,  150,  152,  152,  148,  165,  150,  164,  152,
> +      154,  154,  156,  156,  149,  159,  154,  240,  156,  240,
> +      159,  160,  160,  162,  162,  165,  164,  160,  168,  162,
> +      167,  167,  363,  168,  169,  169,  174,  176,  176,  174,
> +
> +      169,  177,  177,  178,  178,  180,  181,  186,  186,  181,
> +      180,  182,  182,  177,  207,  178,  187,  182,  176,  184,
> +      184,  187,  207,  194,  194,  184,  188,  188,  188,  188,
> +      188,  189,  189,  188,  188,  194,  359,  189,  195,  195,
> +      196,  196,  201,  201,  206,  206,  196,  213,  201,  208,
> +      208,  214,  214,  218,  218,  208,  225,  213,  219,  219,
> +      220,  220,  225,  221,  221,  222,  222,  223,  223,  224,
> +      224,  226,  226,  220,  241,  224,  241,  226,  219,  221,
> +      222,  232,  232,  233,  233,  235,  235,  237,  249,  233,
> +      238,  235,  238,  238,  357,  237,  237,  242,  242,  247,
> +
> +      247,  250,  250,  251,  251,  247,  252,  252,  253,  254,
> +      254,  292,  249,  250,  265,  265,  253,  253,  258,  258,
> +      251,  254,  277,  252,  258,  259,  259,  274,  274,  265,
> +      292,  259,  269,  269,  269,  269,  269,  277,  284,  269,
> +      269,  278,  278,  274,  279,  283,  280,  279,  279,  280,
> +      280,  285,  284,  301,  283,  307,  278,  301,  285,  285,
> +      288,  288,  289,  289,  293,  293,  295,  295,  302,  302,
> +      293,  308,  295,  298,  298,  355,  288,  352,  307,  310,
> +      310,  298,  309,  309,  311,  302,  312,  310,  319,  319,
> +      313,  313,  311,  311,  312,  308,  313,  318,  309,  320,
> +
> +      318,  318,  320,  320,  325,  326,  327,  328,  327,  327,
> +      328,  328,  330,  338,  340,  340,  342,  340,  351,  351,
> +      351,  326,  354,  354,  325,  362,  330,  349,  347,  342,
> +      345,  338,  343,  362,  362,  372,  372,  372,  372,  373,
> +      373,  373,  374,  374,  374,  374,  375,  375,  375,  375,
> +      376,  341,  376,  376,  377,  377,  377,  377,  378,  339,
> +      378,  378,  379,  379,  379,  379,  380,  380,  336,  380,
> +      381,  381,  381,  381,  382,  334,  382,  382,  383,  383,
> +      383,  383,  384,  384,  384,  384,  385,  385,  385,  385,
> +      386,  386,  386,  386,  387,  387,  387,  387,  388,  388,
> +
> +      388,  388,  389,  333,  389,  389,  390,  390,  390,  390,
> +      391,  391,  391,  391,  392,  332,  392,  392,  393,  393,
> +      393,  393,  394,  331,  394,  394,  395,  395,  395,  395,
> +      396,  323,  396,  396,  397,  397,  397,  397,  398,  321,
> +      398,  398,  399,  399,  399,  399,  400,  305,  400,  400,
> +      401,  401,  401,  401,  402,  304,  402,  402,  403,  403,
> +      403,  403,  404,  303,  404,  404,  405,  299,  405,  405,
> +      406,  290,  406,  406,  407,  286,  407,  407,  408,  408,
> +      408,  408,  409,  409,  409,  409,  410,  281,  410,  410,
> +      411,  411,  411,  411,  412,  412,  412,  412,  413,  275,
> +
> +      413,  413,  414,  414,  414,  414,  415,  415,  415,  415,
> +      416,  416,  416,  416,  417,  417,  417,  417,  418,  418,
> +      418,  418,  419,  419,  419,  419,  420,  272,  420,  420,
> +      421,  421,  421,  421,  422,  422,  422,  422,  423,  270,
> +      423,  423,  424,  424,  424,  424,  425,  425,  425,  425,
> +      426,  426,  426,  426,  427,  268,  427,  427,  428,  428,
> +      428,  428,  429,  429,  429,  429,  430,  266,  430,  430,
> +      431,  431,  431,  431,  432,  432,  432,  432,  433,  433,
> +      433,  433,  434,  434,  434,  434,  435,  435,  435,  435,
> +      436,  436,  436,  436,  437,  437,  437,  437,  438,  438,
> +
> +      438,  438,  439,  439,  439,  439,  440,  440,  440,  440,
> +      441,  441,  441,  441,  442,  442,  442,  442,  256,  248,
> +      245,  243,  239,  231,  217,  215,  166,  110,  108,   70,
> +       36,   29,   25,   23,   17,    6,    5,    4,    3,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
> +      371,  371,  371,  371
>      } ;
>=20
>  #define YY_TRAILING_MASK 0x2000
> @@ -1160,9 +1177,17 @@ static void setbackendtype(DiskParseContext
> *dpc, const char *str) {
>      if (     !strcmp(str,"phy"))   DSET(dpc,backend,BACKEND,str,PHY);
>      else if (!strcmp(str,"tap"))   DSET(dpc,backend,BACKEND,str,TAP);
>      else if (!strcmp(str,"qdisk")) DSET(dpc,backend,BACKEND,str,QDISK);
> +    else if (!strcmp(str,"standalone"))
> DSET(dpc,backend,BACKEND,str,STANDALONE);
>      else xlu__disk_err(dpc,str,"unknown value for backendtype");
>  }
>=20
> +/* Sets ->specification from the string.  IDL should provide something f=
or
> this. */
> +static void setspecification(DiskParseContext *dpc, const char *str) {
> +    if      (!strcmp(str,"xen"))    DSET(dpc,specification,SPECIFICATION=
,str,XEN);
> +    else if (!strcmp(str,"virtio"))
> DSET(dpc,specification,SPECIFICATION,str,VIRTIO);
> +    else xlu__disk_err(dpc,str,"unknown value for specification");
> +}
> +
>  /* Sets ->colo-port from the string.  COLO need this. */
>  static void setcoloport(DiskParseContext *dpc, const char *str) {
>      int port =3D atoi(str);
> @@ -1199,9 +1224,9 @@ static int vdev_and_devtype(DiskParseContext
> *dpc, char *str) {
>  #undef DPC /* needs to be defined differently the actual lexer */
>  #define DPC ((DiskParseContext*)yyextra)
>=20
> -#line 1202 "libxlu_disk_l.c"
> +#line 1227 "libxlu_disk_l.c"
>=20
> -#line 1204 "libxlu_disk_l.c"
> +#line 1229 "libxlu_disk_l.c"
>=20
>  #define INITIAL 0
>  #define LEXERR 1
> @@ -1477,13 +1502,13 @@ YY_DECL
>  		}
>=20
>  	{
> -#line 177 "libxlu_disk_l.l"
> +#line 185 "libxlu_disk_l.l"
>=20
>=20
> -#line 180 "libxlu_disk_l.l"
> +#line 188 "libxlu_disk_l.l"
>   /*----- the scanner rules which do the parsing -----*/
>=20
> -#line 1486 "libxlu_disk_l.c"
> +#line 1511 "libxlu_disk_l.c"
>=20
>  	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is
> reached */
>  		{
> @@ -1515,14 +1540,14 @@ yy_match:
>  			while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D
> yy_current_state )
>  				{
>  				yy_current_state =3D (int)
> yy_def[yy_current_state];
> -				if ( yy_current_state >=3D 355 )
> +				if ( yy_current_state >=3D 372 )
>  					yy_c =3D yy_meta[yy_c];
>  				}
>  			yy_current_state =3D yy_nxt[yy_base[yy_current_state]
> + yy_c];
>  			*yyg->yy_state_ptr++ =3D yy_current_state;
>  			++yy_cp;
>  			}
> -		while ( yy_current_state !=3D 354 );
> +		while ( yy_current_state !=3D 371 );
>=20
>  yy_find_action:
>  		yy_current_state =3D *--yyg->yy_state_ptr;
> @@ -1572,152 +1597,158 @@ do_action:	/* This label is used only to
> access EOF actions. */
>  case 1:
>  /* rule 1 can match eol */
>  YY_RULE_SETUP
> -#line 182 "libxlu_disk_l.l"
> +#line 190 "libxlu_disk_l.l"
>  { /* ignore whitespace before parameters */ }
>  	YY_BREAK
>  /* ordinary parameters setting enums or strings */
>  case 2:
>  /* rule 2 can match eol */
>  YY_RULE_SETUP
> -#line 186 "libxlu_disk_l.l"
> +#line 194 "libxlu_disk_l.l"
>  { STRIP(','); setformat(DPC, FROMEQUALS); }
>  	YY_BREAK
>  case 3:
>  YY_RULE_SETUP
> -#line 188 "libxlu_disk_l.l"
> +#line 196 "libxlu_disk_l.l"
>  { DPC->disk->is_cdrom =3D 1; }
>  	YY_BREAK
>  case 4:
>  YY_RULE_SETUP
> -#line 189 "libxlu_disk_l.l"
> +#line 197 "libxlu_disk_l.l"
>  { DPC->disk->is_cdrom =3D 1; }
>  	YY_BREAK
>  case 5:
>  YY_RULE_SETUP
> -#line 190 "libxlu_disk_l.l"
> +#line 198 "libxlu_disk_l.l"
>  { DPC->disk->is_cdrom =3D 0; }
>  	YY_BREAK
>  case 6:
>  /* rule 6 can match eol */
>  YY_RULE_SETUP
> -#line 191 "libxlu_disk_l.l"
> +#line 199 "libxlu_disk_l.l"
>  { xlu__disk_err(DPC,yytext,"unknown value for type"); }
>  	YY_BREAK
>  case 7:
>  /* rule 7 can match eol */
>  YY_RULE_SETUP
> -#line 193 "libxlu_disk_l.l"
> +#line 201 "libxlu_disk_l.l"
>  { STRIP(','); setaccess(DPC, FROMEQUALS); }
>  	YY_BREAK
>  case 8:
>  /* rule 8 can match eol */
>  YY_RULE_SETUP
> -#line 194 "libxlu_disk_l.l"
> +#line 202 "libxlu_disk_l.l"
>  { STRIP(','); SAVESTRING("backend", backend_domname, FROMEQUALS); }
>  	YY_BREAK
>  case 9:
>  /* rule 9 can match eol */
>  YY_RULE_SETUP
> -#line 195 "libxlu_disk_l.l"
> +#line 203 "libxlu_disk_l.l"
>  { STRIP(','); setbackendtype(DPC,FROMEQUALS); }
>  	YY_BREAK
>  case 10:
>  /* rule 10 can match eol */
>  YY_RULE_SETUP
> -#line 197 "libxlu_disk_l.l"
> -{ STRIP(','); SAVESTRING("vdev", vdev, FROMEQUALS); }
> +#line 204 "libxlu_disk_l.l"
> +{ STRIP(','); setspecification(DPC,FROMEQUALS); }
>  	YY_BREAK
>  case 11:
>  /* rule 11 can match eol */
>  YY_RULE_SETUP
> -#line 198 "libxlu_disk_l.l"
> -{ STRIP(','); SAVESTRING("script", script, FROMEQUALS); }
> +#line 206 "libxlu_disk_l.l"
> +{ STRIP(','); SAVESTRING("vdev", vdev, FROMEQUALS); }
>  	YY_BREAK
>  case 12:
> +/* rule 12 can match eol */
>  YY_RULE_SETUP
> -#line 199 "libxlu_disk_l.l"
> -{ DPC->disk->direct_io_safe =3D 1; }
> +#line 207 "libxlu_disk_l.l"
> +{ STRIP(','); SAVESTRING("script", script, FROMEQUALS); }
>  	YY_BREAK
>  case 13:
>  YY_RULE_SETUP
> -#line 200 "libxlu_disk_l.l"
> -{ libxl_defbool_set(&DPC->disk->discard_enable, true); }
> +#line 208 "libxlu_disk_l.l"
> +{ DPC->disk->direct_io_safe =3D 1; }
>  	YY_BREAK
>  case 14:
>  YY_RULE_SETUP
> -#line 201 "libxlu_disk_l.l"
> -{ libxl_defbool_set(&DPC->disk->discard_enable, false); }
> +#line 209 "libxlu_disk_l.l"
> +{ libxl_defbool_set(&DPC->disk->discard_enable, true); }
>  	YY_BREAK
> -/* Note that the COLO configuration settings should be considered unstab=
le.
> -  * They may change incompatibly in future versions of Xen. */
>  case 15:
>  YY_RULE_SETUP
> -#line 204 "libxlu_disk_l.l"
> -{ libxl_defbool_set(&DPC->disk->colo_enable, true); }
> +#line 210 "libxlu_disk_l.l"
> +{ libxl_defbool_set(&DPC->disk->discard_enable, false); }
>  	YY_BREAK
> +/* Note that the COLO configuration settings should be considered unstab=
le.
> +  * They may change incompatibly in future versions of Xen. */
>  case 16:
>  YY_RULE_SETUP
> -#line 205 "libxlu_disk_l.l"
> -{ libxl_defbool_set(&DPC->disk->colo_enable, false); }
> +#line 213 "libxlu_disk_l.l"
> +{ libxl_defbool_set(&DPC->disk->colo_enable, true); }
>  	YY_BREAK
>  case 17:
> -/* rule 17 can match eol */
>  YY_RULE_SETUP
> -#line 206 "libxlu_disk_l.l"
> -{ STRIP(','); SAVESTRING("colo-host", colo_host, FROMEQUALS); }
> +#line 214 "libxlu_disk_l.l"
> +{ libxl_defbool_set(&DPC->disk->colo_enable, false); }
>  	YY_BREAK
>  case 18:
>  /* rule 18 can match eol */
>  YY_RULE_SETUP
> -#line 207 "libxlu_disk_l.l"
> -{ STRIP(','); setcoloport(DPC, FROMEQUALS); }
> +#line 215 "libxlu_disk_l.l"
> +{ STRIP(','); SAVESTRING("colo-host", colo_host, FROMEQUALS); }
>  	YY_BREAK
>  case 19:
>  /* rule 19 can match eol */
>  YY_RULE_SETUP
> -#line 208 "libxlu_disk_l.l"
> -{ STRIP(','); SAVESTRING("colo-export", colo_export, FROMEQUALS); }
> +#line 216 "libxlu_disk_l.l"
> +{ STRIP(','); setcoloport(DPC, FROMEQUALS); }
>  	YY_BREAK
>  case 20:
>  /* rule 20 can match eol */
>  YY_RULE_SETUP
> -#line 209 "libxlu_disk_l.l"
> -{ STRIP(','); SAVESTRING("active-disk", active_disk, FROMEQUALS); }
> +#line 217 "libxlu_disk_l.l"
> +{ STRIP(','); SAVESTRING("colo-export", colo_export, FROMEQUALS); }
>  	YY_BREAK
>  case 21:
>  /* rule 21 can match eol */
>  YY_RULE_SETUP
> -#line 210 "libxlu_disk_l.l"
> +#line 218 "libxlu_disk_l.l"
> +{ STRIP(','); SAVESTRING("active-disk", active_disk, FROMEQUALS); }
> +	YY_BREAK
> +case 22:
> +/* rule 22 can match eol */
> +YY_RULE_SETUP
> +#line 219 "libxlu_disk_l.l"
>  { STRIP(','); SAVESTRING("hidden-disk", hidden_disk, FROMEQUALS); }
>  	YY_BREAK
>  /* the target magic parameter, eats the rest of the string */
> -case 22:
> +case 23:
>  YY_RULE_SETUP
> -#line 214 "libxlu_disk_l.l"
> +#line 223 "libxlu_disk_l.l"
>  { STRIP(','); SAVESTRING("target", pdev_path, FROMEQUALS); }
>  	YY_BREAK
>  /* unknown parameters */
> -case 23:
> -/* rule 23 can match eol */
> +case 24:
> +/* rule 24 can match eol */
>  YY_RULE_SETUP
> -#line 218 "libxlu_disk_l.l"
> +#line 227 "libxlu_disk_l.l"
>  { xlu__disk_err(DPC,yytext,"unknown parameter"); }
>  	YY_BREAK
>  /* deprecated prefixes */
>  /* the "/.*" in these patterns ensures that they count as if they
>     * matched the whole string, so these patterns take precedence */
> -case 24:
> +case 25:
>  YY_RULE_SETUP
> -#line 225 "libxlu_disk_l.l"
> +#line 234 "libxlu_disk_l.l"
>  {
>                      STRIP(':');
>                      DPC->had_depr_prefix=3D1; DEPRECATE("use `[format=3D=
]...,'");
>                      setformat(DPC, yytext);
>                   }
>  	YY_BREAK
> -case 25:
> +case 26:
>  YY_RULE_SETUP
> -#line 231 "libxlu_disk_l.l"
> +#line 240 "libxlu_disk_l.l"
>  {
>                      char *newscript;
>                      STRIP(':');
> @@ -1731,65 +1762,65 @@ YY_RULE_SETUP
>                      free(newscript);
>                  }
>  	YY_BREAK
> -case 26:
> +case 27:
>  *yy_cp =3D yyg->yy_hold_char; /* undo effects of setting up yytext */
>  yyg->yy_c_buf_p =3D yy_cp =3D yy_bp + 8;
>  YY_DO_BEFORE_ACTION; /* set up yytext again */
>  YY_RULE_SETUP
> -#line 244 "libxlu_disk_l.l"
> +#line 253 "libxlu_disk_l.l"
>  { DPC->had_depr_prefix=3D1; DEPRECATE(0); }
>  	YY_BREAK
> -case 27:
> +case 28:
>  YY_RULE_SETUP
> -#line 245 "libxlu_disk_l.l"
> +#line 254 "libxlu_disk_l.l"
>  { DPC->had_depr_prefix=3D1; DEPRECATE(0); }
>  	YY_BREAK
> -case 28:
> +case 29:
>  *yy_cp =3D yyg->yy_hold_char; /* undo effects of setting up yytext */
>  yyg->yy_c_buf_p =3D yy_cp =3D yy_bp + 4;
>  YY_DO_BEFORE_ACTION; /* set up yytext again */
>  YY_RULE_SETUP
> -#line 246 "libxlu_disk_l.l"
> +#line 255 "libxlu_disk_l.l"
>  { DPC->had_depr_prefix=3D1; DEPRECATE(0); }
>  	YY_BREAK
> -case 29:
> +case 30:
>  *yy_cp =3D yyg->yy_hold_char; /* undo effects of setting up yytext */
>  yyg->yy_c_buf_p =3D yy_cp =3D yy_bp + 6;
>  YY_DO_BEFORE_ACTION; /* set up yytext again */
>  YY_RULE_SETUP
> -#line 247 "libxlu_disk_l.l"
> +#line 256 "libxlu_disk_l.l"
>  { DPC->had_depr_prefix=3D1; DEPRECATE(0); }
>  	YY_BREAK
> -case 30:
> +case 31:
>  *yy_cp =3D yyg->yy_hold_char; /* undo effects of setting up yytext */
>  yyg->yy_c_buf_p =3D yy_cp =3D yy_bp + 5;
>  YY_DO_BEFORE_ACTION; /* set up yytext again */
>  YY_RULE_SETUP
> -#line 248 "libxlu_disk_l.l"
> +#line 257 "libxlu_disk_l.l"
>  { DPC->had_depr_prefix=3D1; DEPRECATE(0); }
>  	YY_BREAK
> -case 31:
> +case 32:
>  *yy_cp =3D yyg->yy_hold_char; /* undo effects of setting up yytext */
>  yyg->yy_c_buf_p =3D yy_cp =3D yy_bp + 4;
>  YY_DO_BEFORE_ACTION; /* set up yytext again */
>  YY_RULE_SETUP
> -#line 249 "libxlu_disk_l.l"
> +#line 258 "libxlu_disk_l.l"
>  { DPC->had_depr_prefix=3D1; DEPRECATE(0); }
>  	YY_BREAK
> -case 32:
> -/* rule 32 can match eol */
> +case 33:
> +/* rule 33 can match eol */
>  YY_RULE_SETUP
> -#line 251 "libxlu_disk_l.l"
> +#line 260 "libxlu_disk_l.l"
>  {
>  		  xlu__disk_err(DPC,yytext,"unknown deprecated disk
> prefix");
>  		  return 0;
>  		}
>  	YY_BREAK
>  /* positional parameters */
> -case 33:
> -/* rule 33 can match eol */
> +case 34:
> +/* rule 34 can match eol */
>  YY_RULE_SETUP
> -#line 258 "libxlu_disk_l.l"
> +#line 267 "libxlu_disk_l.l"
>  {
>      STRIP(',');
>=20
> @@ -1816,27 +1847,27 @@ YY_RULE_SETUP
>      }
>  }
>  	YY_BREAK
> -case 34:
> +case 35:
>  YY_RULE_SETUP
> -#line 284 "libxlu_disk_l.l"
> +#line 293 "libxlu_disk_l.l"
>  {
>      BEGIN(LEXERR);
>      yymore();
>  }
>  	YY_BREAK
> -case 35:
> +case 36:
>  YY_RULE_SETUP
> -#line 288 "libxlu_disk_l.l"
> +#line 297 "libxlu_disk_l.l"
>  {
>      xlu__disk_err(DPC,yytext,"bad disk syntax"); return 0;
>  }
>  	YY_BREAK
> -case 36:
> +case 37:
>  YY_RULE_SETUP
> -#line 291 "libxlu_disk_l.l"
> +#line 300 "libxlu_disk_l.l"
>  YY_FATAL_ERROR( "flex scanner jammed" );
>  	YY_BREAK
> -#line 1839 "libxlu_disk_l.c"
> +#line 1870 "libxlu_disk_l.c"
>  			case YY_STATE_EOF(INITIAL):
>  			case YY_STATE_EOF(LEXERR):
>  				yyterminate();
> @@ -2104,7 +2135,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
>  		while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D
> yy_current_state )
>  			{
>  			yy_current_state =3D (int) yy_def[yy_current_state];
> -			if ( yy_current_state >=3D 355 )
> +			if ( yy_current_state >=3D 372 )
>  				yy_c =3D yy_meta[yy_c];
>  			}
>  		yy_current_state =3D yy_nxt[yy_base[yy_current_state] + yy_c];
> @@ -2128,11 +2159,11 @@ static int yy_get_next_buffer (yyscan_t
> yyscanner)
>  	while ( yy_chk[yy_base[yy_current_state] + yy_c] !=3D yy_current_state =
)
>  		{
>  		yy_current_state =3D (int) yy_def[yy_current_state];
> -		if ( yy_current_state >=3D 355 )
> +		if ( yy_current_state >=3D 372 )
>  			yy_c =3D yy_meta[yy_c];
>  		}
>  	yy_current_state =3D yy_nxt[yy_base[yy_current_state] + yy_c];
> -	yy_is_jam =3D (yy_current_state =3D=3D 354);
> +	yy_is_jam =3D (yy_current_state =3D=3D 371);
>  	if ( ! yy_is_jam )
>  		*yyg->yy_state_ptr++ =3D yy_current_state;
>=20
> @@ -2941,4 +2972,4 @@ void yyfree (void * ptr , yyscan_t yyscanner)
>=20
>  #define YYTABLES_NAME "yytables"
>=20
> -#line 291 "libxlu_disk_l.l"
> +#line 300 "libxlu_disk_l.l"
> diff --git a/tools/libs/util/libxlu_disk_l.h b/tools/libs/util/libxlu_dis=
k_l.h
> index 6abeecf279..509aad67dc 100644
> --- a/tools/libs/util/libxlu_disk_l.h
> +++ b/tools/libs/util/libxlu_disk_l.h
> @@ -694,7 +694,7 @@ extern int yylex (yyscan_t yyscanner);
>  #undef yyTABLES_NAME
>  #endif
>=20
> -#line 291 "libxlu_disk_l.l"
> +#line 300 "libxlu_disk_l.l"
>=20
>  #line 699 "libxlu_disk_l.h"
>  #undef xlu__disk_yyIN_HEADER
> diff --git a/tools/libs/util/libxlu_disk_l.l b/tools/libs/util/libxlu_dis=
k_l.l
> index 3bd639aab0..c3617f1263 100644
> --- a/tools/libs/util/libxlu_disk_l.l
> +++ b/tools/libs/util/libxlu_disk_l.l
> @@ -122,9 +122,17 @@ static void setbackendtype(DiskParseContext *dpc,
> const char *str) {
>      if (     !strcmp(str,"phy"))   DSET(dpc,backend,BACKEND,str,PHY);
>      else if (!strcmp(str,"tap"))   DSET(dpc,backend,BACKEND,str,TAP);
>      else if (!strcmp(str,"qdisk")) DSET(dpc,backend,BACKEND,str,QDISK);
> +    else if (!strcmp(str,"standalone"))
> DSET(dpc,backend,BACKEND,str,STANDALONE);
>      else xlu__disk_err(dpc,str,"unknown value for backendtype");
>  }
>=20
> +/* Sets ->specification from the string.  IDL should provide something f=
or
> this. */
> +static void setspecification(DiskParseContext *dpc, const char *str) {
> +    if      (!strcmp(str,"xen"))    DSET(dpc,specification,SPECIFICATION=
,str,XEN);
> +    else if (!strcmp(str,"virtio"))
> DSET(dpc,specification,SPECIFICATION,str,VIRTIO);
> +    else xlu__disk_err(dpc,str,"unknown value for specification");
> +}
> +
>  /* Sets ->colo-port from the string.  COLO need this. */
>  static void setcoloport(DiskParseContext *dpc, const char *str) {
>      int port =3D atoi(str);
> @@ -192,6 +200,7 @@ devtype=3D[^,]*,?
> 	{ xlu__disk_err(DPC,yytext,"unknown value for type"); }
>  access=3D[^,]*,?	{ STRIP(','); setaccess(DPC, FROMEQUALS); }
>  backend=3D[^,]*,? { STRIP(','); SAVESTRING("backend", backend_domname,
> FROMEQUALS); }
>  backendtype=3D[^,]*,? { STRIP(','); setbackendtype(DPC,FROMEQUALS); }
> +specification=3D[^,]*,? { STRIP(','); setspecification(DPC,FROMEQUALS); =
}
>=20
>  vdev=3D[^,]*,?	{ STRIP(','); SAVESTRING("vdev", vdev, FROMEQUALS); }
>  script=3D[^,]*,?	{ STRIP(','); SAVESTRING("script", script, FROMEQUALS);=
 }
> diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
> index 70eed431e4..8836c07d6b 100644
> --- a/tools/xl/xl_block.c
> +++ b/tools/xl/xl_block.c
> @@ -119,6 +119,12 @@ int main_blockdetach(int argc, char **argv)
>          fprintf(stderr, "Error: Device %s not connected.\n", argv[optind=
+1]);
>          return 1;
>      }
> +
> +    if (disk.specification =3D=3D LIBXL_DISK_SPECIFICATION_VIRTIO) {
> +        fprintf(stderr, "Hotunplug isn't supported for specification vir=
tio\n");
> +        return 1;
> +    }
> +
>      rc =3D !force ? libxl_device_disk_safe_remove(ctx, domid, &disk, 0) =
:
>          libxl_device_disk_destroy(ctx, domid, &disk, 0);
>      if (rc) {
> --
> 2.25.1


