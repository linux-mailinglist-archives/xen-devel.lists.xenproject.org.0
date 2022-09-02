Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140155AABCB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 11:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397500.638092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU3Jc-0008IQ-EQ; Fri, 02 Sep 2022 09:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397500.638092; Fri, 02 Sep 2022 09:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU3Jc-0008FZ-BN; Fri, 02 Sep 2022 09:50:20 +0000
Received: by outflank-mailman (input) for mailman id 397500;
 Fri, 02 Sep 2022 09:50:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oU3Ja-0008FN-Lc
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 09:50:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a602b908-2aa4-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 11:50:17 +0200 (CEST)
Received: from AM6P193CA0084.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::25)
 by GV2PR08MB8342.eurprd08.prod.outlook.com (2603:10a6:150:c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 09:50:10 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::82) by AM6P193CA0084.outlook.office365.com
 (2603:10a6:209:88::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Fri, 2 Sep 2022 09:50:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 09:50:08 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Fri, 02 Sep 2022 09:50:08 +0000
Received: from f3f40e4b11d2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D3E79C4-C943-49C2-B503-86D6CDBA9001.1; 
 Fri, 02 Sep 2022 09:49:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3f40e4b11d2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 09:49:57 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB5374.eurprd08.prod.outlook.com (2603:10a6:803:12f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 09:49:55 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 09:49:55 +0000
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
X-Inumbo-ID: a602b908-2aa4-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P47I17OPDL58YFHI/TIjObbz8KbIGr8gVbQrN4Nuw4rRAZbqLtiWIEo9g92DyojJRlC8fsEyw0btVPBhAaYW5qIExtKfp9MusWRCMqq7yv6utjyXz2teQ+a73fOjNLh2KwWGjjU/f9bvhsiBAlec2UVt3OYHEAw9mb0Y877hH/sBpfDHSCYJyKoLqqL5LbED369vIGYtBnGDavBVdhn6E0QdBfbzrrEbY7su8FCOgVnT6zpi0q3QNlKU19yp+qAccbeGNBSKb/2HAlThfaIS05oHjJRYnuIzneNVk9yOTdjskRqIp4CVwyLYPUw6JGKitFmNmOHyV17ec6S3wLWFEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kN00dsw7Q1aPXzVxr6unwTeTGB8aeACyZXIErFn7VtU=;
 b=BuaT8TKLpmuUOXr21k+ucVEwwfz3L83fogcifDi4+RX1wJ+9EXCdrhJcXAYwUfd7YzpCVxGGROFSFkOB0gLwOwh7I1GwxqNOhohUj56Oa4tOuWJq/gTcLeMDSNQNgfzZgBHQZ5yqSNwom69bJELPmEXv6EYX5cJ1pKYj882JcruCTJMJSHEu8jGLitKabecHq3NNjjIGACHpKH7yPbTPzXuIDmlIWbnyy7fg/lbPNLq4xHrRvl9pvMIzOvf9+ALTPaU/1FTfGnp2ebHdwkbhmhqDRRDAhhUt0WsT/iuqQYHH8CjyzDiOukQ+49+EK7K8TdNV8HoAVXy97ov/+IW5iQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN00dsw7Q1aPXzVxr6unwTeTGB8aeACyZXIErFn7VtU=;
 b=OKlglImA/US8x7ku6dERxlzkf8swgg1gDVKPuYkP2wDOp7eLR9p2h1Pneazgp61oRA6cH1+BEBCYbrsG1HboYdCUFMUZWMP837t1S8UG+gSi6VzaocJSpZZeYINRPWof47maIBquBNXzwoCFacoSlaqOmdUqzuT5+WVsuIlH0rw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0WA821INjsCm6TSSk+ZPx1eQUgRDK0N82XTWUh7UKqZY3lPUzax4TR96AvIsJLaHo0H6DPnMbslkKtg3BxAb1j+KGtFfRm1DIg9zROfb+Bj39uajUSONQYWg5IktWLqGieMmfTetIQeJXdzLm1Ntih7lLTb2YFHalz2V48DGXoi58aBIS3Kk315jEwx9OoPI+p95IpatbGpGgBZIR+mXvPo0X7vi37J3s/LhDip4s1u358cFM9BroKupycrpcbRZvJ1Q+TrsjM6/DvUnRwQf07+In+y3RncJ4gFBtQwda8WCHLIej3iorYHz44wzJ4Vw7PCsvFq2wRKPPGN6fwd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kN00dsw7Q1aPXzVxr6unwTeTGB8aeACyZXIErFn7VtU=;
 b=ilBp2Hb5dcRyj8uiaNp5ev8WnU6F6RFcow21uMF+8dNYeViTC9AMYvRIWVdIoea9zHCGhW7e5otwEyr6vwgjSBC7dWUkIZW7mOe9vOZX+MMoxsgLfnG9WsKJL4Lco6PclVODLKcKEqqYU5NlYLyDZJt7QYfkRXuvomakRpbFf9XkFzQvwonoj8xKvP1krTOmQjKgmDkY6AcM8strDyUGoAaGdAMv+zPnQx7IUDSOXGjFbBNZJmHX9RQ+012XitD3kMACHogRXVQpVlIYXnuQfRys7OaQAVbz87NWbzkG9pC2ULV7cvSsayiKLdeuBYCVPBqktguyZz725ShktV1LeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN00dsw7Q1aPXzVxr6unwTeTGB8aeACyZXIErFn7VtU=;
 b=OKlglImA/US8x7ku6dERxlzkf8swgg1gDVKPuYkP2wDOp7eLR9p2h1Pneazgp61oRA6cH1+BEBCYbrsG1HboYdCUFMUZWMP837t1S8UG+gSi6VzaocJSpZZeYINRPWof47maIBquBNXzwoCFacoSlaqOmdUqzuT5+WVsuIlH0rw=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugxTCtO4LgrkGJKD3tY8acia3KwCgAgAAJ8YCAABHIAIAABy8AgACKuYCAAA6DsIAABhiwgABTyoCAABulwA==
Date: Fri, 2 Sep 2022 09:49:55 +0000
Message-ID:
 <PAXPR08MB742050680D27FCAFBB6501A79E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2209011003570.2375071@ubuntu-linux-20-04-desktop>
 <fc0706f6-7635-6b0d-811a-c3ed41f481fc@xen.org>
 <alpine.DEB.2.22.394.2209011849040.3931@ubuntu-linux-20-04-desktop>
 <PAXPR08MB74203A415B8F56B83B20B7739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB74206D3DB72C207F1E2EC2739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <ba62b094-d187-8a61-5e7d-e5d3d592ce42@xen.org>
In-Reply-To: <ba62b094-d187-8a61-5e7d-e5d3d592ce42@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8A1F362F7119C74FB5DDD455F7C4772F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7095f473-fb0c-4c7c-3bfa-08da8cc8859c
x-ms-traffictypediagnostic:
	VI1PR08MB5374:EE_|AM7EUR03FT036:EE_|GV2PR08MB8342:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lW2zGU1iiSNTcY6B2myIksvB76n8LNsx3O59g+Pw/zj/Qz5tQkjgWwgSd9FIOSthmuIyvrLoWSfNX3TaUT5xUa5dirkqWYf1pWZBHjdnIXf/G2jiebPVWf8XV3uQ2Y/d4EkEt8sfr2i3NxYnQa0Syh59YXziX7fJ8IAdERarOAfVnQMLm0fBXiUEm+cnqY3+sTkqrd9wE+GOuqeWuqGgrven0JFCHez3wg9JyH1cF+BPz5LqhXch1zcx8EvDuboTWYEcjtLXsxbarECq9RyaIPku/qT/K1E6nCBcvA5+D7R+ijLtGgICPmqUBv7WaH9Tc62YU5FSirEXIavbsDf5YZRdJ4AuPbziX580vC3syoX1UvLggmhq68Z5orWxNfuwssTjpKBxw8I5rEiBpzKwvNOke00vFHV4WjYtMlmuyydt24psgeCAKtLh/skT88bSKrJP9L29SVPKQqXyoJWmRVVgquJVS5UAhxbjLLjw6Xm12nM2/HPLp7SdBEvtvN+0MLRvNRiD+m9xJ7faoIC+6Omwz5XJTzWCx0Za6l6TT4Llyvh4mRMPAwoo1v+n2uObhf8TrYlO++t9FY4rY91ncZZWUqXAz0SJ5ZCsirJg8ZnNUyJFdUnZ8O0Z4NyrwbCHzGIkXmzf4n96WJv31ua7lifrdguJ7+5kt79v/w+nHKW3yY9nWgYs4uXp0ICXrzh9aGdrdHpgyT3JVCXnEL/aY92RGEgsmMGm7QG4Gk5NoJCHPekSYzISlMCvmlnC2nESzW6FebFTnVWb+gsvueoszQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(122000001)(38070700005)(86362001)(316002)(38100700002)(2906002)(54906003)(8936002)(110136005)(52536014)(66556008)(66446008)(76116006)(8676002)(64756008)(4326008)(5660300002)(66476007)(66946007)(71200400001)(83380400001)(478600001)(186003)(53546011)(41300700001)(7696005)(6506007)(9686003)(55016003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5374
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f82eb9ae-5279-4747-aa7b-08da8cc87d72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPL3wcRJAg/9bTsgMLRBXRszCIvu1xbtZ3v+FqY6qGx0fT65uFScR3S1nbf+RUD1vPqTF6VUYFUcnZs3P+qjEKDjqrvcnOUKhoiPIyh0m4hLRTVyDtv+bEpQ0R3tFPV5guBH3x3t4ojrmumsYugN6Vul9tmHqZd2KgJe3+xofXy3i0kKygzhwJK2DoIKkLOJ6dO8DF5bLMUqNBXQLn1BdoQTg5oh5pLIh2roJa53ZrTX8/gl3NSIUk39ljSzz6mckR7zxrm1KMSZo7qkJQKPu3T8aJ0RCz9n1WOuYFOa8QKqDfk1KznrbHORtEEvXqIbu8RMnbw9L/HQmdEB0/ob8MK/A4+M8J3z5tnCMVxXmAIcOvFBc/wBFKiBMAKmMsmkbadMwQ9Nfd4DzQwgfpziWLmfOodKXQEgIoSItBlCgz4SwDJTch5oH5/6F3/UauluNzg94LV3W7QifnjJ3TvAQmpMiLpOP7sdj11nUbwibzJF/47QaCh6JRyoW37iglVMtSKyHYFv9iTK0A3W1I2Mu6xDD4ioUe4/BvyYiRyQaXqZfndKe3OX8ep6Vqm3QkvnN/bIy5FSRo8uARbdTeaPsBUD/Van9NNG7YaRpvlotXf1f1XqXxT8Y6e4kiSbYVBF+/HYazUGVkQW+Bb3RTAoTLxoabiY40ilJk7xipzPMbdxXy9gMDKx5sVOcooBARUmhO1fzq/REoUb18BInjTtOVBCNLPNtjNBNyQTnas5KNy3qr3NWr+Y1Cxvhl4lWLr1WEqGi30rGfIzV8L4VewW8A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(2906002)(82740400003)(107886003)(52536014)(8936002)(86362001)(54906003)(110136005)(40460700003)(81166007)(356005)(47076005)(336012)(316002)(186003)(26005)(70206006)(70586007)(8676002)(6506007)(7696005)(53546011)(9686003)(36860700001)(478600001)(82310400005)(4326008)(5660300002)(41300700001)(55016003)(83380400001)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 09:50:08.8834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7095f473-fb0c-4c7c-3bfa-08da8cc8859c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8342

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQ55pyIMuaXpSAxNjowNQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFy
bS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xv
ZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIHhlbi9h
cm06IEhhbmRsZSByZXNlcnZlZCBoZWFwIHBhZ2VzIGluIGJvb3QgYW5kDQo+IGhlYXAgYWxsb2Nh
dG9yDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAwMi8wOS8yMDIyIDA0OjA3LCBXZWkgQ2hlbiB3
cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZy
b206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9u
IEJlaGFsZiBPZg0KPiBXZWkNCj4gPj4gQ2hlbg0KPiA+PiBTZW50OiAyMDIy5bm0OeaciDLml6Ug
MTE6MDMNCj4gPj4gVG86IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IEp1bGllbiBHcmFsbA0KPiA+PiA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IENjOiBIZW5yeSBX
YW5nIDxIZW5yeS5XYW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
DQo+ID4+IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9k
eW15ciBCYWJjaHVrDQo+ID4+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gPj4gU3Vi
amVjdDogUkU6IFtQQVRDSCAyLzJdIHhlbi9hcm06IEhhbmRsZSByZXNlcnZlZCBoZWFwIHBhZ2Vz
IGluIGJvb3QNCj4gYW5kDQo+ID4+IGhlYXAgYWxsb2NhdG9yDQo+ID4+DQo+ID4+IEhpIEp1bGll
biBhbmQgU3RlZmFubywNCj4gPj4NCj4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+PiBGcm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+
ID4+PiBTZW50OiAyMDIy5bm0OeaciDLml6UgOTo1MQ0KPiA+Pj4gVG86IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+DQo+ID4+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgSGVucnkgV2FuZw0KPiA+Pj4gPEhlbnJ5LldhbmdAYXJtLmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQmVydHJhbmQgTWFycXVpcw0KPiA+Pj4gPEJl
cnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgVm9s
b2R5bXlyDQo+ID4+IEJhYmNodWsNCj4gPj4+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4N
Cj4gPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSB4ZW4vYXJtOiBIYW5kbGUgcmVzZXJ2ZWQg
aGVhcCBwYWdlcyBpbiBib290DQo+IGFuZA0KPiA+Pj4gaGVhcCBhbGxvY2F0b3INCj4gPj4+DQo+
ID4+PiBPbiBUaHUsIDEgU2VwIDIwMjIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPj4+PiBIaSBT
dGVmYW5vLA0KPiA+Pj4NCj4gPj4NCj4gPj4+IEluIGFueSBjYXNlLCBJIHRoaW5rIHdlIGNhbiBw
b3N0cG9uZSB0byBhZnRlciB0aGUgcmVsZWFzZS4NCj4gPg0KPiA+IE1heWJlIHdlIGNhbiBhZGQg
c29tZSBub3RlcyB0byBzYXkgdGhhdCB0aGlzIGZlYXR1cmUgaXMgc3RpbGwNCj4gPiBleHBlcmlt
ZW50YWwgaW4gRUZJICsgRFRTIGJvb3Q/DQo+IA0KPiBXaHkgRUZJICsgRFRTIG9ubHk/IFJlZ2Fy
ZGxlc3MgdGhlIGRpc2N1c3Npb24gYWJvdXQgaG93IHRvIHByb3Blcmx5DQo+IGNoZWNraW5nIHRo
ZSByZWdpb24sIEkgdGhpbmsgdGhpcyB3YW50cyB0byBiZSBhIHRlY2ggcHJldmlldy4NCj4gDQoN
CkkgaGFkIHRob3VnaHQgc29tZXRoaW5nIGxpa2UgdWJvb3QgKyBkdHMgd2lsbCBub3QgaGF2ZSBy
ZXNlcnZlZCBtZW1vcnkNCnJlZ2lvbnMgbGlrZSBFRkkgcnVudGltZSBzZXJ2aWNlcy4gQnV0IEkg
Zm9yZ290IHVib290IGFsc28gd2lsbCBoYXZlDQpzb21lIGFkZHJlc3MgdG8gbG9hZCBYZW4gYW5k
IERUQi4gSW4gdGhpcyBjYXNlLCBYZW4gc3RpbGwgbmVlZCB0byBjaGVjaw0KcmVsb2NhdGlvbiBh
ZGRyZXNzZXMgd2l0aCBzdGF0aWMgaGVhcC4gU28geW91J3JlIHJpZ2h0LCBJIGFncmVlIHdpdGgg
eW91Lg0KDQpDaGVlcnMsDQpXZWkgQ2hlbi4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxp
ZW4gR3JhbGwNCg==

