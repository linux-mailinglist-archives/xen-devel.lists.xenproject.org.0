Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDA977645F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 17:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581230.909841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlQx-00038N-Rf; Wed, 09 Aug 2023 15:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581230.909841; Wed, 09 Aug 2023 15:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlQx-00035i-OB; Wed, 09 Aug 2023 15:49:15 +0000
Received: by outflank-mailman (input) for mailman id 581230;
 Wed, 09 Aug 2023 15:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTlQx-00030I-1I
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 15:49:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 499a3d2e-36cc-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 17:49:13 +0200 (CEST)
Received: from AS9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::12) by AS8PR08MB7696.eurprd08.prod.outlook.com
 (2603:10a6:20b:523::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 15:49:10 +0000
Received: from AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::79) by AS9PR01CA0007.outlook.office365.com
 (2603:10a6:20b:540::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Wed, 9 Aug 2023 15:49:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT065.mail.protection.outlook.com (100.127.140.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 15:49:09 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Wed, 09 Aug 2023 15:49:09 +0000
Received: from a88308185d2d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ADB9FFB5-D9EC-4B0D-84FB-3CB4F75619B4.1; 
 Wed, 09 Aug 2023 15:48:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a88308185d2d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 15:48:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8703.eurprd08.prod.outlook.com (2603:10a6:150:b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 15:48:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 15:48:30 +0000
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
X-Inumbo-ID: 499a3d2e-36cc-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zanEG82qDmobUBI5W3jSbksF1KslhpUDpD/Iplyhyls=;
 b=DdgJxPfXgW9k2JKfVMKcBMHXDxagNyFaNSijMZYLaCPCppCOUAmxApFaxepIjxWRQPT+xqCjxRzBcwZR05BdTY39bIl9vmcrictGFBRtD3jQ0TlHQmFpH3hb8J9hJe8fB4DK5RrWHRgv07ZLNZBcJWkzVk2NFkGGmUyTAEKe9Gc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1d30bafb02a4ad8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUVH0J6Cb+dFrQTsQ2Z16ZJLiGbQjVSKcPrIUVfPH39fVHNHdM5YLtRv6pBsnxHXvFqW6eomoRQnYKTuDAFDuVTEnNqAl3yzbL8f6diczyW/hVa7gL+fQ2QTOQ6SRi/apifz7xmvQvyG0dXcpJrRee565A3QAlbQu0gZrLoBApiOn7tqUagqk1+16ym7LbG2TpEpDxGstaofw8X5oap7VTWI0rNpkrjl4SfQi7VnN7KfASmk+TCS/bFRotABlZ/s2yYYzMwWw92Go7QERPVc+pinJPbvcTBTTfyB3huyq8xa6u/qUZac6Dfi0nwsPk3b4jd9rYMobllpqn/ef1bV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zanEG82qDmobUBI5W3jSbksF1KslhpUDpD/Iplyhyls=;
 b=VLBUSYQpmGeHg1uQT7YRk73izw3qUxbB9klhtmP05gGpwmlklzYwuDf7saB4CDnCDxqtPp62VaZjC78Ta8gu9/WbsuEI6NKkpvjoL2ZayDrv3w1hXkTWyYjAw9UZqZzUw9vn/F4zRn6okTrhRH6dizIAb7rb87tpVTZBkmNxRKPaIPj+Jsg7n6Qa9fSUK/88GOd7q4lmdobxvnGaJZc+3pseSjcU8gdHWbWi6NLsyDk6BusjxjOeE2jSp0u5/KzJ2ejElmlasz5VF2mTCK3Di86DnbYtzswH2RiRDg9vM2xWFeq5MysTNzQLuQs+qw40flM/3k5KvrGC9JIKIIjaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zanEG82qDmobUBI5W3jSbksF1KslhpUDpD/Iplyhyls=;
 b=DdgJxPfXgW9k2JKfVMKcBMHXDxagNyFaNSijMZYLaCPCppCOUAmxApFaxepIjxWRQPT+xqCjxRzBcwZR05BdTY39bIl9vmcrictGFBRtD3jQ0TlHQmFpH3hb8J9hJe8fB4DK5RrWHRgv07ZLNZBcJWkzVk2NFkGGmUyTAEKe9Gc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 3/5] [WIP]xen/scripts: add codestyle.py script
Thread-Topic: [RFC PATCH 3/5] [WIP]xen/scripts: add codestyle.py script
Thread-Index: AQHZwStACZga8Y9XdUKITC8YuHP7fa/iLbiAgAABx4A=
Date: Wed, 9 Aug 2023 15:48:30 +0000
Message-ID: <DC51D8FF-5259-4F8E-83FC-A20F7330F038@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-4-luca.fancellu@arm.com>
 <83037c3f-ca86-d2bc-d97a-8caee2e18b39@suse.com>
In-Reply-To: <83037c3f-ca86-d2bc-d97a-8caee2e18b39@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8703:EE_|AM7EUR03FT065:EE_|AS8PR08MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f99dc7b-2d26-43b4-7799-08db98f02bb1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 57RENYwjndGgRECmr/EgPwUfbYVTjnUAE6FLVxmm2K9fMGw8Q41/TB5ymsE/xeKGGvR9MK6NeRZSVBJiucfLkJOxQU4Ula6YR+YoqyoG7QGDRbLuV901Ig5Up74qmTjMH120lmWllpV6LRrNj9fCL6qy4RuYVHhsykWPSNHbbwdDDL24fklzDmNAm9uN6Ik5dE10kA/w4lFvl+/vMz5B5A5lh4p3w9/0x3vXXXe3FLU4wz/hlu/KG5pTFTX3/+LvIPqg+fhETSjXDqoFrg8mfqPHStf0Djmjr6Wrn6D+m0KExR6MyWE4tsI7py8HUXG8q35ZeiHa7PPWOwx75GSwYjuiYy/eaIFrvnjMQbSEQ33xGyiVH3x6U7NY8fEGSk2xmWP7YYaYPvqo1Vu7LNmtzrtsJPTLtGz7cLPOVbBswzQ8AzX+K43Tovht5Ug62sPzwyo+0PfxpZAJ9hM7QqvmBpASVbmoUsVtqAy2nLzGod7fbDGzcO5+KtwjAQdnB6YTAHJEjPU0qW8WRXwzK4hfPbgZOmUL4vzE0zPuVf+RgfT3GmsA4uZyWRBaMo3XCNeCq1DRkS8YYAG6PJqSdzamRoY+XH7paPJFREVXprigx//M1lNMKTsJRcx/p0WzSPZiyHZ7iSRFujt0n1b0nXVOaQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(186006)(1800799006)(451199021)(2616005)(122000001)(478600001)(6486002)(6512007)(53546011)(6506007)(26005)(8936002)(33656002)(66476007)(66556008)(76116006)(8676002)(36756003)(4326008)(6916009)(66446008)(41300700001)(2906002)(66946007)(71200400001)(64756008)(54906003)(38100700002)(316002)(86362001)(91956017)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3DCA4330DFAC0642BEED840B6AF2D93B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8703
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b5022bc0-3455-40a8-cd6f-08db98f01462
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ljwgbVW2zFqjA93zqY9+HHOxFI+V8woW6Ed2JeFwaNVk0yNKc6wTJSCvoDMrmBGvpAQpl9Im56o44IdwY3LpYprpX4KwCjqs3s85CwOTtstVkIZAGDaZQk1YugrZ3VKvhzXrmRmFSu7qSHguwDty3lnBpaUwlAfZRdUqGRnRneQPRDPMAC699omW6jzkia6R5qNYXds6XL/O/wCfxO7Veo0iMueiO4KOWzzOLFhBnlxnEEY+/9PMz6qqp+mqjSs8OvpC8xGhZMdwM5YyOVVMzZo8qmOmq+0v8bifEAqtoKmhiK/uYI2NKwFIxmkpYWkAK0ZuXnsd3Eb7SuIlHaGUo9FNb9sWT7/dc08CwU+nu/vbZk2Uo2LhdL3JMcthTNpu9qZemraXjfXqjq6AK+DTvRgVHZhue9kEOpJ1tazPn1cEFuWHnGfjd2UZzAqT/FuUbsqkKIfK7/xK1lv4GJzFjCkTSAOqw/en0Bz5zdDhW2+OCCU4Qk2L32BjB8i4ikxDcKnXtwhFyg6aE6aFSopmJUpP3ITYqbP8d+DtOTP5Pv7tIjOP35k09gAgSksZTiyiwPcCs1sNn8mJpe4dmSbkXKtyT39G4ykqoAUYBDHTSIH09gR0WhFDp/HX0OcVj802KJJY/XBxRbkOrxerpup/jH3xfHTh01GEtlRPs/5ZSHFFuwWvxW0giECi61sxNYYwJBSxI91YqTYuv4PVvoY/5CmqpTQ8vRhnhGWqXTX9VNJK1hCu2z85ffKZcJBojNDp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(82310400008)(1800799006)(186006)(46966006)(36840700001)(40470700004)(6862004)(40480700001)(8676002)(5660300002)(8936002)(81166007)(356005)(82740400003)(2906002)(40460700003)(2616005)(86362001)(6486002)(478600001)(54906003)(6506007)(26005)(53546011)(36756003)(336012)(6512007)(33656002)(36860700001)(4326008)(41300700001)(316002)(47076005)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 15:49:09.5048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f99dc7b-2d26-43b4-7799-08db98f02bb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7696



> On 9 Aug 2023, at 16:41, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.07.2023 10:11, Luca Fancellu wrote:
>> This script finds every .c and .h file in the xen hypervisor
>> codebase, takes the exclusion list from docs/misra, removes the
>> file excluded from the list and for the remaining files is
>> calling clang-format on them.
>=20
> I was going to ask what the intended purpose is, but looking at the
> script itself I think I see the script can also be passed a set of
> file names, so it won't necessarily scan the entire code base.
> That'll make it more suitable to also be used in an incremental
> fashion (whether that's also useful to scan patches isn't really
> clear to me, but I guess that'll require yet more work).

Yes, when we will do some automation, it would be useful to just run the sc=
ript
against the touched files from a patch.
Indeed running it against the patch file is very difficult, since we are do=
ing some
pre-process and post-process that requires some context that might be missi=
ng
from the code inside the patch.

Cheers,
Luca


