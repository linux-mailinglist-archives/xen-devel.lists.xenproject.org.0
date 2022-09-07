Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E915B058F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401775.643714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvMW-0006jt-4k; Wed, 07 Sep 2022 13:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401775.643714; Wed, 07 Sep 2022 13:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvMW-0006hO-0y; Wed, 07 Sep 2022 13:45:04 +0000
Received: by outflank-mailman (input) for mailman id 401775;
 Wed, 07 Sep 2022 13:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVvMU-0006gr-PE
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:45:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4534bfd5-2eb3-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 15:45:01 +0200 (CEST)
Received: from DUZPR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::10) by DB9PR08MB6569.eurprd08.prod.outlook.com
 (2603:10a6:10:261::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 13:44:59 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::27) by DUZPR01CA0034.outlook.office365.com
 (2603:10a6:10:468::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 13:44:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:44:59 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 07 Sep 2022 13:44:59 +0000
Received: from 06637736a112.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A338F6EB-4549-4AB7-8BDA-83692F364561.1; 
 Wed, 07 Sep 2022 13:44:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06637736a112.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:44:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6226.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 13:44:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:44:45 +0000
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
X-Inumbo-ID: 4534bfd5-2eb3-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NGZiZQqbzkPrNT/ey0eOJkZyQ5ZNK+Z2kyAzbZzAQ2EsnmbgW9IQo8TkffV0VrW2POUGHXX6Bc+HPKlOznItH0Fx6nHe50g/Ggc5xucdNV0A5zP+/CoXpZG48TkwfQHOu7CbIMtmTBgR47PLEhX5MdkAy02L/DBcYnCqK28bCUrOetiOAMNKZwAmO8KIhi6OWVVUjHX5dh9/dHMf9LJrCsFKCC2NTkIb9Xt9Yb3amNNLg5QZ/nFINwwoRKtdIjm2k3Yh64Obb4CpSw622sswksk7pdCW+xKyl5kXm/g5OXnZuLkguyj3LeOOT7f/Jecska5c2O7IlKXHeFTpnYwd4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j25tiPsdsXNHomxeLxXo9OlsoEPikY86vTAHnwE+4E=;
 b=bfUi/xdyPn1RoJk3i0/Hb/WqdXtbNIeGpNs5F30d0VlMfPyfYnWqXngt3b9BTOSUAXIJ5X7yWjic+3GDZF3M9i9JDwVlY46loXs6h2aCKTimgW5JJqdJ4lKJCfU7I1zy+9J5SNIxrbigwA52JwLReBElHnil3oYNh2TZRfuTe8Ek5LG0dBF9kEggoyF/gnjH3cfOJVvoqdRO5NCvjrmM6K92XUGqfKHd1jGscLDCdLmVgxOjB05Nkdp2BS6SfwQjHVHY7X1VoyyGWKW3OMKC8XPBBw+u5tdWpHD4Jc3aricwGY7RCKgwlFgxJosD/nYs0Eruz2v0JeolggXeeltBeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j25tiPsdsXNHomxeLxXo9OlsoEPikY86vTAHnwE+4E=;
 b=Sv/zHRwEYFEE/wUef1TX7QyQNKnS9obiTHjhDME4MDBWqYDZuQN2X36ZMOJ/yOpR9PfcqdvwW9VVO5WoE3m0n1qAWv7anXkmUGTELiSsEF1fDx4+qxu31v6PJJxviii57fw6z+BsfyYz7FI1oWDv4Qu4tDuiMMgUEQphBdjS1RU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ab872eb452a960b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4Xfjq6PqzNudr6Jid9cGs6/Yqv+IZN7EMUXjEbpOUhpvl7i+rfKHjSKsNgqFQ0K/0MjDiejEfdLd/z23WKM8520vm1XumfSBBUt7HOj/7RBYu+AgbwhDXviL9VMU6SLz4fv67W3QZnL3MS63L0kQLjKQRvswKmNFgbYiAVl2Wa6kxd7h6Gcn7TpO8xeF4b26oGKVPukyC0mIwQx2VQwF0+9r+C3t4WhAlxZGPq6nur0r6n6Byc8cDUYZq/Elq1yTNEWG0wi4gJUTkRysNrKZYqn+PV08RHz6z5ilMfvKiAwm6NkpQ6lYYwq+zxQkmEHO3acbv+fTYCPlAZKtr9IiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j25tiPsdsXNHomxeLxXo9OlsoEPikY86vTAHnwE+4E=;
 b=X+24RWPu2T4PBiDbYPFvyIP5Ocbd1nVE4CoSEYPoBIAfjOq3o2RLv23yjn6voDJ1NsTSGJ+dzWxUXZ8XTSC9JhQSKwrnOn3CDkt3p7XGEeam6driyuuC+4F66lhRCHYJLq60Iiv6fn7NffTnj+LEmx7CICwBD1BNcXWmbexB5B/wbcNLRueUMOMEtXPG0a+vQOTyHuEuAd9VFaooBJdZl1o90t3IyiEUj00DJM2gdrLhRAk02lsBShKuZq7OHB/WDkiYAD7PH3h5n3Q/i143Yw0rp/KuUA8wkP9PqDUEEcEb5SdrH2VLGfqb59DfsOwVdzL9EfkffVOdikBJ0is8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j25tiPsdsXNHomxeLxXo9OlsoEPikY86vTAHnwE+4E=;
 b=Sv/zHRwEYFEE/wUef1TX7QyQNKnS9obiTHjhDME4MDBWqYDZuQN2X36ZMOJ/yOpR9PfcqdvwW9VVO5WoE3m0n1qAWv7anXkmUGTELiSsEF1fDx4+qxu31v6PJJxviii57fw6z+BsfyYz7FI1oWDv4Qu4tDuiMMgUEQphBdjS1RU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ4p6pfICa8EGhkwL2mg6iHK3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCAgAAA4QCAAAD+gIAAApQA
Date: Wed, 7 Sep 2022 13:44:45 +0000
Message-ID: <D7097F10-C3AC-476B-BB5C-D071A0E2CD2C@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <AS8PR08MB7991D68A6A20B3106243BE9992419@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991D68A6A20B3106243BE9992419@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 96bb898b-07ef-4f6e-c2bf-08da90d7282f
x-ms-traffictypediagnostic:
	AM9PR08MB6226:EE_|DBAEUR03FT023:EE_|DB9PR08MB6569:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tAd14XOzCswLaoGcCFVEsSd7KNGszTCmrdgRY2NZZx6lOlKl28uVRn5q1l6p1bCZgc+JaE0IyK7st+GZOL5WCUHtbjpJ2ACN1uyN1Qy2upGI/70hB5KpfKHKwOkfcI3L3zj5HHTs+VfzMwjY5JqxKr8Oss6fx5yGmlqepXpRiVxuCldrSmDmUc1utgXNQQB13hyA0DVJ/jNhA65B1SlxECxEBfSsAz/InbN6a5gby6/Oa21I3YPn53ZtKorfpZfOfD2teXw8hfelS3wSn0uQ+DFMdN595bRxlzMcO9e5kCSOqQjm2P1XRwyroNK0en3jC5IxBCdcPVH0TTaxeuS80bZw6MaQe3RmB+cYc8jm7DycLHMTMvKK5hXR0RWOhBH0XIi4K15fYeuc4Y4vAhzLwl8/zz29cUrUuxm6JVT3JKFPKjfk9mrpoXsEBxEcH9je3w5LLrdlG5RSWoVo3YqVg2Us2UyQrBtP8KRvICaagVa8GhR80BxN8EnvfyGsu5H2FOsgHe0M0iAL2SNn3EISw/1qa43io+xXNrcBWzjI32bzyZgCuiIc8JSG175Q3VcJn5ZE3l9l/OyNrlEVgwb9oyBM407YuhXmIM1omJTwsAhxqYue8BeCDMzsII/KUk+2Bv5P+SVELYayN3qoM4uoWjhE3N4qoOJX7IIJMRJrMjwTqsnB2NhxQpmwuLL2hCkvjfsMITKOZ5D6xI/SAMb55knypIvNutAdUvf+u3DH5RPbPtovMGtJMJwdt1CeixdBbPkkxUQX+EoCKpHOa3xiFraclEMz1ASVETlnBTgJvt0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(36756003)(6512007)(37006003)(316002)(54906003)(6636002)(38100700002)(4744005)(122000001)(38070700005)(2906002)(33656002)(66556008)(5660300002)(6862004)(83380400001)(86362001)(66446008)(8676002)(76116006)(91956017)(8936002)(66946007)(64756008)(71200400001)(6486002)(41300700001)(4326008)(2616005)(66476007)(186003)(6506007)(53546011)(26005)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06B458A772DB284DA8DA3E6949088D37@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6226
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1680d3e0-5916-49f7-4d5f-08da90d71fc9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bpeCA/dsrmqUWc0dYvmQwVzhPPBCVWoFqOuInK7/8VcTV+ERsVoINwP9IWjq4cQpAd6IcfPJv4QtdNXpHaHW4iSw2aaDAlMcFYCo3i7s8EVIyxvcYelE6w161C0C7tHLnWpgULZS5GGIHHdmFKc6rA7aj72/oyLsFMh876H270X04nDfGuvBqodLpEgvnskOzjTtNUG21GpQcrZp/w+h8wgHZe214+Zn2H9vqcTTQg0VxkOTUc/aYBxkiO1ktOsrRIu/EI4s4tl4toDBs5xg/P+Bu23M63GK2fs2XLgvZV4/nR/VwULV9T9u4TUpU44wlAMKB4McsGVFr7Z8fdQmLTRIA7TDkghL3qEe9Msr0XaXUO1gekHEEdkyVWv3/Ij4MBjZ96Oi3us65JIwS/+0zvQLwfdbU9kDBpVvgxS1KLsZll7hVTIEM6140xMzHGTBZbYXNTgp9lXGtVjaPRXlvJC0KZx8bIvFOP3tC404kkFQqaaJOnF78migwmD9S+PKL+qiAPvAOng9XUPpcBM+EquOpKXroAfI0t80l+b5YYjKN1gnwiYW5Xxirflola/7CNge1fLQOqA0IEPxLY0OGiJ0bQOurZkIcSP9lRpjs5o6eot1gzyG6qoLljnpuB3yO+8Pbc+8hCTtV7II9iBKP2q5CY9MYV337jq47e32lbACfOQLYSCA9zapTUV7OyqWhL88Ay8WfkHp3K3vZ8NgRCuKHOpb8r7cf51GJaKxId1ceE0oM0lEUL2bFkyo62fH5HRYJk0coh73X/dqS/RBUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(40470700004)(46966006)(47076005)(186003)(6486002)(356005)(81166007)(82310400005)(36860700001)(336012)(54906003)(37006003)(6636002)(36756003)(478600001)(83380400001)(4326008)(316002)(8676002)(70586007)(70206006)(2906002)(53546011)(6512007)(26005)(40460700003)(6862004)(8936002)(5660300002)(41300700001)(33656002)(2616005)(4744005)(6506007)(86362001)(40480700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:44:59.2777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb898b-07ef-4f6e-c2bf-08da90d7282f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6569

Hi Henry,

> On 7 Sep 2022, at 14:35, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi Michal,
>=20
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>>> I am not convinced by the arguments on not using #address-cells and wil=
l
>>> leave that one to Stefano
>>>=20
>>> But in any case we should only add one pair here for sure, as you say t=
he
>>> only implication is to add a couple of 0 in the worst case.
>> I agree. The only drawback is the need to modify the already introduced
>> properties
>> to be coherent.
>=20
> You mean the #xen,static-mem-address/size-cells? I think this is the only=
 one
> existing. I can add another prerequisite patch in my series after we reac=
h an
> agreement.

No the standard device tree ones:
#address-cells
#size-cells

Those have a default value if unspecified.

Bertrand

>=20
> Kind regards,
> Henry
>=20
>>=20
>>>=20
>>> Cheers
>>> Bertrand
>>>=20
>>>>=20
>>>>>=20
>>>>> Cheers,
>>>>>=20
>>>>> --
>>>>> Julien Grall
>>>=20


