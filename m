Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F4D62F590
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445757.701118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow17X-0006BH-J2; Fri, 18 Nov 2022 13:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445757.701118; Fri, 18 Nov 2022 13:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow17X-00068e-G1; Fri, 18 Nov 2022 13:09:27 +0000
Received: by outflank-mailman (input) for mailman id 445757;
 Fri, 18 Nov 2022 13:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pIy2=3S=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ow17V-0005xA-KR
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:09:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38b0e6f9-6742-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 14:09:24 +0100 (CET)
Received: from AS8P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::21)
 by AM8PR08MB6577.eurprd08.prod.outlook.com (2603:10a6:20b:355::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Fri, 18 Nov
 2022 13:09:21 +0000
Received: from VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::cc) by AS8P251CA0004.outlook.office365.com
 (2603:10a6:20b:2f2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19 via Frontend
 Transport; Fri, 18 Nov 2022 13:09:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT046.mail.protection.outlook.com (100.127.144.113) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 13:09:20 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Fri, 18 Nov 2022 13:09:20 +0000
Received: from f5958f5a1aa1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44590639-1942-463C-BF0D-EC28D853E384.1; 
 Fri, 18 Nov 2022 13:09:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5958f5a1aa1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 13:09:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7654.eurprd08.prod.outlook.com (2603:10a6:20b:4f0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 13:09:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5834.007; Fri, 18 Nov 2022
 13:09:12 +0000
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
X-Inumbo-ID: 38b0e6f9-6742-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSkVDnZRk6GYOMvQGLduC9jeeH+3aaFcStTq6iQN1kk=;
 b=U/ohzwQsB/O2I9QJeLotjv4XeQsHWV+s5dJ1nc1/8QKQ7cshEWWu6E7WHv0wg5hJ1u5X5SRpQOAwT5czGnR7bw4gWgh0X73foXRKbosGdjwXH3oq8cUbfufauOEMMoO5OpVtiszmpnpK/unNY9IX7GfLYBDYcjGLyXb+QSNhgcA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98494a77e4082d13
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAAQ7POtbyWINABso6pRlF2nG3ND8j+V/XBgN9hCKWLV05zYAqMMaB92VqJaGcoX1eFA5oMVFqNs0UQhlLEeq5ziaPXM4aJnUv6MZBA+t+6UYuOtFws1dupJccxkuPq/fDuvXwE9bw7p0oHC4TFd/9wPe2+6Cl3ptkV8TguZRUvpe7wFZRoydBDQuuTdBpKOc5+boUThlKDrsM7xTLP2jGzBoXObZGmWpG303cldH23paHPl802Jf3dB3kQVBfEIn/dGReJf9YI7ySsE3k7+JmyGIfjHQBcywxfmD0gRdp7ku10r5ZeP9CX6BoKflmH4Et1sWdI2NucDKhM3l4+kuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSkVDnZRk6GYOMvQGLduC9jeeH+3aaFcStTq6iQN1kk=;
 b=FQ7eIDSEHMxPCCfVX4FxRrs8zDsSV8eMWKpg3E3jrQZHR+KcdcnA5EQnQSwpYjViJTlUaS5lYTC2zHg4mJJxuKOGvo/AdIVN2zGoomUuTFMEkapFsQOhR14/5HFs431S4LXC/xAQwCfjNr1lVe2J1u16bFs2ybmDe9QBbSdgC8nwk6XP/eN0L6IhzSGVKNFvgwnDyPePogiMIab273blgFdBNh3K48SOIvqWp/PaUwdqTHe3ov2fCX10ZQasIiynELYbk+HvceQqCFYhpdfFm2RajmIT1GPFqxH/MM5hQEZzf2E81pmdimRI8Ei96nmtatHgmV1OEL69HbcWEam5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSkVDnZRk6GYOMvQGLduC9jeeH+3aaFcStTq6iQN1kk=;
 b=U/ohzwQsB/O2I9QJeLotjv4XeQsHWV+s5dJ1nc1/8QKQ7cshEWWu6E7WHv0wg5hJ1u5X5SRpQOAwT5czGnR7bw4gWgh0X73foXRKbosGdjwXH3oq8cUbfufauOEMMoO5OpVtiszmpnpK/unNY9IX7GfLYBDYcjGLyXb+QSNhgcA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/3] automation: Add a clean rule for containers
Thread-Topic: [PATCH v4 2/3] automation: Add a clean rule for containers
Thread-Index: AQHY+mi0wlvynKbFO0CQN7pfcZf/NK5EYyiAgABF7IA=
Date: Fri, 18 Nov 2022 13:09:11 +0000
Message-ID: <DBBDA207-2C7B-452B-9697-EE178161B9D4@arm.com>
References: <cover.1668677493.git.bertrand.marquis@arm.com>
 <3a127e836d744fbb2954690293ee47d2c0c899e2.1668677493.git.bertrand.marquis@arm.com>
 <f7c65c1f-c566-af6f-e1c3-c1c27e5abeea@amd.com>
In-Reply-To: <f7c65c1f-c566-af6f-e1c3-c1c27e5abeea@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB7654:EE_|VI1EUR03FT046:EE_|AM8PR08MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fe6038-fedc-4e0e-4498-08dac9661b44
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C1xXHJ/peVCEadZA+P86uYKn65UJrAlwOYr7vY//y6NRQfxoZfnZ+CPixN6n8knBlpM/E08dp/KVWM1pVomyQwIxCYXqQ0P4GgyEAVOfSCvH1hOf/0Wq8CYIntxVhAyLyXl5vLNd6VBZKvXpH+IbXJH38CgquOuJgqii4Dt0WWtJNuWyORC/3INZVGj8kFs8LOTLFDUJlplT2O5aL+IkRhpEoAbbs2+4AXkk3wqlpnLbW//xB9mF/z2tOjkxnHMvHS5wxEdoDTXlKDe8tlSF3eAZCL+kjGHOd/pcaZDNOujUEG3G4sKOcJlFOVtfWWfBrM1WNK2ewKS62jLPYgd/HndgqKF6AOe7jfSygDpmTCF7xBhURdjQlibxkx7ifNnzfTn52yHL1hnJKqOs0UFyfDciKqdkbAMp5/VkJoreB9LsNIXr9M4BzgRQ6QBlZS3RPuTEbSLosvDDhcXG9A8jZIZovDH9uFaV0H+eq6SCReTW+zUoqFmn8Dp80wGu+ZxtuFafQv1a/yNq9CaCIn49myoIQ9EWJtwgCQeeFDOXCwRK4ZpuUOpVN502061NZglI2UY096JCRZY9VpttmeQkzdZlaJIoWx9OSnXT/XeWqwDzV3AvyAU7LxZz3tmwwOCgKOCVUjwTqdvIbW/BesHTM8OvhJc7zNS0IUWosGQgHxFCsqEY1/YCkOZpnsOBEchAN8w5xyrDQFvC/N/1RSZDzR2QPEjNMZwNbpo+Jg4UW60=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199015)(33656002)(36756003)(38100700002)(316002)(8936002)(2906002)(4326008)(38070700005)(4744005)(122000001)(86362001)(66556008)(66946007)(6916009)(91956017)(186003)(2616005)(6486002)(478600001)(66446008)(41300700001)(6506007)(64756008)(8676002)(66476007)(54906003)(5660300002)(26005)(71200400001)(6512007)(76116006)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C682DF73912C541869624FC352281B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7654
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b4981802-c659-4312-7939-08dac96615ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E45xYMWKIoiGViQbneP5j2FHkPXi1F27XqJDcFBB5pJTJsv7iGJlMQcuzZ+7mMfBLnsxm6tbA4A1Mv6LPsIgq/lyDDfoHVqYxyXGGGnHwLh6pD+j3oSgzl+nW4mJFRHS0UMnD/JhcFeG9V0zLEDrZkKs/VKKxjdVF+Npi/MaJuRHSSCHySeCxa7k79qaoMuOQTH2aszElZa+3wanTydeFEmjjp8FAX74/QpC05qECiSbEGbpPGd9Ve9h0m3XAA5O6CcboeQn4cUPw+CdytvUxcOR8Cfw5fgl/VagdelfLijlVi/fb1WIEbWlwPW3TcNx3Op/i6HiIBk4jCiIVjhzA7rTmvEjzrWX+39TiMCjwvV5wCZkS/lzKNOOi4ipcJj0Lxuhyy8EooSSI13rvSi3CaSdWkZNwku++qZIna/MOnHhDwkblG+uNdfbuv33IIonSQgvKSO0rHhS7vfs83ETY36jTvqFvYxhErvO+ocg3oQDf6qDJ1v2y5hEgEIFKou2QkNztaI56FBQqA21ZZu4aXQnxvA2K9TklF8TOXA6Cdz8v9lxmeRd7wc7rHZd3gF19J5eO7B2Hp6jQN+jka+mXtIhRUUQ8hR8RsY4wiSucDayJF/oGQVspCVnBpxCJoVMh3kBL23hc5lJfSzvXGewfDMUzhwsYMdge5i8FsdFHJb7CbNAdp84QqH+oAWvVbYdA8+mWOkhqZcWrzG2U0DBVA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(70206006)(70586007)(5660300002)(6862004)(4744005)(8936002)(81166007)(4326008)(26005)(6506007)(8676002)(41300700001)(6512007)(33656002)(336012)(316002)(186003)(36860700001)(36756003)(40460700003)(54906003)(86362001)(107886003)(82740400003)(53546011)(356005)(40480700001)(82310400005)(478600001)(47076005)(2616005)(2906002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:09:20.6558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fe6038-fedc-4e0e-4498-08dac9661b44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6577

Hi Michal,

> On 18 Nov 2022, at 08:58, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> On 17/11/2022 10:39, Bertrand Marquis wrote:
>>=20
>>=20
>> Add make clean support to remove the containers from the local docker
>> registry:
> I have to say that I am a bit scared of adding a clean rule.
> make clean is something that can easily sneak into this directory and can
> remove the yocto images that we had to spent several hours to build.
> The accidental clean can have severe consequences :)
>=20
> In any case, if we want to add such possibility I would stick to calling =
always:
> make clean-<image>
> and remove the option to call "make clean" to remove all the images.

Make sense, I will remove those to be automatically called from make clean

Cheers
Bertrand

>=20
> ~Michal


