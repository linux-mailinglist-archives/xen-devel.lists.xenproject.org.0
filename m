Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16316FFED6
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 04:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533671.830510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxINz-0002RV-5F; Fri, 12 May 2023 02:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533671.830510; Fri, 12 May 2023 02:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxINz-0002OF-0Y; Fri, 12 May 2023 02:19:59 +0000
Received: by outflank-mailman (input) for mailman id 533671;
 Fri, 12 May 2023 02:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yer8=BB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pxINx-0002O9-4g
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 02:19:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe12::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aed6275-f06b-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 04:19:53 +0200 (CEST)
Received: from AS9PR05CA0213.eurprd05.prod.outlook.com (2603:10a6:20b:494::9)
 by DU2PR08MB7344.eurprd08.prod.outlook.com (2603:10a6:10:2f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Fri, 12 May
 2023 02:19:50 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:494:cafe::57) by AS9PR05CA0213.outlook.office365.com
 (2603:10a6:20b:494::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23 via Frontend
 Transport; Fri, 12 May 2023 02:19:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.22 via Frontend Transport; Fri, 12 May 2023 02:19:49 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Fri, 12 May 2023 02:19:49 +0000
Received: from ee0fe7d44566.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C687C4F-BEBC-48C5-AB41-AC6C5C238C7A.1; 
 Fri, 12 May 2023 02:19:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee0fe7d44566.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 May 2023 02:19:43 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by DB4PR08MB8031.eurprd08.prod.outlook.com (2603:10a6:10:389::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Fri, 12 May
 2023 02:19:39 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::b95e:f68f:2747:5b86]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::b95e:f68f:2747:5b86%5]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 02:19:39 +0000
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
X-Inumbo-ID: 7aed6275-f06b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/S0Jvd4rp5+8PVqjVmxESGkBJPv236sH7HvXuetmgE=;
 b=tOtTvb7ORrAaEOC7wVijs3Klj52WI5Yc5gjMdusJkpvGzsXfuJ00vppNj2DY6mKcDdOVtqvgCEm9Nen8+mDBb4KWiL7OVS9cWyyDPR4M1sAYKdP0Isw7fwYQZCcmgaessdUp/lHbNQGFoPV3WYIdSWjOUOC6vmN9yWYeSD4/Gug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzB6kl1CXd9QnG2pZ2izSew89MfGLF2js8k/RtXgT7QX5iyUMFq4Kz/UP8Ao+wxwshMNDUGQwHKufgrdU26vuiwfLcnTpMwLjPY+IF2AdlvxTDPgGjP5FygXc4FwCMVTgApKc4eVGlTGeGnDfVtnd6/WEgTZ43p9xl4JpFrUW6I9mMVYENmw236vypZwyf30v/aDmzqPTy92+EezDpYvvTJUazENNksTN0eLoQ/499pFwxZwh8dEf9Ip7kks62wPoEwO94vo9MSUknvbQlVz7aqrC4Qu3cv9LGf9H8HYWGml6elYyZhLSlWNkV1o4P7eTdF+nkJ5khGPw8KCqbsNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/S0Jvd4rp5+8PVqjVmxESGkBJPv236sH7HvXuetmgE=;
 b=iTWjGUMP/Vy5Y/AC0YyT77RCCqDkWWBvqEu304HcmOWVBJ8QHAqiRxWMBqWDA3lWTZ3gev2IpSsKrv+K1mpX0rjG2DDXAAtsn8CkEe7rWFAYH8k8F/RxwX7U334ijxh8lUj4N6dZK32oeC/ydVW1Eqlx2uvOrzLi8JF1UezdGCeLNqokeKimw577EsW3anqJDYohCkAJtq6i0sS4Lr55W/F58XsqCJ2iZ2PdhIXNEkQzj5bEoHQkLe22A7Y1Mq8binG3i0asNvlBtuPSCtJHFeCUl2oX+CAIODlMYJKbRdWuyBqUeTeHP+gqeQjNjqovBXFO7GaV28i+xH+6l2rq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/S0Jvd4rp5+8PVqjVmxESGkBJPv236sH7HvXuetmgE=;
 b=tOtTvb7ORrAaEOC7wVijs3Klj52WI5Yc5gjMdusJkpvGzsXfuJ00vppNj2DY6mKcDdOVtqvgCEm9Nen8+mDBb4KWiL7OVS9cWyyDPR4M1sAYKdP0Isw7fwYQZCcmgaessdUp/lHbNQGFoPV3WYIdSWjOUOC6vmN9yWYeSD4/Gug=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 1/2] xen/arm: domain_build: Propagate return code of
 map_irq_to_domain()
Thread-Topic: [PATCH v2 1/2] xen/arm: domain_build: Propagate return code of
 map_irq_to_domain()
Thread-Index: AQHZhAjs3jiwxpILn0CHXeAkKfqtgq9V5/uA
Date: Fri, 12 May 2023 02:19:38 +0000
Message-ID:
 <GV2PR08MB80014689EBF579A9288481E492759@GV2PR08MB8001.eurprd08.prod.outlook.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
 <20230511130218.22606-2-michal.orzel@amd.com>
In-Reply-To: <20230511130218.22606-2-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 753080E4E6FF1347ABECCB3E4C8836AE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|DB4PR08MB8031:EE_|AM7EUR03FT031:EE_|DU2PR08MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7f32c5-b519-4649-64c2-08db528f5cf8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uf2BEmjUFY2YgMztHqq3J+m+5Ie1mRsgFL2jJ2nch7HjUhIIBlHsddC2AaacQQBK+bpQ7gD06n5LJN/fDZMZyWX+lKyS4zFuOB997broYN1htkx6hjPLwZdHSk4Vh4n9/DKIHrnWk7HCjnECsWhcCQ7oGG/plXRiMUnPPMfPqRnbx415bi7D29H2tAoxbxj0Ao8fZ9IofwH7HW+4EreNsKv8bTV3jRQFG+kY8lRs8gSV+PnlcXwjlrk6L3QSJvP7MRPM9IvMOonoz5vJ3LjhV236UpxtbI7lS3ko9TWwCShORF0LFx07llJBFF1h9WNpI22j+2KBKyC9C6nVFh1Qat48OyJOzsbWMAv+OboSP22adfqzi7L0z25SxpSC/jpJ+Ig8ZPaL59J4bmI456admu4/dnqtGtniVPxYvinQWM+PADjgkqUWrc9+rtuatw0RY6NWHspsmGwKp6gqr1RQFdCuQDZyyDHenbVm+432JR6WH4bB7kj4T+egaKUy3I+7a4P/xRcipvoN8ea/W17XlY0tA6ExxOGT6nzPvD3zvqNzmCVoSu6rJCinGjijojjs0NIOWnZJJwL/UR765HBFVKCZDs+IuYXs9wieZCLtrzXhCt4VguboPJNoKoeUKEOF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199021)(83380400001)(52536014)(71200400001)(478600001)(33656002)(186003)(55016003)(6506007)(26005)(9686003)(7696005)(122000001)(66476007)(66556008)(64756008)(2906002)(38100700002)(76116006)(66946007)(5660300002)(86362001)(4326008)(66446008)(41300700001)(38070700005)(8676002)(8936002)(316002)(4744005)(110136005)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8031
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7010c85b-1677-4cd2-cbd9-08db528f5694
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GJ+Iw8xSq6hzl1JJqXwXHGTtouJcbtgejNah+2JTQhIXtxscOv8ea7/d5zUNuUfQLKMe34z9iWk6eSra25k54unTD8TSjOOASfbS6vApwDfSI0lYCCHeMyA7OWFvuPXBm7nT+Z1imvezSgFGZd3TBHdfM3Y738IR5RLPKsM0LRAPCSh9Aia24qe/QE6xpQSkQyHisNU3OBhx71o4qTpDENXR/2VbEnS5hzeFmczdwRDf0i3FK0K6UdsphvHTTcKMZw9fWot3VIOG9Sf8QJk5cBORuopn2QUTN/yiJfc1uJ0vogGlWQZ4fjEZFAvstmIQ6IjYrHYav7UeNKzGSvN4oWY/8p17zpZKbv5eMtIrSbvSNsSWmZXR0Iviyw45uQVQ++z8J5PKMj6vI+sNkHafp+kdf+L1vzDfoEOWCQ4rRd3CIW3DRJW/rDZ/t9eVqQ5lkJiJFZpVmZ1UlvihJh9A2Plb5dO9CWxRUPXnHo8hATUH1pRwYvi/hpBMQhrkcEwXOBNGY8XVqk4zrC4Hnv0XHcMTFhv+CKuXTipV3WpzzuXkrCiOMXjnKSXhntFEx46iWuebcB+oSNcpYZ9UepyUt85MrcJ2ljVn6t5JgWxqA+ue/7Va8MUUA4EFCsUDahLxe2L8D/kX2PQ2bt1Ey9tfAZ5hY0MWEuNIjK5Y3nJZHgRuhyu4H7BXaiG+cXStaJ6LwTlodnKAsqzM+pCL/cA3dQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(4744005)(83380400001)(6506007)(5660300002)(33656002)(2906002)(8676002)(82310400005)(316002)(40480700001)(7696005)(40460700003)(110136005)(52536014)(41300700001)(4326008)(478600001)(55016003)(70586007)(54906003)(70206006)(47076005)(107886003)(9686003)(8936002)(186003)(82740400003)(336012)(81166007)(356005)(36860700001)(86362001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 02:19:49.6015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7f32c5-b519-4649-64c2-08db528f5cf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7344

Hi Michal,

> -----Original Message-----
> Subject: [PATCH v2 1/2] xen/arm: domain_build: Propagate return code of
> map_irq_to_domain()
>=20
> From map_dt_irq_to_domain() we are assigning a return code of
> map_irq_to_domain() to a variable without checking it for an error.
> Fix it by propagating the return code directly since this is the last
> call.
>=20
> Fixes: 467e5cbb2ffc ("xen: arm: consolidate mmio and irq mapping to dom0"=
)
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

