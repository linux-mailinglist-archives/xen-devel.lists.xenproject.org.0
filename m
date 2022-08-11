Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C458F5A4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 03:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384096.619364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLxRQ-00033J-67; Thu, 11 Aug 2022 01:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384096.619364; Thu, 11 Aug 2022 01:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLxRQ-00031j-2G; Thu, 11 Aug 2022 01:56:56 +0000
Received: by outflank-mailman (input) for mailman id 384096;
 Thu, 11 Aug 2022 01:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSs6=YP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oLxRP-00031d-7b
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 01:56:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de295363-1918-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 03:56:51 +0200 (CEST)
Received: from AS8PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:20b:312::22)
 by AS4PR08MB7855.eurprd08.prod.outlook.com (2603:10a6:20b:51e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 01:56:49 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::6f) by AS8PR04CA0047.outlook.office365.com
 (2603:10a6:20b:312::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Thu, 11 Aug 2022 01:56:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 01:56:49 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 11 Aug 2022 01:56:49 +0000
Received: from f17c1fd1498f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E9A1EA6-4540-44EE-B0D0-43A9F74509CA.1; 
 Thu, 11 Aug 2022 01:56:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f17c1fd1498f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Aug 2022 01:56:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB4995.eurprd08.prod.outlook.com (2603:10a6:208:162::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 01:56:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.022; Thu, 11 Aug 2022
 01:56:41 +0000
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
X-Inumbo-ID: de295363-1918-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MOrCP4nmGD5Ygw0RpzFx3igSKwHfjhcwRMKj4tRy23yvs4F92A4y/kuzbUnbYVNmOTsN6denA5pwmQIM1RLy++aal1t/gOphIZJhjDJsRIWlpP29UazFGrTQ1QhBHsok8zFGlnVzlrtD+uJbFtfsTTX3yGJ0i2Zrk5xKCAeIbQJFzEB1MQRIPPx41nduyCOQ367qq1LC4gFOr+WN2Pg633ikSAvRddPmhn9XPTLXXf3qZ9Yn4ymoXxvJhBxM1J3jWrwXruu637Hqg+3F2F62kluuq4LxBHH0iMBnp7NXZcBcCESOqSdR3ue0tSAGcloxFNx2TBcPGz/ug2DzCyyeGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaU3zyVsMdNksOH9ehegYCjQ00g0JJm7zFB1U6bc190=;
 b=JLEmFWRkvn1aN2RXtvRdsTpd2ZMTzSFbDNXUbsZvZ+l3HpYQT0d/tKkFV4UYguxFoFtZyL7Ea7x2ttNJpg7vHyMMNoXQE/aviYcCB+dm8wiW7EwkeoSBwA/HASyGiP+1MQYTooAG3DdTzG3CFiRTDbNasRkYO9Nw2I4e4paw7A2ch1qdsrJbSjb+5jq9l+eliklaUvaeTndc833uZ6MLtbjG1fkOQX09Bu/njguPpHApejbd8SWM2FNk4VzB7P6rWx+im4n73V2dak3zTh6zNW4it2Z3QGDeu9peToTjE4v0dDZ1MI6PE1ZrdbHdaoG+3UGdunBehp2GCgP/XT6Abg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaU3zyVsMdNksOH9ehegYCjQ00g0JJm7zFB1U6bc190=;
 b=3wRiE9zWbu+kew6meU70QQkc7YHOH4BVaUc3YpUbXW1TUqJO6IZfZ/Yyjnlyg69cM9HMJ8tIjQAJGkjcyWdspr7JcJVcj7Ba2LXclrVzw97fUVFbxrXxeLZ4hhtLMzGtc65pyXbGqkgN3eY1VuFBvtsvVB04rirpKf+Mf+vrulg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmZ7wDCV0H5fo3qhORkPeQfz27eLqxkgrl3esRo2AWrpEXpRcvNzassUec79EXnmvUXfy8Pe09UjepULfNA5Gq7tto1GmBonNCocSGOwO0jWcYyd9/IYfZKgBbDsQ3W4C0+3OkT2dyznB1SkFTAZktNRy6mPcVQMp2Y9sEIGdfz4TVO10OEUdFbEnsBzzA4WQ0tMHXTtbxTLrZFlchtjS5Ic+6EBlePwFiZhxND+1G8IPBsBQODFg8Rz3phA8OS5+IPGjAcjkuh/nfmY8NhHnzDX4TrhtFrlSY85SKxZEjgF4q2o6YJa+TMOPh9yIDu6ypvlVmPfglQ0OmqJLioVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaU3zyVsMdNksOH9ehegYCjQ00g0JJm7zFB1U6bc190=;
 b=f9K8VIfhEExPRiNMBf6QUpw/gHVuoUYSb13JZZiTnIxr1zaT5+oUQ0GSKDfpi1gWC6QhX12DXwSRV+/lR8YJrSMCiXnxs1WMpSaoEfomPXX4FSZO9LBiZls+AZgpwlekJUHY88vihVgNEgdC+GSItBrJRuonxCwfAvYGhuiVYwk6299hZgez5/IB6k6ZtGtz7BZ/vZp5iSuWEWv0lecCUKhCumWnWToIMozMqB1nn2Jwuy1mSQzBSAcS6jUXWExh3H81aqXmrgFvQ/xcrR56Tv+Q9LQkjjqIu6zFk+EGKMofFdd4mRaBXwK/ajDJeV0dvGQ60x+eqb0ja4u9LUCfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaU3zyVsMdNksOH9ehegYCjQ00g0JJm7zFB1U6bc190=;
 b=3wRiE9zWbu+kew6meU70QQkc7YHOH4BVaUc3YpUbXW1TUqJO6IZfZ/Yyjnlyg69cM9HMJ8tIjQAJGkjcyWdspr7JcJVcj7Ba2LXclrVzw97fUVFbxrXxeLZ4hhtLMzGtc65pyXbGqkgN3eY1VuFBvtsvVB04rirpKf+Mf+vrulg=
From: Henry Wang <Henry.Wang@arm.com>
To: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>
Subject: RE: [PATCH v2 13/13] CHANGELOG: Add Intel HWP entry
Thread-Topic: [PATCH v2 13/13] CHANGELOG: Add Intel HWP entry
Thread-Index: AQHYrO+y52qVsVi890iQZz0G1Doa+62o8LUA
Date: Thu, 11 Aug 2022 01:56:41 +0000
Message-ID:
 <AS8PR08MB79915E06D2B08A2A2AB2EB8192649@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
 <20220810192944.102135-14-jandryuk@gmail.com>
In-Reply-To: <20220810192944.102135-14-jandryuk@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 59F71D8B99E12D498E793DAA11065946.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7d4332d3-bead-496a-996c-08da7b3cc0ec
x-ms-traffictypediagnostic:
	AM0PR08MB4995:EE_|AM5EUR03FT058:EE_|AS4PR08MB7855:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lFCfFweC4ANU5ZAT2reGyluDB8mTLEreIWD7KuO60J6vZ0ndxCENehvPXp8jEJAWjB9gW2IbZ0pJmbM65xwyitDd6t46C6p3/A7skG38ckIMDtj6Kr9rig5EwTZ3QamMUJ+7n4nxDnfBEetHe1Yci0nH2Fw11pZjJ8bezu79sDNf/H8MdgljyHqzE6cptGmNSRsPj7L2iJXtRjB8NuGZBMB3mgP1MzZYwPwuWeI1bauZnqqeY7mjDnKJZzJkg34xJwP2Py4A7W45X0Z8PWZ8ePW/pz9JUS8fULVxy8oU2d3dTwc52Z7NKVi9Wh/B55wdNYBnIZvMcP1iXftHsnGK0OpZpHQd3YkNSh8HnD7XfkBPwIrqFgh/sQ/IzMzkaHHeC+JHOiYwS52i/IHH9hg0px1phDMJmQkKKfbp+b9tp1rP4SiMxkXcA6XX/uhY5txpzVJwJCj6tpGTI6AGiefqjxYj0A/zXa50UYh+zswXTAvPHMCSh+w0Tti3BNnU5imImgiVIZVucnhfEv28qAe59h1/g5J1KyH9DzB1QL080m+R0xN2YcmWnmTKWouz6elowBnWHu5k2nvBQJL0+YF9dRJ26Xd6CFdnucdeHkRoAIcV9Y9fQzXJVD1+19h7fgbKRIJYpve5xYaNnoJ92aSAydvZK8+vDNpS9XyCE4gvDQIF0uO5URZR9xw0Zd/bPtI/D47FpyHoS2UYQU28fk9fbJY5bgqjXaZBt/2GwnSQ+pWJfOIZEZxttUXsfYeu5JvArdQOf6oMVxK2HFqnatKTlsA3mI85RfOdQxstdrB+/ZQUKvPJrfhqFQpjUATQ2ZEMG/ugaBjIFRnIT5PwA0LUY8D6uOQNs5cJwjIUHNY6gMcCZmQSsvgNRcYHqb0k9SzQ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(55016003)(26005)(86362001)(186003)(7696005)(9686003)(6506007)(66946007)(38100700002)(122000001)(38070700005)(66556008)(66446008)(4326008)(41300700001)(64756008)(66476007)(83380400001)(8676002)(33656002)(5660300002)(2906002)(52536014)(8936002)(76116006)(71200400001)(478600001)(558084003)(110136005)(316002)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4995
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e67384a0-9d00-4aa6-d278-08da7b3cbc29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AVd50tP+qyFG9tihRAnwitPt/vljqOdj3WDqW1EAL112uaQwb6PKLZz2yuLE7FpRomZRUEZvf3j/CShsqKeWASnWIQL5uRqysxq1NeAIZmDKBxYamYeY1fcBcJg13LnXBammPqLOtstvOuArIuydVRmbzOIC2TE090lbXdrJRcK3IAa0RBO876Xm0TdsgWI0ZzkeJkWX7do3KqJrec4vO/llciLu9mKu0KBquglNTJKaGcxg4xdm2UupQOw1q/ac+XoLm8o/H6e+KkBv+Zc6q+K6McD0fsUDEWUDOyRAL4bi9b2vVXVPMnUZDZPqrMcKHHbodVXcTx74+TtORGQJEUXhMvk7hIitU7g6grS6+dwMpXkpZTtVasATsH5g6CjuqhECFThZXa+4q/VvdsPF7Dq+l4x/7IP36tV1rpLn2CdYHqm3fGYjYV89TpkwaGXnF9mBI6L1r5OAKu3ypfjDPebUppiekLzRaVU3UHcLvxJGwGtFxH0x7aINwRBoh9uhYkbLwH3+nCscorg21rraf82jvzh1RU1raAixq33iPcKufHnQPa+Jgv/1co0io/1JYbqt0tfsV4HzsZOjHHoWLnlCYSMM14SxITvrX12IHrIDvug/81hCotzI65DnQpaO/qg0IEoO73JaYnFKtvkbW2uYy2xuWvbIkP7Z5ozTSqSRcP2fANIFArmS7DmmuZAu1HagsmoK5eadOS1JJnMfLI/NnNbwjQf4oTfRVapmTE4DUJmL76ESfetIs9N12XZDD8Yikn3vtobwle4iyLV/uizY2sf2co9ac4reSAWuGRvMn0zad3pys8wpfv6SDOq2v4OhocOPuH8FLe9Hf+Ff4J37tSa42ZjL64wZcCqMhALjjqj6aa0uq+yHQVONz0YRG+V6thSJzeNn8Hpzl+Xb7A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(40470700004)(36840700001)(46966006)(9686003)(26005)(110136005)(6506007)(2906002)(7696005)(478600001)(41300700001)(558084003)(33656002)(86362001)(316002)(40460700003)(356005)(82740400003)(81166007)(47076005)(186003)(336012)(70206006)(70586007)(82310400005)(83380400001)(52536014)(8676002)(4326008)(55016003)(40480700001)(5660300002)(8936002)(36860700001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 01:56:49.0742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4332d3-bead-496a-996c-08da7b3cc0ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7855

Hi Jason,

> -----Original Message-----
> From: Jason Andryuk <jandryuk@gmail.com>
> Subject: [PATCH v2 13/13] CHANGELOG: Add Intel HWP entry
>=20
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Thanks for the patch,

Acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

