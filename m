Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC85736A9E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551672.861302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZJE-0001JK-1H; Tue, 20 Jun 2023 11:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551672.861302; Tue, 20 Jun 2023 11:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZJD-0001HA-UP; Tue, 20 Jun 2023 11:14:03 +0000
Received: by outflank-mailman (input) for mailman id 551672;
 Tue, 20 Jun 2023 11:14:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2irc=CI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qBZJC-0001H0-HM
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:14:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e432810-0f5b-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 13:14:00 +0200 (CEST)
Received: from DB6P18901CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::22)
 by PAWPR08MB10212.eurprd08.prod.outlook.com (2603:10a6:102:369::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 11:13:58 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::cf) by DB6P18901CA0012.outlook.office365.com
 (2603:10a6:4:16::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36 via Frontend
 Transport; Tue, 20 Jun 2023 11:13:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 11:13:56 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Tue, 20 Jun 2023 11:13:55 +0000
Received: from 71031b2fac19.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6334824-439D-44F0-9507-6DF32C30E476.1; 
 Tue, 20 Jun 2023 11:13:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71031b2fac19.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 11:13:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB3PR08MB9088.eurprd08.prod.outlook.com (2603:10a6:10:430::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 11:13:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 11:13:41 +0000
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
X-Inumbo-ID: 8e432810-0f5b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZef6VQ5OMKe2lFfqTjtfZn035cXlTUU857V3XnbV2Y=;
 b=JMukm2e/ko8vsFpu+DhiqAwm7x1gQI4jCqbN3Rla8ACyubHr+J8ItJO4mdZS/zbCrHRbqLt+h3EWO+I4Vm4GAyBbtb7isf7WRC++wUyMBS2Ee8Bv/L6mMqPZxilv8OedunDC5VP3H+R9dAaJ/h7ZOZLFSfhmKxY8hgPWuVOisVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 720f4e16c8e119b9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Unpcmal/VfkT1aGB2JcyS4gT/m7KRfljdzIS9qYtgWXetlypjoa6ADyxX8SWDC90bvSu1H8Nj4S0HJ2Ka/fx3yMxPIsYr31xPyiDwVVC+yqAqX9oK276XwmvSYeXdPEcpsa2H5LyKov0+ujruWx69Rcu10OiFhx33u4qkWLI56/F8ESIfifo6fKSNbhY3iUgY+4Xvm2QqmYCKxKMOKKdBx6Vn8UwTkhxhSN0wX7IPjimZn8Eot+r+AaTRYqrezKplY5UG93YXLZBnHG5nDRZIhsf8FK6hgLm9kBR7cKTJ7e+pq4ScO3pU3/9GMPlxzsJHfUdaQ9fSXcTVLQmRmvkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZef6VQ5OMKe2lFfqTjtfZn035cXlTUU857V3XnbV2Y=;
 b=F9CQG79yYnagfjfZFbYaLENSGgX/SxGz7ShaoE2LBf4H8VpQx8awPRE3MFU+yFa5GtCK0SqN1HUKBYJaGPoBPKO4/Vtzh0EUqKx9CWiev7vuM5f2NO3ua28P2kSAk+TGuk5JvbCPBt0Qy1kyTjK15PARsQjwSkMFtHoSXNziXleiotoAwRcnHf8lKNzYezvx3JBsZ287hQcy5jPc+BWlegyG3Lcru2pkscVzczzS8zTZYHYcpfY08p9yynBY5HP2/7AdQvUMB4KKAbOwPAg2uN+fpgpIJQ1hdQsrcasiX/TkfpWYBz0ifww76wOLtaY+LSXRVKGkyXplq4MPZe4yAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZef6VQ5OMKe2lFfqTjtfZn035cXlTUU857V3XnbV2Y=;
 b=JMukm2e/ko8vsFpu+DhiqAwm7x1gQI4jCqbN3Rla8ACyubHr+J8ItJO4mdZS/zbCrHRbqLt+h3EWO+I4Vm4GAyBbtb7isf7WRC++wUyMBS2Ee8Bv/L6mMqPZxilv8OedunDC5VP3H+R9dAaJ/h7ZOZLFSfhmKxY8hgPWuVOisVw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/7] xen/arm32: head: Add mising isb in
 switch_to_runtime_mapping()
Thread-Topic: [PATCH 2/7] xen/arm32: head: Add mising isb in
 switch_to_runtime_mapping()
Thread-Index: AQHZos+1Ygxb/Hk/1UKuP2FBGOpYia+Tit6A
Date: Tue, 20 Jun 2023 11:13:41 +0000
Message-ID: <2449DACD-EE89-4439-841A-79206838EFEC@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-3-julien@xen.org>
In-Reply-To: <20230619170115.81398-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB3PR08MB9088:EE_|DBAEUR03FT033:EE_|PAWPR08MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: c747f4ef-4ce2-4195-a41e-08db717f703f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CXFOelg6j1wIcIiEwpnxDpqOj80/Wl9PY+z1zaJOy7y7Lcc+TZOQkcs5bthdmlj62zEbIOHh+SwKM640L5jdypuHvXTifqCJplCsGykN0Oc9pfw+m7AotmXg/J0Fq40B95Qx19Pa8dOPoVPD6giXp0eSbbE85A7aznDkOIsB0oMQp/3Sp3F4jpAefzkEG8azuTYDuO26NOnXDW8Ndbyc7rqn9909WFcUoU9otAJwrnUyBAge3C46MzicbDPeCw6NsrziXoxg975xXlludY3VcxPvGZ/dGk7xMuyS8XlhljpzurGdxbqvWLO22Em2Ft09Oc0XXkKBpiKkBk6udMG83WAfH41aOdr2ZpCKb/xxsXLdnRnjd8mchwW+u/yPqHNeO+JL2OgXvj0KEZ0yx35uexO5GjqWyjYXNcwfcZphqDeRzAiP3txAgt/PjkebvSGkASAa13bgWX39brHQVvdgt3dOco8iUrOxYcVKgKsI57VVfb6gsdB7hWZDJBcKUSVRelHz75l26NZuZM9GhQZc6hx8gEr+wAP6Ya+jwdMLgrT3yWXX3qWXIWTF4XmcRWc/9rYXaIGFNlyTApYDya+ttoojHEPrgi2SJHh4wRCR0pXP9uM9+hm5ClyiDE6h8O7He3ytcLgXUV5YqD12hTpNHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199021)(2906002)(4744005)(6512007)(6506007)(26005)(2616005)(186003)(53546011)(6486002)(91956017)(76116006)(66946007)(8676002)(8936002)(66556008)(66476007)(66446008)(41300700001)(316002)(64756008)(4326008)(6916009)(478600001)(71200400001)(54906003)(5660300002)(38100700002)(122000001)(36756003)(33656002)(38070700005)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <24561E8E8E8F074787DE6CE2E3A11F5B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9088
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	790e9337-27d0-45c7-ee2a-08db717f67c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s708oH19Rgg/1oWrfmnoWhKertTx7JYgR5fo04j0ZKRVZbXhezZA6bQyk6mbSSRIPon/ip2y0sbZZT+6FJxQKCwUjMvuC4SvV+9sYq3G/hoD6eyI6xymHPCoEqjDIV7JgjPKx5BEOLOVLE5ZGeFjpu6T1EVwyVXqSOWDhDJ+oA5XMJyp6iv39fq+pb3ab3CeiF8bT8dF/Y5eRruy3s7b4OOwEoRN8abY6TOFSZQhmnADyt4R3E5oCWmDD8t+Ds6a7O614qqC7cqbh0CtvxIKSlFwGg008siwB42WN8D3oyDnXTB87R0vUnE8Q5I3U9heOSPeuWR64WOIOYazSeh/TuHFCYKO90bWqTK+uPnYPdWi/4nNh6vpbz/eHwb3Izo+iWgSTq58Hz4YvqYG65qDIEukz6jUGZEIo2JIPm7f2jxl3oUVjuZYi+ijvlC1nkE83M6F45c1jtCvmyUnZQSYDi02r2J19DCoPpa4oBS2jgIMmNeCdcQZeDFzo+LnFkPuWU+udcR0HWpGxcMjuQjlXYx+gRDeGaRjwdw6dsWd/iWogOCCjlZ3vn05msO4QwFnNtwygKc3IPEGJfxbDmmRpvmFcIS+fNifTDYU9N2/ItmkyX0J8QMai0gvJ/BexhBtkt7izhxyIymc76y3i8TgWboDHEgY0akX4ekvGCSssNko3AIfc+1kecLWkT1z2C9t1IroHBGHp95ITJifEXQtLXdtYWfYd5SuwEPqiocBL1wL4uSOrcJN32XHTKMQ+xGv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(81166007)(356005)(336012)(107886003)(2616005)(86362001)(47076005)(4744005)(2906002)(36860700001)(83380400001)(82740400003)(5660300002)(40460700003)(54906003)(6862004)(8936002)(186003)(70586007)(8676002)(70206006)(36756003)(26005)(41300700001)(478600001)(4326008)(40480700001)(6506007)(6512007)(53546011)(6486002)(82310400005)(316002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 11:13:56.0748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c747f4ef-4ce2-4195-a41e-08db717f703f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10212



> On 19 Jun 2023, at 18:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm (ARM DDI 0406C.d A3.8.3):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> The function switch_to_runtime_mapping() is responsible to map the
> Xen at its runtime address if we were using the temporary area before
> jumping returning using a runtime address. So we need to ensure the
> 'dsb' has completed before continuing. Therefore add an 'isb'.
>=20
> Fixes: fbd9b5fb4c26 ("xen/arm32: head: Remove restriction where to load X=
en")
> Signed-off-by: Julien Grall <jgrall@amazon.com>


Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



